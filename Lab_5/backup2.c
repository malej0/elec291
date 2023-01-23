#include <stdio.h>
#include <at89lp51rd2.h>

 
#define CLK 22118400L
#define BAUD 115200L
#define ONE_USEC (CLK/1000000L) // Timer reload for one microsecond delay
#define BRG_VAL (0x100-(CLK/(16L*BAUD)))

#define ADC_CE  P2_0
#define BB_MOSI P2_1
#define BB_MISO P2_2
#define BB_SCLK P2_3

#define LCD_RS P3_2
// #define LCD_RW PX_X // Not used in this code, connect the pin to GND
#define LCD_E  P3_3
#define LCD_D4 P3_4
#define LCD_D5 P3_5
#define LCD_D6 P3_6
#define LCD_D7 P3_7
#define CHARS_PER_LINE 16
#define button P0.6

unsigned char SPIWrite(unsigned char out_byte)
{
	// In the 8051 architecture both ACC and B are bit addressable!
	ACC=out_byte;
	
	BB_MOSI=ACC_7; BB_SCLK=1; B_7=BB_MISO; BB_SCLK=0;
	BB_MOSI=ACC_6; BB_SCLK=1; B_6=BB_MISO; BB_SCLK=0;
	BB_MOSI=ACC_5; BB_SCLK=1; B_5=BB_MISO; BB_SCLK=0;
	BB_MOSI=ACC_4; BB_SCLK=1; B_4=BB_MISO; BB_SCLK=0;
	BB_MOSI=ACC_3; BB_SCLK=1; B_3=BB_MISO; BB_SCLK=0;
	BB_MOSI=ACC_2; BB_SCLK=1; B_2=BB_MISO; BB_SCLK=0;
	BB_MOSI=ACC_1; BB_SCLK=1; B_1=BB_MISO; BB_SCLK=0;
	BB_MOSI=ACC_0; BB_SCLK=1; B_0=BB_MISO; BB_SCLK=0;
	
	return B;
}

unsigned char _c51_external_startup(void)
{
	AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O

	P0M0=0x00; P0M1=0x00;    
	P1M0=0x00; P1M1=0x00;    
	P2M0=0x00; P2M1=0x00;    
	P3M0=0x00; P3M1=0x00;    
    PCON|=0x80;
	SCON = 0x52;
    BDRCON=0;
    #if (CLK/(16L*BAUD))>0x100
    #error Can not set baudrate
    #endif
    BRL=BRG_VAL;
    BDRCON=BRR|TBCK|RBCK|SPD;
    
	CLKREG=0x00; // TPS=0000B

    return 0;
}

void wait_us (unsigned char x)
{
	unsigned int j;
	
	TR0=0; // Stop timer 0
	TMOD&=0xf0; // Clear the configuration bits for timer 0
	TMOD|=0x01; // Mode 1: 16-bit timer
	
	if(x>5) x-=5; // Subtract the overhead
	else x=1;
	
	j=-ONE_USEC*x;
	TF0=0;
	TH0=j/0x100;
	TL0=j%0x100;
	TR0=1; // Start timer 0
	while(TF0==0); //Wait for overflow
	
}

void waitms (unsigned int ms)
{
	unsigned int j;
	unsigned char k;
	for(j=0; j<ms; j++)
		for (k=0; k<4; k++) wait_us(250);
}



/*Read 10 bits from the MCP3008 ADC converter*/
unsigned int volatile GetADC(unsigned char channel)
{
	unsigned int adc;
	unsigned char spid;

	ADC_CE=0; //Activate the MCP3008 ADC.
	
	SPIWrite(0x01);//Send the start bit.
	spid=SPIWrite((channel*0x10)|0x80);	//Send single/diff* bit, D2, D1, and D0 bits.
	adc=((spid & 0x03)*0x100);//spid has the two most significant bits of the result.
	spid=SPIWrite(0x00);//It doesn't matter what we send now.
	adc+=spid;//spid contains the low part of the result. 
	
	ADC_CE=1; //Deactivate the MCP3008 ADC.
		
	return adc;
}

