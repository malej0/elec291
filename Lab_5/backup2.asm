;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Thu Mar 10 14:27:10 2022
;--------------------------------------------------------
$name backup2
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
;	backup2.c:25: unsigned char SPIWrite(unsigned char out_byte)
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	using	0
	mov	_ACC,dpl
;	backup2.c:30: BB_MOSI=ACC_7; BB_SCLK=1; B_7=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_7
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_7,c
	clr	_P2_3
;	backup2.c:31: BB_MOSI=ACC_6; BB_SCLK=1; B_6=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_6
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_6,c
	clr	_P2_3
;	backup2.c:32: BB_MOSI=ACC_5; BB_SCLK=1; B_5=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_5
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_5,c
	clr	_P2_3
;	backup2.c:33: BB_MOSI=ACC_4; BB_SCLK=1; B_4=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_4
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_4,c
	clr	_P2_3
;	backup2.c:34: BB_MOSI=ACC_3; BB_SCLK=1; B_3=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_3
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_3,c
	clr	_P2_3
;	backup2.c:35: BB_MOSI=ACC_2; BB_SCLK=1; B_2=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_2
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_2,c
	clr	_P2_3
;	backup2.c:36: BB_MOSI=ACC_1; BB_SCLK=1; B_1=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_1
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_1,c
	clr	_P2_3
;	backup2.c:37: BB_MOSI=ACC_0; BB_SCLK=1; B_0=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_0
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_0,c
	clr	_P2_3
