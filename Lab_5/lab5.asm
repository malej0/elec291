;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Fri Mar 11 09:49:58 2022
;--------------------------------------------------------
$name lab5
$optc51 --model-small
$printf_float
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _LCDprint
	public _LCD_4BIT
	public _WriteCommand
	public _WriteData
	public _LCD_byte
	public _LCD_pulse
	public _GetADC
	public _waitms
	public _wait_us
	public __c51_external_startup
	public _SPIWrite
	public _LCDprint_PARM_3
	public _LCDprint_PARM_2
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_B              DATA 0xf0
_PSW            DATA 0xd0
_SP             DATA 0x81
_SPX            DATA 0xef
_DPL            DATA 0x82
_DPH            DATA 0x83
_DPLB           DATA 0xd4
_DPHB           DATA 0xd5
_PAGE           DATA 0xf6
_AX             DATA 0xe1
_BX             DATA 0xf7
_DSPR           DATA 0xe2
_FIRD           DATA 0xe3
_MACL           DATA 0xe4
_MACH           DATA 0xe5
_PCON           DATA 0x87
_AUXR           DATA 0x8e
_AUXR1          DATA 0xa2
_DPCF           DATA 0xa1
_CKRL           DATA 0x97
_CKCKON0        DATA 0x8f
_CKCKON1        DATA 0xaf
_CKSEL          DATA 0x85
_CLKREG         DATA 0xae
_OSCCON         DATA 0x85
_IE             DATA 0xa8
_IEN0           DATA 0xa8
_IEN1           DATA 0xb1
_IPH0           DATA 0xb7
_IP             DATA 0xb8
_IPL0           DATA 0xb8
_IPH1           DATA 0xb3
_IPL1           DATA 0xb2
_P0             DATA 0x80
_P1             DATA 0x90
_P2             DATA 0xa0
_P3             DATA 0xb0
_P4             DATA 0xc0
_P0M0           DATA 0xe6
_P0M1           DATA 0xe7
_P1M0           DATA 0xd6
_P1M1           DATA 0xd7
_P2M0           DATA 0xce
_P2M1           DATA 0xcf
_P3M0           DATA 0xc6
_P3M1           DATA 0xc7
_P4M0           DATA 0xbe
_P4M1           DATA 0xbf
_SCON           DATA 0x98
_SBUF           DATA 0x99
_SADEN          DATA 0xb9
_SADDR          DATA 0xa9
_BDRCON         DATA 0x9b
_BRL            DATA 0x9a
_TCON           DATA 0x88
_TMOD           DATA 0x89
_TCONB          DATA 0x91
_TL0            DATA 0x8a
_TH0            DATA 0x8c
_TL1            DATA 0x8b
_TH1            DATA 0x8d
_RL0            DATA 0xf2
_RH0            DATA 0xf4
_RL1            DATA 0xf3
_RH1            DATA 0xf5
_WDTRST         DATA 0xa6
_WDTPRG         DATA 0xa7
_T2CON          DATA 0xc8
_T2MOD          DATA 0xc9
_RCAP2H         DATA 0xcb
_RCAP2L         DATA 0xca
_TH2            DATA 0xcd
_TL2            DATA 0xcc
_SPCON          DATA 0xc3
_SPSTA          DATA 0xc4
_SPDAT          DATA 0xc5
_SSCON          DATA 0x93
_SSCS           DATA 0x94
_SSDAT          DATA 0x95
_SSADR          DATA 0x96
_KBLS           DATA 0x9c
_KBE            DATA 0x9d
_KBF            DATA 0x9e
_KBMOD          DATA 0x9f
_BMSEL          DATA 0x92
_FCON           DATA 0xd2
_EECON          DATA 0xd2
_ACSRA          DATA 0xa3
_ACSRB          DATA 0xab
_AREF           DATA 0xbd
_DADC           DATA 0xa4
_DADI           DATA 0xa5
_DADL           DATA 0xac
_DADH           DATA 0xad
_CCON           DATA 0xd8
_CMOD           DATA 0xd9
_CL             DATA 0xe9
_CH             DATA 0xf9
_CCAPM0         DATA 0xda
_CCAPM1         DATA 0xdb
_CCAPM2         DATA 0xdc
_CCAPM3         DATA 0xdd
_CCAPM4         DATA 0xde
_CCAP0H         DATA 0xfa
_CCAP1H         DATA 0xfb
_CCAP2H         DATA 0xfc
_CCAP3H         DATA 0xfd
_CCAP4H         DATA 0xfe
_CCAP0L         DATA 0xea
_CCAP1L         DATA 0xeb
_CCAP2L         DATA 0xec
_CCAP3L         DATA 0xed
_CCAP4L         DATA 0xee
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_P              BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES             BIT 0xac
_ET2            BIT 0xad
_EC             BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS             BIT 0xbc
_PT2            BIT 0xbd
_IP0D           BIT 0xbf
_PPCL           BIT 0xbe
_PT2L           BIT 0xbd
_PLS            BIT 0xbc
_PT1L           BIT 0xbb
_PX1L           BIT 0xba
_PT0L           BIT 0xb9
_PX0L           BIT 0xb8
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P2_7           BIT 0xa7
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_5           BIT 0xb5
_P3_6           BIT 0xb6
_P3_7           BIT 0xb7
_RXD            BIT 0xb0
_TXD            BIT 0xb1
_INT0           BIT 0xb2
_INT1           BIT 0xb3
_T0             BIT 0xb4
_T1             BIT 0xb5
_WR             BIT 0xb6
_RD             BIT 0xb7
_P4_0           BIT 0xc0
_P4_1           BIT 0xc1
_P4_2           BIT 0xc2
_P4_3           BIT 0xc3
_P4_4           BIT 0xc4
_P4_5           BIT 0xc5
_P4_6           BIT 0xc6
_P4_7           BIT 0xc7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_SM2            BIT 0x9d
_SM1            BIT 0x9e
_SM0            BIT 0x9f
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_CP_RL2         BIT 0xc8
_C_T2           BIT 0xc9
_TR2            BIT 0xca
_EXEN2          BIT 0xcb
_TCLK           BIT 0xcc
_RCLK           BIT 0xcd
_EXF2           BIT 0xce
_TF2            BIT 0xcf
_CF             BIT 0xdf
_CR             BIT 0xde
_CCF4           BIT 0xdc
_CCF3           BIT 0xdb
_CCF2           BIT 0xda
_CCF1           BIT 0xd9
_CCF0           BIT 0xd8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_LCDprint_PARM_2:
	ds 1