void LCD_pulse (void)
{
	LCD_E=1;
	wait_us(40);
	LCD_E=0;
}

void LCD_byte (unsigned char x)
{
	// The accumulator in the 8051 is bit addressable!
	ACC=x; //Send high nible
	LCD_D7=ACC_7;
	LCD_D6=ACC_6;
	LCD_D5=ACC_5;
	LCD_D4=ACC_4;
	LCD_pulse();
	wait_us(40);
	ACC=x; //Send low nible
	LCD_D7=ACC_3;
	LCD_D6=ACC_2;
	LCD_D5=ACC_1;
	LCD_D4=ACC_0;
	LCD_pulse();
}

void WriteData (unsigned char x)
{
	LCD_RS=1;
	LCD_byte(x);
	waitms(2);
}

void WriteCommand (unsigned char x)
{
	LCD_RS=0;
	LCD_byte(x);
	waitms(5);
}

void LCD_4BIT (void)
{
	LCD_E=0; // Resting state of LCD's enable is zero
	//LCD_RW=0; // We are only writing to the LCD in this program
	waitms(20);
	// First make sure the LCD is in 8-bit mode and then change to 4-bit mode
	WriteCommand(0x33);
	WriteCommand(0x33);
	WriteCommand(0x32); // Change to 4-bit mode

	// Configure the LCD
	WriteCommand(0x28);
	WriteCommand(0x0c);
	WriteCommand(0x01); // Clear screen command (takes some time)
	waitms(20); // Wait for clear screen command to finsih.
}

void LCDprint(char * string, unsigned char line, bit clear)
{
	int j;

	WriteCommand(line==2?0xc0:0x80);
	waitms(5);
	for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
}