;	backup2.c:39: return B;
	mov	dpl,_B
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	backup2.c:42: unsigned char _c51_external_startup(void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	backup2.c:44: AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O
	mov	_AUXR,#0x11
;	backup2.c:46: P0M0=0x00; P0M1=0x00;    
	mov	_P0M0,#0x00
	mov	_P0M1,#0x00
;	backup2.c:47: P1M0=0x00; P1M1=0x00;    
	mov	_P1M0,#0x00
	mov	_P1M1,#0x00
;	backup2.c:48: P2M0=0x00; P2M1=0x00;    
	mov	_P2M0,#0x00
	mov	_P2M1,#0x00
;	backup2.c:49: P3M0=0x00; P3M1=0x00;    
	mov	_P3M0,#0x00
	mov	_P3M1,#0x00
;	backup2.c:50: PCON|=0x80;
	orl	_PCON,#0x80
;	backup2.c:51: SCON = 0x52;
	mov	_SCON,#0x52
;	backup2.c:52: BDRCON=0;
	mov	_BDRCON,#0x00
;	backup2.c:56: BRL=BRG_VAL;
	mov	_BRL,#0xF4
;	backup2.c:57: BDRCON=BRR|TBCK|RBCK|SPD;
	mov	_BDRCON,#0x1E
;	backup2.c:59: CLKREG=0x00; // TPS=0000B
	mov	_CLKREG,#0x00
;	backup2.c:61: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_us'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	backup2.c:64: void wait_us (unsigned char x)
;	-----------------------------------------
;	 function wait_us
;	-----------------------------------------
_wait_us:
	mov	r2,dpl
;	backup2.c:68: TR0=0; // Stop timer 0
	clr	_TR0
;	backup2.c:69: TMOD&=0xf0; // Clear the configuration bits for timer 0
	anl	_TMOD,#0xF0
;	backup2.c:70: TMOD|=0x01; // Mode 1: 16-bit timer
	orl	_TMOD,#0x01
;	backup2.c:72: if(x>5) x-=5; // Subtract the overhead
	mov	a,r2
	add	a,#0xff - 0x05
	jnc	L004002?
	mov	a,r2
	add	a,#0xfb
	mov	r2,a
	sjmp	L004003?
L004002?:
;	backup2.c:73: else x=1;
	mov	r2,#0x01
L004003?:
;	backup2.c:75: j=-ONE_USEC*x;
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
;	backup2.c:76: TF0=0;
	clr	_TF0
;	backup2.c:77: TH0=j/0x100;
	mov	ar4,r3
	mov	r5,#0x00
	mov	_TH0,r4
;	backup2.c:78: TL0=j%0x100;
	mov	r3,#0x00
	mov	_TL0,r2
;	backup2.c:79: TR0=1; // Start timer 0
	setb	_TR0
;	backup2.c:80: while(TF0==0); //Wait for overflow
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
;	backup2.c:84: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	backup2.c:88: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L005005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L005009?
;	backup2.c:89: for (k=0; k<4; k++) wait_us(250);
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
;	backup2.c:88: for(j=0; j<ms; j++)
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
;	backup2.c:95: unsigned int volatile GetADC(unsigned char channel)
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
;	backup2.c:100: ADC_CE=0; //Activate the MCP3008 ADC.
	clr	_P2_0
;	backup2.c:102: SPIWrite(0x01);//Send the start bit.
	mov	dpl,#0x01
	push	ar2
	lcall	_SPIWrite
	pop	ar2
;	backup2.c:103: spid=SPIWrite((channel*0x10)|0x80);	//Send single/diff* bit, D2, D1, and D0 bits.
	mov	a,r2
	swap	a
	anl	a,#0xf0
	mov	r2,a
	mov	a,#0x80
	orl	a,r2
	mov	dpl,a
	lcall	_SPIWrite
	mov	r2,dpl
;	backup2.c:104: adc=((spid & 0x03)*0x100);//spid has the two most significant bits of the result.
	mov	a,#0x03
	anl	a,r2
	mov	r4,a
	mov	r3,#0x00
;	backup2.c:105: spid=SPIWrite(0x00);//It doesn't matter what we send now.
	mov	dpl,#0x00
	push	ar3
	push	ar4
	lcall	_SPIWrite
	mov	r2,dpl
	pop	ar4
	pop	ar3
;	backup2.c:106: adc+=spid;//spid contains the low part of the result. 
	mov	r5,#0x00
	mov	a,r2
	add	a,r3
	mov	r3,a
	mov	a,r5
	addc	a,r4
	mov	r4,a
;	backup2.c:108: ADC_CE=1; //Deactivate the MCP3008 ADC.
	setb	_P2_0
;	backup2.c:110: return adc;
	mov	dpl,r3
	mov	dph,r4
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	backup2.c:113: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	backup2.c:115: LCD_E=1;
	setb	_P3_3
;	backup2.c:116: wait_us(40);
	mov	dpl,#0x28
	lcall	_wait_us
;	backup2.c:117: LCD_E=0;
	clr	_P3_3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	backup2.c:120: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	backup2.c:123: ACC=x; //Send high nible
	mov	_ACC,r2
;	backup2.c:124: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P3_7,c
;	backup2.c:125: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P3_6,c
;	backup2.c:126: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P3_5,c
;	backup2.c:127: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P3_4,c
;	backup2.c:128: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	backup2.c:129: wait_us(40);
	mov	dpl,#0x28
	lcall	_wait_us
	pop	ar2
;	backup2.c:130: ACC=x; //Send low nible
	mov	_ACC,r2
;	backup2.c:131: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P3_7,c
;	backup2.c:132: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P3_6,c
;	backup2.c:133: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P3_5,c
;	backup2.c:134: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P3_4,c
;	backup2.c:135: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	backup2.c:138: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	backup2.c:140: LCD_RS=1;
	setb	_P3_2
;	backup2.c:141: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	backup2.c:142: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	backup2.c:145: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	backup2.c:147: LCD_RS=0;
	clr	_P3_2
;	backup2.c:148: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	backup2.c:149: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	backup2.c:152: void LCD_4BIT (void)
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
;	backup2.c:154: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P3_3
;	backup2.c:156: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	backup2.c:158: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	backup2.c:159: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	backup2.c:160: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	backup2.c:163: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	backup2.c:164: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	backup2.c:165: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	backup2.c:166: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	backup2.c:169: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	backup2.c:173: WriteCommand(line==2?0xc0:0x80);
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
;	backup2.c:174: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	backup2.c:175: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
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
;	backup2.c:176: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
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
;phase                     Allocated to registers r6 r7 r0 r1 
;timeDiffsec               Allocated with name '_main_timeDiffsec_1_46'
;freq                      Allocated to registers r2 r3 r4 r5 
;voltage0                  Allocated with name '_main_voltage0_1_46'
;secondrow                 Allocated with name '_main_secondrow_1_46'
;------------------------------------------------------------
;	backup2.c:179: void main (void)  //using ch0 and ch2 for the sin signals 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	backup2.c:210: TMOD&=0B_1111_0000; // Clear the configuration bits for timer 0
	anl	_TMOD,#0xF0
;	backup2.c:211: TMOD|=0B_0000_0001; // Mode 1: 16-bit timer
	orl	_TMOD,#0x01
;	backup2.c:214: LCD_4BIT();
	lcall	_LCD_4BIT
;	backup2.c:218: while(1)
L013073?:
;	backup2.c:220: LCDprint(voltage0,1,1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#_main_voltage0_1_46
	mov	b,#0x40
	lcall	_LCDprint
;	backup2.c:221: LCDprint(secondrow,2,1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#_main_secondrow_1_46
	mov	b,#0x40
	lcall	_LCDprint
;	backup2.c:222: TR0=0;
	clr	_TR0
;	backup2.c:223: TF0=0; // Clear overflow flag
	clr	_TF0
;	backup2.c:224: TL0=0; // Reset the timer
	mov	_TL0,#0x00
;	backup2.c:225: TH0=0;
	mov	_TH0,#0x00
;	backup2.c:227: while (GetADC(0)>2); // Wait for the signal to be zero/ / 
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
;	backup2.c:228: while (GetADC(0)<4); // Wait for the signal to be one
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
;	backup2.c:229: TR0=1; // Start timing
	setb	_TR0
;	backup2.c:231: while (GetADC(3)>2){  //times while signal is above zero
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
	jnc	L013084?
;	backup2.c:232: if (TF0){
;	backup2.c:233: TF0=0;
	jbc	_TF0,L013125?
	sjmp	L013009?
L013125?:
;	backup2.c:234: OVcnt++;
	inc	r2
;	backup2.c:237: while (GetADC(3)<4){ // continues timing until signal reaches zero cross
	cjne	r2,#0x00,L013009?
	inc	r3
	sjmp	L013009?
L013084?:
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
;	backup2.c:238: if (TF0){
;	backup2.c:239: TF0=0;
	jbc	_TF0,L013128?
	sjmp	L013014?
L013128?:
;	backup2.c:240: OVcnt++;
	inc	r2
	cjne	r2,#0x00,L013014?
	inc	r3
	sjmp	L013014?
L013016?:
;	backup2.c:243: TR0=0; // Stop timer 0
	clr	_TR0
;	backup2.c:245: timeDiff=OVcnt*65536.0+TH0*256.0+TL0; // getting value of time right at the other zero cross			units of 1/clk
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
;	backup2.c:246: timeDiffsec = (timeDiff/22118.400); //now the time difference is in milliseconds 
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
;	backup2.c:257: TF0=0; // Clear overflow flag
	clr	_TF0
;	backup2.c:258: TL0=0; // Reset the timer
	mov	_TL0,#0x00
;	backup2.c:259: TH0=0;
	mov	_TH0,#0x00
;	backup2.c:261: while (GetADC(0)>2); // Wait for the signal to be zero
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
;	backup2.c:262: while (GetADC(0)<4); // Wait for the signal to be one
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
;	backup2.c:263: TR0=1; // Start timing
	setb	_TR0
;	backup2.c:264: while (GetADC(0)>2) // Wait for the signal to be zero   
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
;	backup2.c:266: if (TF0){
;	backup2.c:267: TF0=0;
	jbc	_TF0,L013133?
	sjmp	L013025?
L013133?:
;	backup2.c:268: OVcnt++;
	inc	r6
	cjne	r6,#0x00,L013025?
	inc	r7
	sjmp	L013025?
L013027?:
;	backup2.c:271: TR0=0; // Stop timer 0
	clr	_TR0
;	backup2.c:273: half_period0=OVcnt*65536.0+TH0*256.0+TL0; // half_period is a float and is in units of 1/clk. To convert, divide by clk
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
;	backup2.c:274: qPeriod0 = half_period0/2.0;
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
;	backup2.c:276: TF0 = 0;
	clr	_TF0
;	backup2.c:277: TL0 = 0;
	mov	_TL0,#0x00
;	backup2.c:278: TH0 = 0;
	mov	_TH0,#0x00
;	backup2.c:280: while (GetADC(0)>2); // Wait for the signal to be zero
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
;	backup2.c:281: while (GetADC(0)<4); // Wait for the signal to be one
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
;	backup2.c:282: TR0 = 1;
	setb	_TR0
;	backup2.c:283: while((OVcnt*65536.0+TH0*256.0+TL0)<qPeriod0){
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
;	backup2.c:284: if (TF0){
;	backup2.c:285: TF0=0;
	jbc	_TF0,L013138?
	ljmp	L013036?
L013138?:
;	backup2.c:286: OVcnt++;     		
	inc	_main_OVcnt_1_46
	clr	a
	cjne	a,_main_OVcnt_1_46,L013139?
	inc	(_main_OVcnt_1_46 + 1)
L013139?:
	ljmp	L013036?
L013038?:
;	backup2.c:289: TR0 = 0;
	clr	_TR0
;	backup2.c:290: pVolt0=(GetADC(0)*VREF)/1023.0;
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
;	backup2.c:291: pVolt0rms = pVolt0/1.41421356237;
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
;	backup2.c:292: time0 = (half_period0/22118.400)*2.0; //period in milliseconds
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
;	backup2.c:293: freq = 1/(time0/1000);  
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
;	backup2.c:294: sprintf(voltage0,"1:%4.2frms %4.1fHz",pVolt0rms,freq);
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
;	backup2.c:301: TF0=0; // Clear overflow flag
	clr	_TF0
;	backup2.c:302: TL0=0; // Reset the timer
	mov	_TL0,#0x00
;	backup2.c:303: TH0=0;
	mov	_TH0,#0x00
;	backup2.c:305: while (GetADC(3)>2); // Wait for the signal to be zero
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
;	backup2.c:306: while (GetADC(3)<4); // Wait for the signal to be one
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
;	backup2.c:307: TR0=1; // Start timing
	setb	_TR0
;	backup2.c:308: while (GetADC(3)>2) // Wait for the signal to be zero   
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
;	backup2.c:310: if (TF0){
;	backup2.c:311: TF0=0;
	jbc	_TF0,L013143?
	sjmp	L013047?
L013143?:
;	backup2.c:312: OVcnt1++;
	inc	r2
	cjne	r2,#0x00,L013047?
	inc	r3
	sjmp	L013047?
L013049?:
;	backup2.c:315: TR0=0; // Stop timer 0
	clr	_TR0
;	backup2.c:317: half_period1=OVcnt1*65536.0+TH0*256.0+TL0; // half_period is a float and is in units of 1/clk. To convert, divide by clk
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
;	backup2.c:318: qPeriod1 = half_period1/2.0;
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
;	backup2.c:319: TR0 = 0;
	clr	_TR0
;	backup2.c:320: TF0 = 0;
	clr	_TF0
;	backup2.c:321: TL0 = 0;
	mov	_TL0,#0x00
;	backup2.c:322: TH0 = 0;
	mov	_TH0,#0x00
;	backup2.c:325: while (GetADC(3)>2); // Wait for the signal to be zero
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
;	backup2.c:326: while (GetADC(3)<4); // Wait for the signal to be one
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
;	backup2.c:327: TR0 = 1;
	setb	_TR0
;	backup2.c:328: while((OVcnt1*65536.0+TH0*256.0+TL0)<qPeriod1){
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
;	backup2.c:329: if (TF0){
;	backup2.c:330: TF0=0;
	jbc	_TF0,L013148?
	ljmp	L013058?
L013148?:
;	backup2.c:331: OVcnt1++;     		
	inc	_main_OVcnt1_1_46
	clr	a
	cjne	a,_main_OVcnt1_1_46,L013149?
	inc	(_main_OVcnt1_1_46 + 1)
L013149?:
	ljmp	L013058?
L013060?:
;	backup2.c:334: TR0 = 0;
	clr	_TR0
;	backup2.c:336: pVolt1=(GetADC(3)*VREF)/1023.0; //converting adc value into voltage
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
;	backup2.c:337: time1 = (half_period1/22118.400)*2.0; //period in milliseconds
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
;	backup2.c:338: pVolt1rms = pVolt1/1.41421356237; 
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
;	backup2.c:339: phase = timeDiffsec*(360.0/time0); //phase in degrees 
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
;	backup2.c:340: if(phase>180){
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	clr	a
	push	acc
	push	acc
	mov	a,#0x34
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
	mov	a,r2
	jnz	L013150?
	ljmp	L013070?
L013150?:
;	backup2.c:341: phase = phase-360.0;
	clr	a
	push	acc
	push	acc
	mov	a,#0xB4
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fssub
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	backup2.c:342: sprintf(secondrow,"3:%4.2frms %4.2f\xDF""",pVolt1rms,phase);
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	push	ar6
	push	ar7
	push	ar0
	push	ar1
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
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
;	backup2.c:343: if(phase<0.0){
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
	mov	a,r2
	jnz	L013151?
	ljmp	L013071?
L013151?:
;	backup2.c:344: if(phase < -20.0){
	push	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	clr	a
	push	acc
	push	acc
	mov	a,#0xA0
	push	acc
	mov	a,#0xC1
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fslt
	mov	r3,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar2
	mov	a,r3
	jz	L013065?
;	backup2.c:345: phase = phase - 5.0;
	clr	a
	push	acc
	push	acc
	mov	a,#0xA0
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fssub
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	backup2.c:346: sprintf(secondrow,"3:%4.2frms %4.2f\xDF""",pVolt1rms,phase);
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	push	ar6
	push	ar7
	push	ar0
	push	ar1
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
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
	ljmp	L013071?
L013065?:
;	backup2.c:348: else if(phase > -20 && phase < 0.0){
	push	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	clr	a
	push	acc
	push	acc
	mov	a,#0xA0
	push	acc
	mov	a,#0xC1
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsgt
	mov	r3,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar2
	mov	a,r3
	jnz	L013153?
	ljmp	L013071?
L013153?:
	mov	a,r2
	jnz	L013154?
	ljmp	L013071?
L013154?:
;	backup2.c:349: phase = phase - 3.0;
	clr	a
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fssub
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	backup2.c:350: sprintf(secondrow,"3:%4.2frms %4.2f\xDF""",pVolt1rms,phase);
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	push	ar6
	push	ar7
	push	ar0
	push	ar1
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
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
	sjmp	L013071?
L013070?:
;	backup2.c:355: sprintf(secondrow,"3:%4.2frms %4.2f\xDF""",pVolt1rms,phase);
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	push	ar6
	push	ar7
	push	ar0
	push	ar1
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
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
L013071?:
;	backup2.c:359: printf("channel 0 period(ms):%5.3f\n", time0);
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	push	_main_time0_1_46
	push	(_main_time0_1_46 + 1)
	push	(_main_time0_1_46 + 2)
	push	(_main_time0_1_46 + 3)
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	backup2.c:360: printf("channel 0 voltage(rms):%5.3f\n", pVolt0rms);
	push	_main_pVolt0rms_1_46
	push	(_main_pVolt0rms_1_46 + 1)
	push	(_main_pVolt0rms_1_46 + 2)
	push	(_main_pVolt0rms_1_46 + 3)
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
;	backup2.c:361: printf("channel 3 period(ms):%5.3f\n", time1);
	push	_main_time1_1_46
	push	(_main_time1_1_46 + 1)
	push	(_main_time1_1_46 + 2)
	push	(_main_time1_1_46 + 3)
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
;	backup2.c:362: printf("channel 3 voltage(rms):%5.3f\n", pVolt1rms);
	push	_main_pVolt1rms_1_46
	push	(_main_pVolt1rms_1_46 + 1)
	push	(_main_pVolt1rms_1_46 + 2)
	push	(_main_pVolt1rms_1_46 + 3)
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
;	backup2.c:363: printf("phase (degrees): %5.3f\n",phase);
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
	ljmp	L013073?
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
	db 'channel 0 period(ms):%5.3f'
	db 0x0A
	db 0x00
__str_3:
	db 'channel 0 voltage(rms):%5.3f'
	db 0x0A
	db 0x00
__str_4:
	db 'channel 3 period(ms):%5.3f'
	db 0x0A
	db 0x00
__str_5:
	db 'channel 3 voltage(rms):%5.3f'
	db 0x0A
	db 0x00
__str_6:
	db 'phase (degrees): %5.3f'
	db 0x0A
	db 0x00

	CSEG

end