_main_half_period0_1_46:
	ds 4
_main_half_period1_1_46:
	ds 4
_main_qPeriod0_1_46:
	ds 4
_main_time0_1_46:
	ds 4
_main_time1_1_46:
	ds 4
_main_qPeriod1_1_46:
	ds 4
_main_OVcnt_1_46:
	ds 2
_main_OVcnt1_1_46:
	ds 2
_main_pVolt0rms_1_46:
	ds 4
_main_pVolt1rms_1_46:
	ds 4
_main_phase_1_46:
	ds 4
_main_timeDiffsec_1_46:
	ds 4
_main_voltage0_1_46:
	ds 16
_main_secondrow_1_46:
	ds 16
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_LCDprint_PARM_3:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'SPIWrite'
;------------------------------------------------------------
;out_byte                  Allocated to registers 
;------------------------------------------------------------
;	lab5.c:27: unsigned char SPIWrite(unsigned char out_byte)
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	using	0
	mov	_ACC,dpl
;	lab5.c:32: BB_MOSI=ACC_7; BB_SCLK=1; B_7=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_7
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_7,c
	clr	_P2_3
;	lab5.c:33: BB_MOSI=ACC_6; BB_SCLK=1; B_6=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_6
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_6,c
	clr	_P2_3
;	lab5.c:34: BB_MOSI=ACC_5; BB_SCLK=1; B_5=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_5
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_5,c
	clr	_P2_3
;	lab5.c:35: BB_MOSI=ACC_4; BB_SCLK=1; B_4=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_4
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_4,c
	clr	_P2_3
;	lab5.c:36: BB_MOSI=ACC_3; BB_SCLK=1; B_3=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_3
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_3,c
	clr	_P2_3
;	lab5.c:37: BB_MOSI=ACC_2; BB_SCLK=1; B_2=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_2
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_2,c
	clr	_P2_3
;	lab5.c:38: BB_MOSI=ACC_1; BB_SCLK=1; B_1=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_1
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_1,c
	clr	_P2_3
;	lab5.c:39: BB_MOSI=ACC_0; BB_SCLK=1; B_0=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_0
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_0,c
	clr	_P2_3