void main (void)  //using ch0 and ch2 for the sin signals 
{
	#define VLED 2.03673 // Measured with multimeter
	#define VREF 4.096
    float half_period0;
    float half_period1;
	float qPeriod0;
	float time0;
	float time1;
	float qPeriod1; 
    int OVcnt;
    int OVcnt1;
	float pVolt0;
	float pVolt1;
	float pVolt0rms;
	float pVolt1rms;
	float timeDiff;
	float phase;
	float timeDiffsec;
	float freq;
	//waitms(500);	
	
	char voltage0[16]; //buffer arrays for displaying the values into the LCD
	char secondrow[16];
	//char frequency[4];
	//Vdd=VLED*1023/GetADC(7);
	//Vdd=4.09622*1023.0/GetADC(6);
	//printf("Vdd=%5.3f\n", Vdd);
	
    
    //timer 0 is measuring half period of signal 
    TMOD&=0B_1111_0000; // Clear the configuration bits for timer 0
    TMOD|=0B_0000_0001; // Mode 1: 16-bit timer
   
    //timer 0  is also  measuring half period of signal from ch2
	LCD_4BIT();


	
	while(1)
	{
		LCDprint(voltage0,1,1);
		LCDprint(secondrow,2,1);
		TR0=0;
		TF0=0; // Clear overflow flag
        TL0=0; // Reset the timer
        TH0=0;
        OVcnt=0;
        while (GetADC(0)>2); // Wait for the signal to be zero/ / 
        while (GetADC(0)<4); // Wait for the signal to be one
        TR0=1; // Start timing
		//here is where the delay between the signals is calculated
		while (GetADC(3)>2){  //times while signal is above zero
				if (TF0){
        		TF0=0;
        		OVcnt++;
        	}
		}
		while (GetADC(3)<4){ // continues timing until signal reaches zero cross
			if (TF0){
        		TF0=0;
        		OVcnt++;
        	}
		} // Wait for the signal to be one
        TR0=0; // Stop timer 0
        
        timeDiff=OVcnt*65536.0+TH0*256.0+TL0; // getting value of time right at the other zero cross			units of 1/clk
		timeDiffsec = (timeDiff/22118.400); //now the time difference is in milliseconds 

		







	  // Measure half period at ADC CH0 using timer 0
        TF0=0; // Clear overflow flag
        TL0=0; // Reset the timer
        TH0=0;
        OVcnt=0;
        while (GetADC(0)>2); // Wait for the signal to be zero
        while (GetADC(0)<4); // Wait for the signal to be one
        TR0=1; // Start timing
        while (GetADC(0)>2) // Wait for the signal to be zero   
        {
        	if (TF0){
        		TF0=0;
        		OVcnt++;
        	}
        }
        TR0=0; // Stop timer 0
        
        half_period0=OVcnt*65536.0+TH0*256.0+TL0; // half_period is a float and is in units of 1/clk. To convert, divide by clk
		qPeriod0 = half_period0/2.0;
	
		TF0 = 0;
		TL0 = 0;
		TH0 = 0;
		OVcnt=0;
		while (GetADC(0)>2); // Wait for the signal to be zero
        while (GetADC(0)<4); // Wait for the signal to be one
        TR0 = 1;
		while((OVcnt*65536.0+TH0*256.0+TL0)<qPeriod0){
			if (TF0){
        		TF0=0;
        		OVcnt++;     		
        	}	
		}
		TR0 = 0;
		pVolt0=(GetADC(0)*VREF)/1023.0;
		pVolt0rms = pVolt0/1.41421356237;
		time0 = (half_period0/22118.400)*2.0; //period in milliseconds
		freq = 1/(time0/1000);  
		sprintf(voltage0,"1:%4.2frms %4.1fHz",pVolt0rms,freq);
		
	
    
   
   // Measure half period at ADC CH2 using timer 0
         // Measure half period at ADC CH2 using timer 0
        TF0=0; // Clear overflow flag
        TL0=0; // Reset the timer
        TH0=0;
        OVcnt1=0;
        while (GetADC(3)>2); // Wait for the signal to be zero
        while (GetADC(3)<4); // Wait for the signal to be one
        TR0=1; // Start timing
        while (GetADC(3)>2) // Wait for the signal to be zero   
        {
        	if (TF0){
        		TF0=0;
        		OVcnt1++;
        	}
        }
        TR0=0; // Stop timer 0
        
        half_period1=OVcnt1*65536.0+TH0*256.0+TL0; // half_period is a float and is in units of 1/clk. To convert, divide by clk
		qPeriod1 = half_period1/2.0;
		TR0 = 0;
		TF0 = 0;
		TL0 = 0;
		TH0 = 0;
	
		OVcnt1=0;
		while (GetADC(3)>2); // Wait for the signal to be zero
        while (GetADC(3)<4); // Wait for the signal to be one
        TR0 = 1;
		while((OVcnt1*65536.0+TH0*256.0+TL0)<qPeriod1){
			if (TF0){
        		TF0=0;
        		OVcnt1++;     		
        	}	
		}
		TR0 = 0;
	
		pVolt1=(GetADC(3)*VREF)/1023.0; //converting adc value into voltage
		time1 = (half_period1/22118.400)*2.0; //period in milliseconds
		pVolt1rms = pVolt1/1.41421356237; 
		phase = timeDiffsec*(360.0/time0); //phase in degrees 
		if(phase>180){
			phase = phase-360.0;
			sprintf(secondrow,"3:%4.2frms %4.2f\xDF""",pVolt1rms,phase);
			if(phase<0.0){
				if(phase < -20.0){
				phase = phase - 5.0;
				sprintf(secondrow,"3:%4.2frms %4.2f\xDF""",pVolt1rms,phase);
				}
				else if(phase > -20 && phase < 0.0){
					phase = phase - 3.0;
					sprintf(secondrow,"3:%4.2frms %4.2f\xDF""",pVolt1rms,phase);
				}
			}
		}
		else 
		sprintf(secondrow,"3:%4.2frms %4.2f\xDF""",pVolt1rms,phase);
		
		
		
		printf("channel 0 period(ms):%5.3f\n", time0);
		printf("channel 0 voltage(rms):%5.3f\n", pVolt0rms);
		printf("channel 3 period(ms):%5.3f\n", time1);
		printf("channel 3 voltage(rms):%5.3f\n", pVolt1rms);
		printf("phase (degrees): %5.3f\n",phase);



		

	}
}
