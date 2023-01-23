;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Wed Mar 09 21:31:39 2022
;--------------------------------------------------------
$name lab5backup1period
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
	public _GetADC
	public _waitms
	public _wait_us
	public __c51_external_startup
	public _SPIWrite
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
_main_half_period0_1_34:
	ds 4
_main_half_period1_1_34:
	ds 4
_main_qPeriod0_1_34:
	ds 4
_main_time0_1_34:
	ds 4
_main_time1_1_34:
	ds 4
_main_qPeriod1_1_34:
	ds 4
_main_OVcnt_1_34:
	ds 2
_main_OVcnt1_1_34:
	ds 2
_main_pVolt0_1_34:
	ds 4
_main_pVolt1_1_34:
	ds 4
_main_pVolt0rms_1_34:
	ds 4
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:19: unsigned char SPIWrite(unsigned char out_byte)
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	using	0
	mov	_ACC,dpl
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:24: BB_MOSI=ACC_7; BB_SCLK=1; B_7=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_7
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_7,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:25: BB_MOSI=ACC_6; BB_SCLK=1; B_6=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_6
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_6,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:26: BB_MOSI=ACC_5; BB_SCLK=1; B_5=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_5
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_5,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:27: BB_MOSI=ACC_4; BB_SCLK=1; B_4=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_4
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_4,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:28: BB_MOSI=ACC_3; BB_SCLK=1; B_3=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_3
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_3,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:29: BB_MOSI=ACC_2; BB_SCLK=1; B_2=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_2
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_2,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:30: BB_MOSI=ACC_1; BB_SCLK=1; B_1=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_1
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_1,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:31: BB_MOSI=ACC_0; BB_SCLK=1; B_0=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_0
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_0,c
	clr	_P2_3
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:33: return B;
	mov	dpl,_B
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:36: unsigned char _c51_external_startup(void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:38: AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O
	mov	_AUXR,#0x11
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:40: P0M0=0x00; P0M1=0x00;    
	mov	_P0M0,#0x00
	mov	_P0M1,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:41: P1M0=0x00; P1M1=0x00;    
	mov	_P1M0,#0x00
	mov	_P1M1,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:42: P2M0=0x00; P2M1=0x00;    
	mov	_P2M0,#0x00
	mov	_P2M1,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:43: P3M0=0x00; P3M1=0x00;    
	mov	_P3M0,#0x00
	mov	_P3M1,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:44: PCON|=0x80;
	orl	_PCON,#0x80
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:45: SCON = 0x52;
	mov	_SCON,#0x52
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:46: BDRCON=0;
	mov	_BDRCON,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:50: BRL=BRG_VAL;
	mov	_BRL,#0xF4
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:51: BDRCON=BRR|TBCK|RBCK|SPD;
	mov	_BDRCON,#0x1E
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:53: CLKREG=0x00; // TPS=0000B
	mov	_CLKREG,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:55: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_us'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:58: void wait_us (unsigned char x)
;	-----------------------------------------
;	 function wait_us
;	-----------------------------------------
_wait_us:
	mov	r2,dpl
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:62: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:63: TMOD&=0xf0; // Clear the configuration bits for timer 0
	anl	_TMOD,#0xF0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:64: TMOD|=0x01; // Mode 1: 16-bit timer
	orl	_TMOD,#0x01
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:66: if(x>5) x-=5; // Subtract the overhead
	mov	a,r2
	add	a,#0xff - 0x05
	jnc	L004002?
	mov	a,r2
	add	a,#0xfb
	mov	r2,a
	sjmp	L004003?
L004002?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:67: else x=1;
	mov	r2,#0x01
L004003?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:69: j=-ONE_USEC*x;
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:70: TF0=0;
	clr	_TF0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:71: TH0=j/0x100;
	mov	ar4,r3
	mov	r5,#0x00
	mov	_TH0,r4
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:72: TL0=j%0x100;
	mov	r3,#0x00
	mov	_TL0,r2
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:73: TR0=1; // Start timer 0
	setb	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:74: while(TF0==0); //Wait for overflow
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:77: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:81: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L005005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L005009?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:82: for (k=0; k<4; k++) wait_us(250);
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:81: for(j=0; j<ms; j++)
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:86: unsigned int volatile GetADC(unsigned char channel)
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:91: ADC_CE=0; //Activate the MCP3008 ADC.
	clr	_P2_0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:93: SPIWrite(0x01);//Send the start bit.
	mov	dpl,#0x01
	push	ar2
	lcall	_SPIWrite
	pop	ar2
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:94: spid=SPIWrite((channel*0x10)|0x80);	//Send single/diff* bit, D2, D1, and D0 bits.
	mov	a,r2
	swap	a
	anl	a,#0xf0
	mov	r2,a
	mov	a,#0x80
	orl	a,r2
	mov	dpl,a
	lcall	_SPIWrite
	mov	r2,dpl
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:95: adc=((spid & 0x03)*0x100);//spid has the two most significant bits of the result.
	mov	a,#0x03
	anl	a,r2
	mov	r4,a
	mov	r3,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:96: spid=SPIWrite(0x00);//It doesn't matter what we send now.
	mov	dpl,#0x00
	push	ar3
	push	ar4
	lcall	_SPIWrite
	mov	r2,dpl
	pop	ar4
	pop	ar3
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:97: adc+=spid;//spid contains the low part of the result. 
	mov	r5,#0x00
	mov	a,r2
	add	a,r3
	mov	r3,a
	mov	a,r5
	addc	a,r4
	mov	r4,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:99: ADC_CE=1; //Deactivate the MCP3008 ADC.
	setb	_P2_0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:101: return adc;
	mov	dpl,r3
	mov	dph,r4
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;half_period0              Allocated with name '_main_half_period0_1_34'
;half_period1              Allocated with name '_main_half_period1_1_34'
;qPeriod0                  Allocated with name '_main_qPeriod0_1_34'
;time0                     Allocated with name '_main_time0_1_34'
;time1                     Allocated with name '_main_time1_1_34'
;qPeriod1                  Allocated with name '_main_qPeriod1_1_34'
;OVcnt                     Allocated with name '_main_OVcnt_1_34'
;OVcnt1                    Allocated with name '_main_OVcnt1_1_34'
;pVolt0                    Allocated with name '_main_pVolt0_1_34'
;pVolt1                    Allocated with name '_main_pVolt1_1_34'
;pVolt0rms                 Allocated with name '_main_pVolt0rms_1_34'
;pVolt1rms                 Allocated to registers r6 r7 r0 r1 
;timeDiff                  Allocated to registers r2 r3 r4 r5 
;phase                     Allocated to registers r2 r3 r4 r5 
;timeDiffsec               Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:107: void main (void)  //using ch0 and ch2 for the sin signals 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:138: TMOD&=0B_1111_0000; // Clear the configuration bits for timer 0
	anl	_TMOD,#0xF0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:139: TMOD|=0B_0000_0001; // Mode 1: 16-bit timer
	orl	_TMOD,#0x01
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:146: while(1)
L007062?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:151: TF0=0; // Clear overflow flag
	clr	_TF0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:152: TL0=0; // Reset the timer
	mov	_TL0,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:153: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:155: while (GetADC(0)>2); // Wait for the signal to be zero
L007001?:
	mov	dpl,#0x00
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,#0x02
	subb	a,r2
	clr	a
	subb	a,r3
	jc	L007001?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:156: while (GetADC(0)<4); // Wait for the signal to be one
L007004?:
	mov	dpl,#0x00
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,r2
	subb	a,#0x04
	mov	a,r3
	subb	a,#0x00
	jc	L007004?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:157: TR0=1; // Start timing
	setb	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:158: while (GetADC(0)>2) // Wait for the signal to be zero   
	mov	r2,#0x00
	mov	r3,#0x00
L007009?:
	mov	dpl,#0x00
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
	jnc	L007011?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:160: if (TF0){
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:161: TF0=0;
	jbc	_TF0,L007109?
	sjmp	L007009?
L007109?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:162: OVcnt++;
	inc	r2
	cjne	r2,#0x00,L007009?
	inc	r3
	sjmp	L007009?
L007011?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:165: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:167: half_period0=OVcnt*65536.0+TH0*256.0+TL0; // half_period is a float and is in units of 1/clk. To convert, divide by clk
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
	mov	_main_half_period0_1_34,dpl
	mov	(_main_half_period0_1_34 + 1),dph
	mov	(_main_half_period0_1_34 + 2),b
	mov	(_main_half_period0_1_34 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:168: qPeriod0 = half_period0/2.0;
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,_main_half_period0_1_34
	mov	dph,(_main_half_period0_1_34 + 1)
	mov	b,(_main_half_period0_1_34 + 2)
	mov	a,(_main_half_period0_1_34 + 3)
	lcall	___fsdiv
	mov	_main_qPeriod0_1_34,dpl
	mov	(_main_qPeriod0_1_34 + 1),dph
	mov	(_main_qPeriod0_1_34 + 2),b
	mov	(_main_qPeriod0_1_34 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:170: TF0 = 0;
	clr	_TF0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:171: TL0 = 0;
	mov	_TL0,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:172: TH0 = 0;
	mov	_TH0,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:175: while (GetADC(0)>2); // Wait for the signal to be zero
L007012?:
	mov	dpl,#0x00
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,#0x02
	subb	a,r2
	clr	a
	subb	a,r3
	jc	L007012?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:176: while (GetADC(0)<4); // Wait for the signal to be one
L007015?:
	mov	dpl,#0x00
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,r2
	subb	a,#0x04
	mov	a,r3
	subb	a,#0x00
	jc	L007015?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:177: TR0 = 1;
	setb	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:178: while((OVcnt*65536.0+TH0*256.0+TL0)<qPeriod0){
	clr	a
	mov	_main_OVcnt_1_34,a
	mov	(_main_OVcnt_1_34 + 1),a
L007020?:
	mov	dpl,_main_OVcnt_1_34
	mov	dph,(_main_OVcnt_1_34 + 1)
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
	push	_main_qPeriod0_1_34
	push	(_main_qPeriod0_1_34 + 1)
	push	(_main_qPeriod0_1_34 + 2)
	push	(_main_qPeriod0_1_34 + 3)
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
	jz	L007022?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:179: if (TF0){
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:180: TF0=0;
	jbc	_TF0,L007114?
	ljmp	L007020?
L007114?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:181: OVcnt++;     		
	inc	_main_OVcnt_1_34
	clr	a
	cjne	a,_main_OVcnt_1_34,L007115?
	inc	(_main_OVcnt_1_34 + 1)
L007115?:
	ljmp	L007020?
L007022?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:184: TR0 = 0;
	clr	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:185: pVolt0=(GetADC(0)*VREF)/1023.0;
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
	mov	_main_pVolt0_1_34,dpl
	mov	(_main_pVolt0_1_34 + 1),dph
	mov	(_main_pVolt0_1_34 + 2),b
	mov	(_main_pVolt0_1_34 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:186: time0 = (half_period0/22118.400)*2.0; //period in milliseconds  
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	mov	a,#0xAC
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,_main_half_period0_1_34
	mov	dph,(_main_half_period0_1_34 + 1)
	mov	b,(_main_half_period0_1_34 + 2)
	mov	a,(_main_half_period0_1_34 + 3)
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
	mov	_main_time0_1_34,dpl
	mov	(_main_time0_1_34 + 1),dph
	mov	(_main_time0_1_34 + 2),b
	mov	(_main_time0_1_34 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:193: TF0=0; // Clear overflow flag
	clr	_TF0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:194: TL0=0; // Reset the timer
	mov	_TL0,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:195: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:197: while (GetADC(3)>2); // Wait for the signal to be zero
L007023?:
	mov	dpl,#0x03
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,#0x02
	subb	a,r2
	clr	a
	subb	a,r3
	jc	L007023?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:198: while (GetADC(3)<4); // Wait for the signal to be one
L007026?:
	mov	dpl,#0x03
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,r2
	subb	a,#0x04
	mov	a,r3
	subb	a,#0x00
	jc	L007026?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:199: TR0=1; // Start timing
	setb	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:200: while (GetADC(3)>2) // Wait for the signal to be zero   
	mov	r2,#0x00
	mov	r3,#0x00
L007031?:
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
	jnc	L007033?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:202: if (TF0){
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:203: TF0=0;
	jbc	_TF0,L007119?
	sjmp	L007031?
L007119?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:204: OVcnt1++;
	inc	r2
	cjne	r2,#0x00,L007031?
	inc	r3
	sjmp	L007031?
L007033?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:207: TR0=1; // Stop timer 0
	setb	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:209: half_period1=OVcnt1*65536.0+TH0*256.0+TL0; // half_period is a float and is in units of 1/clk. To convert, divide by clk
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
	mov	_main_half_period1_1_34,dpl
	mov	(_main_half_period1_1_34 + 1),dph
	mov	(_main_half_period1_1_34 + 2),b
	mov	(_main_half_period1_1_34 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:210: qPeriod1 = half_period1/2.0;
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,_main_half_period1_1_34
	mov	dph,(_main_half_period1_1_34 + 1)
	mov	b,(_main_half_period1_1_34 + 2)
	mov	a,(_main_half_period1_1_34 + 3)
	lcall	___fsdiv
	mov	_main_qPeriod1_1_34,dpl
	mov	(_main_qPeriod1_1_34 + 1),dph
	mov	(_main_qPeriod1_1_34 + 2),b
	mov	(_main_qPeriod1_1_34 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:211: TR0 = 0;
	clr	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:212: TF0 = 0;
	clr	_TF0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:213: TL0 = 0;
	mov	_TL0,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:214: TH0 = 0;
	mov	_TH0,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:217: while (GetADC(3)>2); // Wait for the signal to be zero
L007034?:
	mov	dpl,#0x03
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,#0x02
	subb	a,r2
	clr	a
	subb	a,r3
	jc	L007034?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:218: while (GetADC(3)<4); // Wait for the signal to be one
L007037?:
	mov	dpl,#0x03
	lcall	_GetADC
	mov	r2,dpl
	mov	r3,dph
	clr	c
	mov	a,r2
	subb	a,#0x04
	mov	a,r3
	subb	a,#0x00
	jc	L007037?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:219: TR0 = 1;
	setb	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:220: while((OVcnt1*65536.0+TH0*256.0+TL0)<qPeriod1){
	clr	a
	mov	_main_OVcnt1_1_34,a
	mov	(_main_OVcnt1_1_34 + 1),a
L007042?:
	mov	dpl,_main_OVcnt1_1_34
	mov	dph,(_main_OVcnt1_1_34 + 1)
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
	push	_main_qPeriod1_1_34
	push	(_main_qPeriod1_1_34 + 1)
	push	(_main_qPeriod1_1_34 + 2)
	push	(_main_qPeriod1_1_34 + 3)
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
	jz	L007044?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:221: if (TF0){
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:222: TF0=0;
	jbc	_TF0,L007124?
	ljmp	L007042?
L007124?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:223: OVcnt1++;     		
	inc	_main_OVcnt1_1_34
	clr	a
	cjne	a,_main_OVcnt1_1_34,L007125?
	inc	(_main_OVcnt1_1_34 + 1)
L007125?:
	ljmp	L007042?
L007044?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:226: TR0 = 0;
	clr	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:228: pVolt1=(GetADC(3)*VREF)/1023.0; //converting adc value into voltage
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
	mov	_main_pVolt1_1_34,dpl
	mov	(_main_pVolt1_1_34 + 1),dph
	mov	(_main_pVolt1_1_34 + 2),b
	mov	(_main_pVolt1_1_34 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:229: time1 = (half_period1/22118.400)*2.0; //period in milliseconds  
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	mov	a,#0xAC
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,_main_half_period1_1_34
	mov	dph,(_main_half_period1_1_34 + 1)
	mov	b,(_main_half_period1_1_34 + 2)
	mov	a,(_main_half_period1_1_34 + 3)
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
	mov	_main_time1_1_34,dpl
	mov	(_main_time1_1_34 + 1),dph
	mov	(_main_time1_1_34 + 2),b
	mov	(_main_time1_1_34 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:231: TF0=0; // Clear overflow flag
	clr	_TF0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:232: TL0=0; // Reset the timer
	mov	_TL0,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:233: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:235: while (GetADC(0)>2); // Wait for the signal to be zero
L007045?:
	mov	dpl,#0x00
	lcall	_GetADC
	mov	r6,dpl
	mov	r7,dph
	clr	c
	mov	a,#0x02
	subb	a,r6
	clr	a
	subb	a,r7
	jc	L007045?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:236: while (GetADC(0)<4); // Wait for the signal to be one
L007048?:
	mov	dpl,#0x00
	lcall	_GetADC
	mov	r6,dpl
	mov	r7,dph
	clr	c
	mov	a,r6
	subb	a,#0x04
	mov	a,r7
	subb	a,#0x00
	jc	L007048?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:237: TR0=1; // Start timing
	setb	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:239: while (GetADC(3)>2){  //times while signal is above zero
	mov	r6,#0x00
	mov	r7,#0x00
L007053?:
	mov	dpl,#0x03
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
	jnc	L007097?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:240: if (TF0){
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:241: TF0=0;
	jbc	_TF0,L007129?
	sjmp	L007053?
L007129?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:242: OVcnt++;
	inc	r6
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:245: while (GetADC(3)<4){ // continues timing until signal reaches zero cross
	cjne	r6,#0x00,L007053?
	inc	r7
	sjmp	L007053?
L007097?:
L007058?:
	mov	dpl,#0x03
	push	ar6
	push	ar7
	lcall	_GetADC
	mov	r0,dpl
	mov	r1,dph
	pop	ar7
	pop	ar6
	clr	c
	mov	a,r0
	subb	a,#0x04
	mov	a,r1
	subb	a,#0x00
	jnc	L007060?
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:246: if (TF0){
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:247: TF0=0;
	jbc	_TF0,L007132?
	sjmp	L007058?
L007132?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:248: OVcnt++;
	inc	r6
	cjne	r6,#0x00,L007058?
	inc	r7
	sjmp	L007058?
L007060?:
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:251: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:253: timeDiff=OVcnt*65536.0+TH0*256.0+TL0; // getting value of time right at the other zero cross			units of 1/clk
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
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:255: timeDiffsec = (timeDiff/22118.400); //now the time difference is in milliseconds 
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
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:257: phase = timeDiffsec*(360.0/time0); //phase in degrees 
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	_main_time0_1_34
	push	(_main_time0_1_34 + 1)
	push	(_main_time0_1_34 + 2)
	push	(_main_time0_1_34 + 3)
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
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:259: pVolt0rms = pVolt0/1.41421356237; //finding rms 
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#0xF3
	push	acc
	mov	a,#0x04
	push	acc
	mov	a,#0xB5
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_pVolt0_1_34
	mov	dph,(_main_pVolt0_1_34 + 1)
	mov	b,(_main_pVolt0_1_34 + 2)
	mov	a,(_main_pVolt0_1_34 + 3)
	lcall	___fsdiv
	mov	_main_pVolt0rms_1_34,dpl
	mov	(_main_pVolt0rms_1_34 + 1),dph
	mov	(_main_pVolt0rms_1_34 + 2),b
	mov	(_main_pVolt0rms_1_34 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:260: pVolt1rms = pVolt1/1.41421356237;
	mov	a,#0xF3
	push	acc
	mov	a,#0x04
	push	acc
	mov	a,#0xB5
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_pVolt1_1_34
	mov	dph,(_main_pVolt1_1_34 + 1)
	mov	b,(_main_pVolt1_1_34 + 2)
	mov	a,(_main_pVolt1_1_34 + 3)
	lcall	___fsdiv
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:262: printf("channel 0 period(ms):%5.3f\n", time0);
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	push	_main_time0_1_34
	push	(_main_time0_1_34 + 1)
	push	(_main_time0_1_34 + 2)
	push	(_main_time0_1_34 + 3)
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:263: printf("channel 0 voltage(rms):%f\n", pVolt0rms);
	push	_main_pVolt0rms_1_34
	push	(_main_pVolt0rms_1_34 + 1)
	push	(_main_pVolt0rms_1_34 + 2)
	push	(_main_pVolt0rms_1_34 + 3)
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:264: printf("channel 3 period(ms):%5.3f\n", time1);
	push	_main_time1_1_34
	push	(_main_time1_1_34 + 1)
	push	(_main_time1_1_34 + 2)
	push	(_main_time1_1_34 + 3)
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:265: printf("channel 3 voltage(rms):%f\n", pVolt1rms);
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
;	C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5backup1period.c:266: printf("phase (degrees): %f\n",phase);
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
	ljmp	L007062?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'channel 0 period(ms):%5.3f'
	db 0x0A
	db 0x00
__str_1:
	db 'channel 0 voltage(rms):%f'
	db 0x0A
	db 0x00
__str_2:
	db 'channel 3 period(ms):%5.3f'
	db 0x0A
	db 0x00
__str_3:
	db 'channel 3 voltage(rms):%f'
	db 0x0A
	db 0x00
__str_4:
	db 'phase (degrees): %f'
	db 0x0A
	db 0x00

	CSEG

end