;	lab5.c:41: return B;
	mov	dpl,_B
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	lab5.c:44: unsigned char _c51_external_startup(void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	lab5.c:46: AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O
	mov	_AUXR,#0x11
;	lab5.c:48: P0M0=0x00; P0M1=0x00;    
	mov	_P0M0,#0x00
	mov	_P0M1,#0x00
;	lab5.c:49: P1M0=0x00; P1M1=0x00;    
	mov	_P1M0,#0x00
	mov	_P1M1,#0x00
;	lab5.c:50: P2M0=0x00; P2M1=0x00;    
	mov	_P2M0,#0x00
	mov	_P2M1,#0x00
;	lab5.c:51: P3M0=0x00; P3M1=0x00;    
	mov	_P3M0,#0x00
	mov	_P3M1,#0x00
;	lab5.c:52: PCON|=0x80;
	orl	_PCON,#0x80
;	lab5.c:53: SCON = 0x52;
	mov	_SCON,#0x52
;	lab5.c:54: BDRCON=0;
	mov	_BDRCON,#0x00
;	lab5.c:58: BRL=BRG_VAL;
	mov	_BRL,#0xF4
;	lab5.c:59: BDRCON=BRR|TBCK|RBCK|SPD;
	mov	_BDRCON,#0x1E
;	lab5.c:61: CLKREG=0x00; // TPS=0000B
	mov	_CLKREG,#0x00
;	lab5.c:63: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_us'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	lab5.c:66: void wait_us (unsigned char x)
;	-----------------------------------------
;	 function wait_us
;	-----------------------------------------
_wait_us:
	mov	r2,dpl
;	lab5.c:70: TR0=0; // Stop timer 0
	clr	_TR0
;	lab5.c:71: TMOD&=0xf0; // Clear the configuration bits for timer 0
	anl	_TMOD,#0xF0
;	lab5.c:72: TMOD|=0x01; // Mode 1: 16-bit timer
	orl	_TMOD,#0x01
;	lab5.c:74: if(x>5) x-=5; // Subtract the overhead
	mov	a,r2
	add	a,#0xff - 0x05
	jnc	L004002?
	mov	a,r2
	add	a,#0xfb
	mov	r2,a
	sjmp	L004003?
L004002?:
;	lab5.c:75: else x=1;
	mov	r2,#0x01
L004003?:
;	lab5.c:77: j=-ONE_USEC*x;
	mov	__mullong_PARM_2,r2
	mov	(__mullong_PARM_2 + 1),#0x00
	mov	(__mullong_PARM_2 + 2),#0x00
	mov	(__mullong_PARM_2 + 3),#0x00
	mov	dptr,#0xFFEA
	mov	a,#0xFF
	mov	b,a
	lcall	__mullong
	mov	r2,dpl
	mov	r3,dph
;	lab5.c:78: TF0=0;
	clr	_TF0
;	lab5.c:79: TH0=j/0x100;
	mov	ar4,r3
	mov	r5,#0x00
	mov	_TH0,r4
;	lab5.c:80: TL0=j%0x100;
	mov	r3,#0x00
	mov	_TL0,r2
;	lab5.c:81: TR0=1; // Start timer 0
	setb	_TR0
;	lab5.c:82: while(TF0==0); //Wait for overflow
L004004?:
	jnb	_TF0,L004004?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	lab5.c:86: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	lab5.c:90: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L005005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L005009?
;	lab5.c:91: for (k=0; k<4; k++) wait_us(250);
	mov	r6,#0x00
L005001?:
	cjne	r6,#0x04,L005018?
L005018?:
	jnc	L005007?
	mov	dpl,#0xFA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_wait_us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r6
	sjmp	L005001?
L005007?:
;	lab5.c:90: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L005005?
	inc	r5
	sjmp	L005005?
L005009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetADC'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;adc                       Allocated to registers r3 r4 
;spid                      Allocated to registers r2 
;------------------------------------------------------------
;	lab5.c:97: unsigned int volatile GetADC(unsigned char channel)
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
;	lab5.c:102: ADC_CE=0; //Activate the MCP3008 ADC.
	clr	_P2_0
;	lab5.c:104: SPIWrite(0x01);//Send the start bit.
	mov	dpl,#0x01
	push	ar2
	lcall	_SPIWrite
	pop	ar2
;	lab5.c:105: spid=SPIWrite((channel*0x10)|0x80);	//Send single/diff* bit, D2, D1, and D0 bits.
	mov	a,r2
	swap	a
	anl	a,#0xf0
	mov	r2,a
	mov	a,#0x80
	orl	a,r2
	mov	dpl,a
	lcall	_SPIWrite
	mov	r2,dpl
;	lab5.c:106: adc=((spid & 0x03)*0x100);//spid has the two most significant bits of the result.
	mov	a,#0x03
	anl	a,r2
	mov	r4,a
	mov	r3,#0x00
;	lab5.c:107: spid=SPIWrite(0x00);//It doesn't matter what we send now.
	mov	dpl,#0x00
	push	ar3
	push	ar4
	lcall	_SPIWrite
	mov	r2,dpl
	pop	ar4
	pop	ar3
;	lab5.c:108: adc+=spid;//spid contains the low part of the result. 
	mov	r5,#0x00
	mov	a,r2
	add	a,r3
	mov	r3,a
	mov	a,r5
	addc	a,r4
	mov	r4,a
;	lab5.c:110: ADC_CE=1; //Deactivate the MCP3008 ADC.
	setb	_P2_0
;	lab5.c:112: return adc;
	mov	dpl,r3
	mov	dph,r4
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	lab5.c:115: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	lab5.c:117: LCD_E=1;
	setb	_P3_3
;	lab5.c:118: wait_us(40);
	mov	dpl,#0x28
	lcall	_wait_us
;	lab5.c:119: LCD_E=0;
	clr	_P3_3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	lab5.c:122: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	lab5.c:125: ACC=x; //Send high nible
	mov	_ACC,r2
;	lab5.c:126: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P3_7,c
;	lab5.c:127: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P3_6,c
;	lab5.c:128: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P3_5,c
;	lab5.c:129: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P3_4,c
;	lab5.c:130: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	lab5.c:131: wait_us(40);
	mov	dpl,#0x28
	lcall	_wait_us
	pop	ar2
;	lab5.c:132: ACC=x; //Send low nible
	mov	_ACC,r2
;	lab5.c:133: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P3_7,c
;	lab5.c:134: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P3_6,c
;	lab5.c:135: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P3_5,c
;	lab5.c:136: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P3_4,c
;	lab5.c:137: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	lab5.c:140: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	lab5.c:142: LCD_RS=1;
	setb	_P3_2
;	lab5.c:143: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	lab5.c:144: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	lab5.c:147: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	lab5.c:149: LCD_RS=0;
	clr	_P3_2
;	lab5.c:150: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	lab5.c:151: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	lab5.c:154: void LCD_4BIT (void)
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
;	lab5.c:156: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P3_3
;	lab5.c:158: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	lab5.c:160: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	lab5.c:161: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	lab5.c:162: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	lab5.c:165: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	lab5.c:166: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	lab5.c:167: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	lab5.c:168: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	lab5.c:171: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	lab5.c:175: WriteCommand(line==2?0xc0:0x80);
	mov	a,#0x02
	cjne	a,_LCDprint_PARM_2,L012013?
	mov	r5,#0xC0
	sjmp	L012014?
L012013?:
	mov	r5,#0x80
L012014?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
;	lab5.c:176: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	lab5.c:177: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	mov	r5,#0x00
	mov	r6,#0x00
L012003?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	r7,a
	jz	L012006?
	mov	dpl,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_WriteData
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r5
	cjne	r5,#0x00,L012003?
	inc	r6
	sjmp	L012003?
L012006?:
;	lab5.c:178: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_3,L012011?
	mov	ar2,r5
	mov	ar3,r6
L012007?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L012011?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L012007?
	inc	r3
	sjmp	L012007?
L012011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;half_period0              Allocated with name '_main_half_period0_1_46'
;half_period1              Allocated with name '_main_half_period1_1_46'
;qPeriod0                  Allocated with name '_main_qPeriod0_1_46'
;time0                     Allocated with name '_main_time0_1_46'
;time1                     Allocated with name '_main_time1_1_46'
;qPeriod1                  Allocated with name '_main_qPeriod1_1_46'
;OVcnt                     Allocated with name '_main_OVcnt_1_46'
;OVcnt1                    Allocated with name '_main_OVcnt1_1_46'
;pVolt0                    Allocated to registers r2 r3 r4 r5 
;pVolt1                    Allocated to registers r2 r3 r4 r5 
;pVolt0rms                 Allocated with name '_main_pVolt0rms_1_46'
;pVolt1rms                 Allocated with name '_main_pVolt1rms_1_46'
;timeDiff                  Allocated to registers r2 r3 r4 r5 
;phase                     Allocated with name '_main_phase_1_46'
;timeDiffsec               Allocated with name '_main_timeDiffsec_1_46'
;freq                      Allocated to registers r2 r3 r4 r5 
;mode                      Allocated to registers r2 r3 
;voltage0                  Allocated with name '_main_voltage0_1_46'
;secondrow                 Allocated with name '_main_secondrow_1_46'
;------------------------------------------------------------
;	lab5.c:181: void main (void)  //using ch0 and ch2 for the sin signals 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	lab5.c:213: TMOD&=0B_1111_0000; // Clear the configuration bits for timer 0
	anl	_TMOD,#0xF0
;	lab5.c:214: TMOD|=0B_0000_0001; // Mode 1: 16-bit timer
	orl	_TMOD,#0x01
;	lab5.c:217: LCD_4BIT();
	lcall	_LCD_4BIT
;	lab5.c:221: while(1)
L013094?:
;	lab5.c:231: LCDprint(voltage0,1,1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#_main_voltage0_1_46
	mov	b,#0x40
	lcall	_LCDprint
;	lab5.c:232: LCDprint(secondrow,2,1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#_main_secondrow_1_46
	mov	b,#0x40
	lcall	_LCDprint
;	lab5.c:233: TR0=0;
	clr	_TR0
;	lab5.c:234: TF0=0; // Clear overflow flag
	clr	_TF0
;	lab5.c:235: TL0=0; // Reset the timer
	mov	_TL0,#0x00
;	lab5.c:236: TH0=0;
	mov	_TH0,#0x00
;	lab5.c:238: while (GetADC(0)>2); // Wait for the signal to be zero/ / 
L013001?:
	mov	dpl,#0x00
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,#0x02
	subb	a,r2
	clr	a
	subb	a,r3
	jc	L013001?
;	lab5.c:239: while (GetADC(0)<4); // Wait for the signal to be one
L013004?:
	mov	dpl,#0x00
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,r2
	subb	a,#0x04
	mov	a,r3
	subb	a,#0x00
	jc	L013004?
;	lab5.c:240: TR0=1; // Start timing
	setb	_TR0
;	lab5.c:242: while (GetADC(3)>2){  //times while signal is above zero
	mov	r2,#0x00
	mov	r3,#0x00
L013009?:
	mov	dpl,#0x03
	push	ar2
	push	ar3
	lcall	_GetADC
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
	clr	c
	mov	a,#0x02
	subb	a,r4
	clr	a
	subb	a,r5
	jnc	L013105?
;	lab5.c:243: if (TF0){
;	lab5.c:244: TF0=0;
	jbc	_TF0,L013155?
	sjmp	L013009?
L013155?:
;	lab5.c:245: OVcnt++;
	inc	r2
;	lab5.c:248: while (GetADC(3)<4){ // continues timing until signal reaches zero cross
	cjne	r2,#0x00,L013009?
	inc	r3
	sjmp	L013009?
L013105?:
L013014?:
	mov	dpl,#0x03
	push	ar2
	push	ar3
	lcall	_GetADC
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
	clr	c
	mov	a,r4
	subb	a,#0x04
	mov	a,r5
	subb	a,#0x00
	jnc	L013016?
;	lab5.c:249: if (TF0){
;	lab5.c:250: TF0=0;
	jbc	_TF0,L013158?
	sjmp	L013014?
L013158?:
;	lab5.c:251: OVcnt++;
	inc	r2
	cjne	r2,#0x00,L013014?
	inc	r3
	sjmp	L013014?
L013016?:
;	lab5.c:254: TR0=0; // Stop timer 0
	clr	_TR0
;	lab5.c:256: timeDiff=OVcnt*65536.0+TH0*256.0+TL0; // getting value of time right at the other zero cross			units of 1/clk
	mov	dpl,r2
	mov	dph,r3
	lcall	___sint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___uchar2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:257: timeDiffsec = (timeDiff/22118.400); //now the time difference is in milliseconds 
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	mov	a,#0xAC
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_timeDiffsec_1_46,dpl
	mov	(_main_timeDiffsec_1_46 + 1),dph
	mov	(_main_timeDiffsec_1_46 + 2),b
	mov	(_main_timeDiffsec_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:268: TF0=0; // Clear overflow flag
	clr	_TF0
;	lab5.c:269: TL0=0; // Reset the timer
	mov	_TL0,#0x00
;	lab5.c:270: TH0=0;
	mov	_TH0,#0x00
;	lab5.c:272: while (GetADC(0)>2); // Wait for the signal to be zero
L013017?:
	mov	dpl,#0x00
	lcall	_GetADC
	mov	r6,dpl
	mov	r7,dph
	clr	c
	mov	a,#0x02
	subb	a,r6
	clr	a
	subb	a,r7
	jc	L013017?
;	lab5.c:273: while (GetADC(0)<4); // Wait for the signal to be one
L013020?:
	mov	dpl,#0x00
	lcall	_GetADC
	mov	r6,dpl
	mov	r7,dph
	clr	c
	mov	a,r6
	subb	a,#0x04
	mov	a,r7
	subb	a,#0x00
	jc	L013020?
;	lab5.c:274: TR0=1; // Start timing
	setb	_TR0
;	lab5.c:275: while (GetADC(0)>2) // Wait for the signal to be zero   
	mov	r6,#0x00
	mov	r7,#0x00
L013025?:
	mov	dpl,#0x00
	push	ar6
	push	ar7
	lcall	_GetADC
	mov	r0,dpl
	mov	r1,dph
	pop	ar7
	pop	ar6
	clr	c
	mov	a,#0x02
	subb	a,r0
	clr	a
	subb	a,r1
	jnc	L013027?
;	lab5.c:277: if (TF0){
;	lab5.c:278: TF0=0;
	jbc	_TF0,L013163?
	sjmp	L013025?
L013163?:
;	lab5.c:279: OVcnt++;
	inc	r6
	cjne	r6,#0x00,L013025?
	inc	r7
	sjmp	L013025?
L013027?:
;	lab5.c:282: TR0=0; // Stop timer 0
	clr	_TR0
;	lab5.c:284: half_period0=OVcnt*65536.0+TH0*256.0+TL0; // half_period is a float and is in units of 1/clk. To convert, divide by clk
	mov	dpl,r6
	mov	dph,r7
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	_main_half_period0_1_46,dpl
	mov	(_main_half_period0_1_46 + 1),dph
	mov	(_main_half_period0_1_46 + 2),b
	mov	(_main_half_period0_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:285: qPeriod0 = half_period0/2.0;
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,_main_half_period0_1_46
	mov	dph,(_main_half_period0_1_46 + 1)
	mov	b,(_main_half_period0_1_46 + 2)
	mov	a,(_main_half_period0_1_46 + 3)
	lcall	___fsdiv
	mov	_main_qPeriod0_1_46,dpl
	mov	(_main_qPeriod0_1_46 + 1),dph
	mov	(_main_qPeriod0_1_46 + 2),b
	mov	(_main_qPeriod0_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:287: TF0 = 0;
	clr	_TF0
;	lab5.c:288: TL0 = 0;
	mov	_TL0,#0x00
;	lab5.c:289: TH0 = 0;
	mov	_TH0,#0x00
;	lab5.c:291: while (GetADC(0)>2); // Wait for the signal to be zero
L013028?:
	mov	dpl,#0x00
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,#0x02
	subb	a,r2
	clr	a
	subb	a,r3
	jc	L013028?
;	lab5.c:292: while (GetADC(0)<4); // Wait for the signal to be one
L013031?:
	mov	dpl,#0x00
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,r2
	subb	a,#0x04
	mov	a,r3
	subb	a,#0x00
	jc	L013031?
;	lab5.c:293: TR0 = 1;
	setb	_TR0
;	lab5.c:294: while((OVcnt*65536.0+TH0*256.0+TL0)<qPeriod0){
	clr	a
	mov	_main_OVcnt_1_46,a
	mov	(_main_OVcnt_1_46 + 1),a
L013036?:
	mov	dpl,_main_OVcnt_1_46
	mov	dph,(_main_OVcnt_1_46 + 1)
	lcall	___sint2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	___uchar2fs
	mov	r0,dpl
	mov	r1,dph
	mov	r2,b
	mov	r3,a
	push	ar0
	push	ar1
	push	ar2
	push	ar3
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_qPeriod0_1_46
	push	(_main_qPeriod0_1_46 + 1)
	push	(_main_qPeriod0_1_46 + 2)
	push	(_main_qPeriod0_1_46 + 3)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L013038?
;	lab5.c:295: if (TF0){
;	lab5.c:296: TF0=0;
	jbc	_TF0,L013168?
	ljmp	L013036?
L013168?:
;	lab5.c:297: OVcnt++;     		
	inc	_main_OVcnt_1_46
	clr	a
	cjne	a,_main_OVcnt_1_46,L013169?
	inc	(_main_OVcnt_1_46 + 1)
L013169?:
	ljmp	L013036?
L013038?:
;	lab5.c:300: TR0 = 0;
	clr	_TR0
;	lab5.c:301: pVolt0=(GetADC(0)*VREF)/1023.0;
	mov	dpl,#0x00
	lcall	_GetADC
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x126F
	mov	b,#0x83
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xC0
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:302: pVolt0rms = pVolt0/1.41421356237;
	mov	a,#0xF3
	push	acc
	mov	a,#0x04
	push	acc
	mov	a,#0xB5
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_pVolt0rms_1_46,dpl
	mov	(_main_pVolt0rms_1_46 + 1),dph
	mov	(_main_pVolt0rms_1_46 + 2),b
	mov	(_main_pVolt0rms_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:303: time0 = (half_period0/22118.400)*2.0; //period in milliseconds
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	mov	a,#0xAC
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,_main_half_period0_1_46
	mov	dph,(_main_half_period0_1_46 + 1)
	mov	b,(_main_half_period0_1_46 + 2)
	mov	a,(_main_half_period0_1_46 + 3)
	lcall	___fsdiv
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	mov	a,#0x40
	lcall	___fsmul
	mov	_main_time0_1_46,dpl
	mov	(_main_time0_1_46 + 1),dph
	mov	(_main_time0_1_46 + 2),b
	mov	(_main_time0_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:304: freq = 1/(time0/1000);  
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,_main_time0_1_46
	mov	dph,(_main_time0_1_46 + 1)
	mov	b,(_main_time0_1_46 + 2)
	mov	a,(_main_time0_1_46 + 3)
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x3F
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:305: sprintf(voltage0,"1:%4.2frms %4.1fHz",pVolt0rms,freq);
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	_main_pVolt0rms_1_46
	push	(_main_pVolt0rms_1_46 + 1)
	push	(_main_pVolt0rms_1_46 + 2)
	push	(_main_pVolt0rms_1_46 + 3)
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_voltage0_1_46
	push	acc
	mov	a,#(_main_voltage0_1_46 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
;	lab5.c:312: TF0=0; // Clear overflow flag
	clr	_TF0
;	lab5.c:313: TL0=0; // Reset the timer
	mov	_TL0,#0x00
;	lab5.c:314: TH0=0;
	mov	_TH0,#0x00
;	lab5.c:316: while (GetADC(3)>2); // Wait for the signal to be zero
L013039?:
	mov	dpl,#0x03
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,#0x02
	subb	a,r2
	clr	a
	subb	a,r3
	jc	L013039?
;	lab5.c:317: while (GetADC(3)<4); // Wait for the signal to be one
L013042?:
	mov	dpl,#0x03
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,r2
	subb	a,#0x04
	mov	a,r3
	subb	a,#0x00
	jc	L013042?
;	lab5.c:318: TR0=1; // Start timing
	setb	_TR0
;	lab5.c:319: while (GetADC(3)>2) // Wait for the signal to be zero   
	mov	r2,#0x00
	mov	r3,#0x00
L013047?:
	mov	dpl,#0x03
	push	ar2
	push	ar3
	lcall	_GetADC
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
	clr	c
	mov	a,#0x02
	subb	a,r4
	clr	a
	subb	a,r5
	jnc	L013049?
;	lab5.c:321: if (TF0){
;	lab5.c:322: TF0=0;
	jbc	_TF0,L013173?
	sjmp	L013047?
L013173?:
;	lab5.c:323: OVcnt1++;
	inc	r2
	cjne	r2,#0x00,L013047?
	inc	r3
	sjmp	L013047?
L013049?:
;	lab5.c:326: TR0=0; // Stop timer 0
	clr	_TR0
;	lab5.c:328: half_period1=OVcnt1*65536.0+TH0*256.0+TL0; // half_period is a float and is in units of 1/clk. To convert, divide by clk
	mov	dpl,r2
	mov	dph,r3
	lcall	___sint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___uchar2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	_main_half_period1_1_46,dpl
	mov	(_main_half_period1_1_46 + 1),dph
	mov	(_main_half_period1_1_46 + 2),b
	mov	(_main_half_period1_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:329: qPeriod1 = half_period1/2.0;
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,_main_half_period1_1_46
	mov	dph,(_main_half_period1_1_46 + 1)
	mov	b,(_main_half_period1_1_46 + 2)
	mov	a,(_main_half_period1_1_46 + 3)
	lcall	___fsdiv
	mov	_main_qPeriod1_1_46,dpl
	mov	(_main_qPeriod1_1_46 + 1),dph
	mov	(_main_qPeriod1_1_46 + 2),b
	mov	(_main_qPeriod1_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:330: TR0 = 0;
	clr	_TR0
;	lab5.c:331: TF0 = 0;
	clr	_TF0
;	lab5.c:332: TL0 = 0;
	mov	_TL0,#0x00
;	lab5.c:333: TH0 = 0;
	mov	_TH0,#0x00
;	lab5.c:336: while (GetADC(3)>2); // Wait for the signal to be zero
L013050?:
	mov	dpl,#0x03
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,#0x02
	subb	a,r2
	clr	a
	subb	a,r3
	jc	L013050?
;	lab5.c:337: while (GetADC(3)<4); // Wait for the signal to be one
L013053?:
	mov	dpl,#0x03
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,r2
	subb	a,#0x04
	mov	a,r3
	subb	a,#0x00
	jc	L013053?
;	lab5.c:338: TR0 = 1;
	setb	_TR0
;	lab5.c:339: while((OVcnt1*65536.0+TH0*256.0+TL0)<qPeriod1){
	clr	a
	mov	_main_OVcnt1_1_46,a
	mov	(_main_OVcnt1_1_46 + 1),a
L013058?:
	mov	dpl,_main_OVcnt1_1_46
	mov	dph,(_main_OVcnt1_1_46 + 1)
	lcall	___sint2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	___uchar2fs
	mov	r0,dpl
	mov	r1,dph
	mov	r2,b
	mov	r3,a
	push	ar0
	push	ar1
	push	ar2
	push	ar3
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_qPeriod1_1_46
	push	(_main_qPeriod1_1_46 + 1)
	push	(_main_qPeriod1_1_46 + 2)
	push	(_main_qPeriod1_1_46 + 3)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L013060?
;	lab5.c:340: if (TF0){
;	lab5.c:341: TF0=0;
	jbc	_TF0,L013178?
	ljmp	L013058?
L013178?:
;	lab5.c:342: OVcnt1++;     		
	inc	_main_OVcnt1_1_46
	clr	a
	cjne	a,_main_OVcnt1_1_46,L013179?
	inc	(_main_OVcnt1_1_46 + 1)
L013179?:
	ljmp	L013058?
L013060?:
;	lab5.c:345: TR0 = 0;
	clr	_TR0
;	lab5.c:347: pVolt1=(GetADC(3)*VREF)/1023.0; //converting adc value into voltage
	mov	dpl,#0x03
	lcall	_GetADC
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x126F
	mov	b,#0x83
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xC0
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:348: time1 = (half_period1/22118.400)*2.0; //period in milliseconds
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	mov	a,#0xAC
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,_main_half_period1_1_46
	mov	dph,(_main_half_period1_1_46 + 1)
	mov	b,(_main_half_period1_1_46 + 2)
	mov	a,(_main_half_period1_1_46 + 3)
	lcall	___fsdiv
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	mov	a,#0x40
	lcall	___fsmul
	mov	_main_time1_1_46,dpl
	mov	(_main_time1_1_46 + 1),dph
	mov	(_main_time1_1_46 + 2),b
	mov	(_main_time1_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	lab5.c:349: pVolt1rms = pVolt1/1.41421356237; 
	mov	a,#0xF3
	push	acc
	mov	a,#0x04
	push	acc
	mov	a,#0xB5
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_pVolt1rms_1_46,dpl
	mov	(_main_pVolt1rms_1_46 + 1),dph
	mov	(_main_pVolt1rms_1_46 + 2),b
	mov	(_main_pVolt1rms_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:350: phase = timeDiffsec*(360.0/time0);
	push	_main_time0_1_46
	push	(_main_time0_1_46 + 1)
	push	(_main_time0_1_46 + 2)
	push	(_main_time0_1_46 + 3)
	mov	dptr,#0x0000
	mov	b,#0xB4
	mov	a,#0x43
	lcall	___fsdiv
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,_main_timeDiffsec_1_46
	mov	dph,(_main_timeDiffsec_1_46 + 1)
	mov	b,(_main_timeDiffsec_1_46 + 2)
	mov	a,(_main_timeDiffsec_1_46 + 3)
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	_main_phase_1_46,r6
	mov	(_main_phase_1_46 + 1),r7
	mov	(_main_phase_1_46 + 2),r0
	mov	(_main_phase_1_46 + 3),r1
;	lab5.c:351: if(radianmode ==0){
	jb	_P0_3,L013065?
;	lab5.c:352: waitms(50);
	mov	dptr,#0x0032
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	lcall	_waitms
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
;	lab5.c:353: if(radianmode ==0){
	jb	_P0_3,L013062?
;	lab5.c:354: mode =1;
	mov	r2,#0x01
	mov	r3,#0x00
	sjmp	L013066?
L013062?:
;	lab5.c:357: mode =0;
	mov	r2,#0x00
	mov	r3,#0x00
	sjmp	L013066?
L013065?:
;	lab5.c:360: mode =0;
	mov	r2,#0x00
	mov	r3,#0x00
L013066?:
;	lab5.c:363: if(mode == 0){
	mov	a,r2
	orl	a,r3
	jz	L013182?
	ljmp	L013079?
L013182?:
;	lab5.c:364: phase = timeDiffsec*(360.0/time0); //phase in degrees 
	mov	_main_phase_1_46,r6
	mov	(_main_phase_1_46 + 1),r7
	mov	(_main_phase_1_46 + 2),r0
	mov	(_main_phase_1_46 + 3),r1
;	lab5.c:365: if(phase>180){
	push	ar2
	push	ar3
	clr	a
	push	acc
	push	acc
	mov	a,#0x34
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,_main_phase_1_46
	mov	dph,(_main_phase_1_46 + 1)
	mov	b,(_main_phase_1_46 + 2)
	mov	a,(_main_phase_1_46 + 3)
	lcall	___fsgt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	a,r4
	jnz	L013183?
	ljmp	L013076?
L013183?:
;	lab5.c:366: phase = phase-360.0;
	push	ar2
	push	ar3
	clr	a
	push	acc
	push	acc
	mov	a,#0xB4
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,_main_phase_1_46
	mov	dph,(_main_phase_1_46 + 1)
	mov	b,(_main_phase_1_46 + 2)
	mov	a,(_main_phase_1_46 + 3)
	lcall	___fssub
	mov	_main_phase_1_46,dpl
	mov	(_main_phase_1_46 + 1),dph
	mov	(_main_phase_1_46 + 2),b
	mov	(_main_phase_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:367: sprintf(secondrow,"3:%4.2frms %4.2f\xDF""",pVolt1rms,phase);
	push	_main_phase_1_46
	push	(_main_phase_1_46 + 1)
	push	(_main_phase_1_46 + 2)
	push	(_main_phase_1_46 + 3)
	push	_main_pVolt1rms_1_46
	push	(_main_pVolt1rms_1_46 + 1)
	push	(_main_pVolt1rms_1_46 + 2)
	push	(_main_pVolt1rms_1_46 + 3)
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_secondrow_1_46
	push	acc
	mov	a,#(_main_secondrow_1_46 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
;	lab5.c:368: if(phase<0.0){
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_main_phase_1_46
	mov	dph,(_main_phase_1_46 + 1)
	mov	b,(_main_phase_1_46 + 2)
	mov	a,(_main_phase_1_46 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	a,r4
	jnz	L013184?
	ljmp	L013079?
L013184?:
;	lab5.c:369: if(phase < -20.0){
	push	ar2
	push	ar3
	push	ar4
	clr	a
	push	acc
	push	acc
	mov	a,#0xA0
	push	acc
	mov	a,#0xC1
	push	acc
	mov	dpl,_main_phase_1_46
	mov	dph,(_main_phase_1_46 + 1)
	mov	b,(_main_phase_1_46 + 2)
	mov	a,(_main_phase_1_46 + 3)
	lcall	___fslt
	mov	r5,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r5
	jz	L013071?
;	lab5.c:370: phase = phase - 5.0;
	push	ar2
	push	ar3
	clr	a
	push	acc
	push	acc
	mov	a,#0xA0
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,_main_phase_1_46
	mov	dph,(_main_phase_1_46 + 1)
	mov	b,(_main_phase_1_46 + 2)
	mov	a,(_main_phase_1_46 + 3)
	lcall	___fssub
	mov	_main_phase_1_46,dpl
	mov	(_main_phase_1_46 + 1),dph
	mov	(_main_phase_1_46 + 2),b
	mov	(_main_phase_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:371: sprintf(secondrow,"3:%4.2frms %4.2f\xDF""",pVolt1rms,phase);
	push	_main_phase_1_46
	push	(_main_phase_1_46 + 1)
	push	(_main_phase_1_46 + 2)
	push	(_main_phase_1_46 + 3)
	push	_main_pVolt1rms_1_46
	push	(_main_pVolt1rms_1_46 + 1)
	push	(_main_pVolt1rms_1_46 + 2)
	push	(_main_pVolt1rms_1_46 + 3)
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_secondrow_1_46
	push	acc
	mov	a,#(_main_secondrow_1_46 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
	pop	ar3
	pop	ar2
	ljmp	L013079?
L013071?:
;	lab5.c:373: else if(phase > -20 && phase < 0.0){
	push	ar2
	push	ar3
	push	ar4
	clr	a
	push	acc
	push	acc
	mov	a,#0xA0
	push	acc
	mov	a,#0xC1
	push	acc
	mov	dpl,_main_phase_1_46
	mov	dph,(_main_phase_1_46 + 1)
	mov	b,(_main_phase_1_46 + 2)
	mov	a,(_main_phase_1_46 + 3)
	lcall	___fsgt
	mov	r5,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r5
	jnz	L013186?
	ljmp	L013079?
L013186?:
	mov	a,r4
	jnz	L013187?
	ljmp	L013079?
L013187?:
;	lab5.c:374: phase = phase - 3.0;
	push	ar2
	push	ar3
	clr	a
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	push	acc
	mov	dpl,_main_phase_1_46
	mov	dph,(_main_phase_1_46 + 1)
	mov	b,(_main_phase_1_46 + 2)
	mov	a,(_main_phase_1_46 + 3)
	lcall	___fssub
	mov	_main_phase_1_46,dpl
	mov	(_main_phase_1_46 + 1),dph
	mov	(_main_phase_1_46 + 2),b
	mov	(_main_phase_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:375: sprintf(secondrow,"3:%4.2frms %4.2f\xDF""",pVolt1rms,phase);
	push	_main_phase_1_46
	push	(_main_phase_1_46 + 1)
	push	(_main_phase_1_46 + 2)
	push	(_main_phase_1_46 + 3)
	push	_main_pVolt1rms_1_46
	push	(_main_pVolt1rms_1_46 + 1)
	push	(_main_pVolt1rms_1_46 + 2)
	push	(_main_pVolt1rms_1_46 + 3)
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_secondrow_1_46
	push	acc
	mov	a,#(_main_secondrow_1_46 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
	pop	ar3
	pop	ar2
	sjmp	L013079?
L013076?:
;	lab5.c:380: sprintf(secondrow,"3:%4.2frms %4.2f\xDF""",pVolt1rms,phase);
	push	ar2
	push	ar3
	push	_main_phase_1_46
	push	(_main_phase_1_46 + 1)
	push	(_main_phase_1_46 + 2)
	push	(_main_phase_1_46 + 3)
	push	_main_pVolt1rms_1_46
	push	(_main_pVolt1rms_1_46 + 1)
	push	(_main_pVolt1rms_1_46 + 2)
	push	(_main_pVolt1rms_1_46 + 3)
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_secondrow_1_46
	push	acc
	mov	a,#(_main_secondrow_1_46 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
	pop	ar3
	pop	ar2
L013079?:
;	lab5.c:387: if(mode == 1){	
	cjne	r2,#0x01,L013188?
	cjne	r3,#0x00,L013188?
	sjmp	L013189?
L013188?:
	ljmp	L013092?
L013189?:
;	lab5.c:388: if(phase>PI){
	mov	a,#0xDB
	push	acc
	mov	a,#0x0F
	push	acc
	mov	a,#0x49
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,_main_phase_1_46
	mov	dph,(_main_phase_1_46 + 1)
	mov	b,(_main_phase_1_46 + 2)
	mov	a,(_main_phase_1_46 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L013190?
	ljmp	L013089?
L013190?:
;	lab5.c:389: phase = phase*PI/180.0;
	push	_main_phase_1_46
	push	(_main_phase_1_46 + 1)
	push	(_main_phase_1_46 + 2)
	push	(_main_phase_1_46 + 3)
	mov	dptr,#0x0FDB
	mov	b,#0x49
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x34
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_phase_1_46,dpl
	mov	(_main_phase_1_46 + 1),dph
	mov	(_main_phase_1_46 + 2),b
	mov	(_main_phase_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:390: sprintf(secondrow,"3:%4.2frms %4.2fr",pVolt1rms,phase);
	push	_main_phase_1_46
	push	(_main_phase_1_46 + 1)
	push	(_main_phase_1_46 + 2)
	push	(_main_phase_1_46 + 3)
	push	_main_pVolt1rms_1_46
	push	(_main_pVolt1rms_1_46 + 1)
	push	(_main_pVolt1rms_1_46 + 2)
	push	(_main_pVolt1rms_1_46 + 3)
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_secondrow_1_46
	push	acc
	mov	a,#(_main_secondrow_1_46 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
;	lab5.c:391: if(phase<0.0){
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_main_phase_1_46
	mov	dph,(_main_phase_1_46 + 1)
	mov	b,(_main_phase_1_46 + 2)
	mov	a,(_main_phase_1_46 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L013191?
	ljmp	L013092?
L013191?:
;	lab5.c:392: if(phase < -20.0*PI/180.0){
	push	ar2
	mov	a,#0xC2
	push	acc
	mov	a,#0xB8
	push	acc
	mov	a,#0xB2
	push	acc
	mov	a,#0xBE
	push	acc
	mov	dpl,_main_phase_1_46
	mov	dph,(_main_phase_1_46 + 1)
	mov	b,(_main_phase_1_46 + 2)
	mov	a,(_main_phase_1_46 + 3)
	lcall	___fslt
	mov	r3,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar2
	mov	a,r3
	jz	L013084?
;	lab5.c:393: phase = phase - 5.0*PI/180;
	mov	a,#0xC2
	push	acc
	mov	a,#0xB8
	push	acc
	mov	a,#0xB2
	push	acc
	mov	a,#0x3D
	push	acc
	mov	dpl,_main_phase_1_46
	mov	dph,(_main_phase_1_46 + 1)
	mov	b,(_main_phase_1_46 + 2)
	mov	a,(_main_phase_1_46 + 3)
	lcall	___fssub
	mov	_main_phase_1_46,dpl
	mov	(_main_phase_1_46 + 1),dph
	mov	(_main_phase_1_46 + 2),b
	mov	(_main_phase_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:394: sprintf(secondrow,"3:%4.2frms %4.2fr",pVolt1rms,phase);
	push	_main_phase_1_46
	push	(_main_phase_1_46 + 1)
	push	(_main_phase_1_46 + 2)
	push	(_main_phase_1_46 + 3)
	push	_main_pVolt1rms_1_46
	push	(_main_pVolt1rms_1_46 + 1)
	push	(_main_pVolt1rms_1_46 + 2)
	push	(_main_pVolt1rms_1_46 + 3)
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_secondrow_1_46
	push	acc
	mov	a,#(_main_secondrow_1_46 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
	ljmp	L013092?
L013084?:
;	lab5.c:396: else if(phase > -20*PI/180 && phase < 0.0){
	push	ar2
	mov	a,#0xC2
	push	acc
	mov	a,#0xB8
	push	acc
	mov	a,#0xB2
	push	acc
	mov	a,#0xBE
	push	acc
	mov	dpl,_main_phase_1_46
	mov	dph,(_main_phase_1_46 + 1)
	mov	b,(_main_phase_1_46 + 2)
	mov	a,(_main_phase_1_46 + 3)
	lcall	___fsgt
	mov	r3,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar2
	mov	a,r3
	jnz	L013193?
	ljmp	L013092?
L013193?:
	mov	a,r2
	jnz	L013194?
	ljmp	L013092?
L013194?:
;	lab5.c:397: phase = phase - 3.0*PI/180;
	mov	a,#0x50
	push	acc
	mov	a,#0x77
	push	acc
	mov	a,#0x56
	push	acc
	mov	a,#0x3D
	push	acc
	mov	dpl,_main_phase_1_46
	mov	dph,(_main_phase_1_46 + 1)
	mov	b,(_main_phase_1_46 + 2)
	mov	a,(_main_phase_1_46 + 3)
	lcall	___fssub
	mov	_main_phase_1_46,dpl
	mov	(_main_phase_1_46 + 1),dph
	mov	(_main_phase_1_46 + 2),b
	mov	(_main_phase_1_46 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	lab5.c:398: sprintf(secondrow,"3:%4.2frms %4.2fr",pVolt1rms,phase);
	push	_main_phase_1_46
	push	(_main_phase_1_46 + 1)
	push	(_main_phase_1_46 + 2)
	push	(_main_phase_1_46 + 3)
	push	_main_pVolt1rms_1_46
	push	(_main_pVolt1rms_1_46 + 1)
	push	(_main_pVolt1rms_1_46 + 2)
	push	(_main_pVolt1rms_1_46 + 3)
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_secondrow_1_46
	push	acc
	mov	a,#(_main_secondrow_1_46 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
	sjmp	L013092?
L013089?:
;	lab5.c:403: sprintf(secondrow,"3:%4.2frms %4.2fr",pVolt1rms,phase);
	push	_main_phase_1_46
	push	(_main_phase_1_46 + 1)
	push	(_main_phase_1_46 + 2)
	push	(_main_phase_1_46 + 3)
	push	_main_pVolt1rms_1_46
	push	(_main_pVolt1rms_1_46 + 1)
	push	(_main_pVolt1rms_1_46 + 2)
	push	(_main_pVolt1rms_1_46 + 3)
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_secondrow_1_46
	push	acc
	mov	a,#(_main_secondrow_1_46 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
L013092?:
;	lab5.c:409: printf("channel 0 period(ms):%5.3f\n", time0);
	push	_main_time0_1_46
	push	(_main_time0_1_46 + 1)
	push	(_main_time0_1_46 + 2)
	push	(_main_time0_1_46 + 3)
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	lab5.c:410: printf("channel 0 voltage(rms):%5.3f\n", pVolt0rms);
	push	_main_pVolt0rms_1_46
	push	(_main_pVolt0rms_1_46 + 1)
	push	(_main_pVolt0rms_1_46 + 2)
	push	(_main_pVolt0rms_1_46 + 3)
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	lab5.c:411: printf("channel 3 period(ms):%5.3f\n", time1);
	push	_main_time1_1_46
	push	(_main_time1_1_46 + 1)
	push	(_main_time1_1_46 + 2)
	push	(_main_time1_1_46 + 3)
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	lab5.c:412: printf("channel 3 voltage(rms):%5.3f\n", pVolt1rms);
	push	_main_pVolt1rms_1_46
	push	(_main_pVolt1rms_1_46 + 1)
	push	(_main_pVolt1rms_1_46 + 2)
	push	(_main_pVolt1rms_1_46 + 3)
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	lab5.c:413: printf("phase (degrees): %5.3f\n",phase);
	push	_main_phase_1_46
	push	(_main_phase_1_46 + 1)
	push	(_main_phase_1_46 + 2)
	push	(_main_phase_1_46 + 3)
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	ljmp	L013094?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db '1:%4.2frms %4.1fHz'
	db 0x00
__str_1:
	db '3:%4.2frms %4.2f'
	db 0xDF
	db 0x00
__str_2:
	db '3:%4.2frms %4.2fr'
	db 0x00
__str_3:
	db 'channel 0 period(ms):%5.3f'
	db 0x0A
	db 0x00
__str_4:
	db 'channel 0 voltage(rms):%5.3f'
	db 0x0A
	db 0x00
__str_5:
	db 'channel 3 period(ms):%5.3f'
	db 0x0A
	db 0x00
__str_6:
	db 'channel 3 voltage(rms):%5.3f'
	db 0x0A
	db 0x00
__str_7:
	db 'phase (degrees): %5.3f'
	db 0x0A
	db 0x00

	CSEG

end
