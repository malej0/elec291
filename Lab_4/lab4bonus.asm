;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Thu Mar 03 19:50:49 2022
;--------------------------------------------------------
$name lab4bonus
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
_main_temp_1_46:
	ds 10
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:25: unsigned char SPIWrite(unsigned char out_byte)
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	using	0
	mov	_ACC,dpl
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:30: BB_MOSI=ACC_7; BB_SCLK=1; B_7=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_7
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_7,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:31: BB_MOSI=ACC_6; BB_SCLK=1; B_6=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_6
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_6,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:32: BB_MOSI=ACC_5; BB_SCLK=1; B_5=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_5
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_5,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:33: BB_MOSI=ACC_4; BB_SCLK=1; B_4=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_4
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_4,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:34: BB_MOSI=ACC_3; BB_SCLK=1; B_3=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_3
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_3,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:35: BB_MOSI=ACC_2; BB_SCLK=1; B_2=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_2
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_2,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:36: BB_MOSI=ACC_1; BB_SCLK=1; B_1=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_1
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_1,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:37: BB_MOSI=ACC_0; BB_SCLK=1; B_0=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_0
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_0,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:39: return B;
	mov	dpl,_B
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:42: unsigned char _c51_external_startup(void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:44: AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O
	mov	_AUXR,#0x11
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:46: P0M0=0x00; P0M1=0x00;    
	mov	_P0M0,#0x00
	mov	_P0M1,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:47: P1M0=0x00; P1M1=0x00;    
	mov	_P1M0,#0x00
	mov	_P1M1,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:48: P2M0=0x00; P2M1=0x00;    
	mov	_P2M0,#0x00
	mov	_P2M1,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:49: P3M0=0x00; P3M1=0x00;
	mov	_P3M0,#0x00
	mov	_P3M1,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:52: ADC_CE=0;  // Disable SPI access to MCP3008
	clr	_P2_0
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:53: BB_SCLK=0; // Resting state of SPI clock is '0'
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:54: BB_MISO=1; // Write '1' to MISO before using as input
	setb	_P2_2
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:57: PCON|=0x80;
	orl	_PCON,#0x80
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:58: SCON = 0x52;
	mov	_SCON,#0x52
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:59: BDRCON=0;
	mov	_BDRCON,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:63: BRL=BRG_VAL;
	mov	_BRL,#0xF4
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:64: BDRCON=BRR|TBCK|RBCK|SPD;
	mov	_BDRCON,#0x1E
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:66: CLKREG=0x00; // TPS=0000B
	mov	_CLKREG,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:68: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_us'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:71: void wait_us (unsigned char x)
;	-----------------------------------------
;	 function wait_us
;	-----------------------------------------
_wait_us:
	mov	r2,dpl
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:75: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:76: TMOD&=0xf0; // Clear the configuration bits for timer 0
	anl	_TMOD,#0xF0
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:77: TMOD|=0x01; // Mode 1: 16-bit timer
	orl	_TMOD,#0x01
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:79: if(x>5) x-=5; // Subtract the overhead
	mov	a,r2
	add	a,#0xff - 0x05
	jnc	L004002?
	mov	a,r2
	add	a,#0xfb
	mov	r2,a
	sjmp	L004003?
L004002?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:80: else x=1;
	mov	r2,#0x01
L004003?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:82: j=-ONE_USEC*x;
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:83: TF0=0;
	clr	_TF0
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:84: TH0=j/0x100;
	mov	ar4,r3
	mov	r5,#0x00
	mov	_TH0,r4
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:85: TL0=j%0x100;
	mov	r3,#0x00
	mov	_TL0,r2
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:86: TR0=1; // Start timer 0
	setb	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:87: while(TF0==0); //Wait for overflow
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:90: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:94: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L005005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L005009?
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:95: for (k=0; k<4; k++) wait_us(250);
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:94: for(j=0; j<ms; j++)
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:99: unsigned int volatile GetADC(unsigned char channel)
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:104: ADC_CE=0; // Activate the MCP3008 ADC.
	clr	_P2_0
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:106: SPIWrite(0x01);// Send the start bit.
	mov	dpl,#0x01
	push	ar2
	lcall	_SPIWrite
	pop	ar2
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:107: spid=SPIWrite((channel*0x10)|0x80);	//Send single/diff* bit, D2, D1, and D0 bits.
	mov	a,r2
	swap	a
	anl	a,#0xf0
	mov	r2,a
	mov	a,#0x80
	orl	a,r2
	mov	dpl,a
	lcall	_SPIWrite
	mov	r2,dpl
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:108: adc=((spid & 0x03)*0x100);// spid has the two most significant bits of the result.
	mov	a,#0x03
	anl	a,r2
	mov	r4,a
	mov	r3,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:109: spid=SPIWrite(0x00);// It doesn't matter what we send now.
	mov	dpl,#0x00
	push	ar3
	push	ar4
	lcall	_SPIWrite
	mov	r2,dpl
	pop	ar4
	pop	ar3
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:110: adc+=spid;// spid contains the low part of the result. 
	mov	r5,#0x00
	mov	a,r2
	add	a,r3
	mov	r3,a
	mov	a,r5
	addc	a,r4
	mov	r4,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:112: ADC_CE=1; // Deactivate the MCP3008 ADC.
	setb	_P2_0
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:114: return adc;
	mov	dpl,r3
	mov	dph,r4
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:116: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:118: LCD_E=1;
	setb	_P3_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:119: wait_us(40);
	mov	dpl,#0x28
	lcall	_wait_us
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:120: LCD_E=0;
	clr	_P3_3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:124: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:127: ACC=x; //Send high nible
	mov	_ACC,r2
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:128: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P3_7,c
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:129: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P3_6,c
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:130: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P3_5,c
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:131: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P3_4,c
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:132: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:133: wait_us(40);
	mov	dpl,#0x28
	lcall	_wait_us
	pop	ar2
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:134: ACC=x; //Send low nible
	mov	_ACC,r2
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:135: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P3_7,c
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:136: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P3_6,c
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:137: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P3_5,c
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:138: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P3_4,c
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:139: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:142: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:144: LCD_RS=1;
	setb	_P3_2
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:145: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:146: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:149: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:151: LCD_RS=0;
	clr	_P3_2
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:152: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:153: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:156: void LCD_4BIT (void)
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:158: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P3_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:160: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:162: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:163: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:164: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:167: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:168: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:169: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:170: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:173: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:177: WriteCommand(line==2?0xc0:0x80);
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:178: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:179: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:180: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
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
;y                         Allocated to registers r2 r3 r4 r5 
;temperature               Allocated to registers r2 r3 r4 r5 
;temp                      Allocated with name '_main_temp_1_46'
;------------------------------------------------------------
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:186: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:191: LCD_4BIT();
	lcall	_LCD_4BIT
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:193: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:198: while(1)
L013002?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:200: waitms(100);	//writes every 100ms 	
	mov	dptr,#0x0064
	lcall	_waitms
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:201: y=(GetADC(0)*VREF)/1023.0; // Convert the 10-bit integer from the ADC to voltage
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:202: temperature = 100*(y-2.73); // should now have the value of the temperature (using the LM355 transfer function)
	mov	a,#0x52
	push	acc
	mov	a,#0xB8
	push	acc
	mov	a,#0x2E
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fssub
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
	mov	b,#0xC8
	mov	a,#0x42
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:203: printf("%5.3f\n",temperature);// now it outputs the value of the temperature in Celsius 
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:204: sprintf(temp,"%f",temperature); 
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_temp_1_46
	push	acc
	mov	a,#(_main_temp_1_46 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:205: LCDprint("Temp(Celsius):",1,1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_2
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\mtale\Desktop\ELEC291\Lab_4\lab4bonus.c:206: LCDprint(temp,2,1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#_main_temp_1_46
	mov	b,#0x40
	lcall	_LCDprint
	ljmp	L013002?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db '%5.3f'
	db 0x0A
	db 0x00
__str_1:
	db '%f'
	db 0x00
__str_2:
	db 'Temp(Celsius):'
	db 0x00

	CSEG

end
