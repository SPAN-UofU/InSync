`timescale 1 ns/100 ps
// Version: 9.1 SP5 9.1.5.1


module r_fifo(DATA,Q,WE,RE,WCLOCK,RCLOCK,FULL,EMPTY,RESET);
input [7:0] DATA;
output [7:0] Q;
input  WE, RE, WCLOCK, RCLOCK;
output  FULL, EMPTY;
input  RESET;

    wire WEBP, VCC, GND;
    
    VCC VCC_1_net(.Y(VCC));
    GND GND_1_net(.Y(GND));
    FIFO4K18 FIFOBLOCK0(.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(GND)
        , .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(GND), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(GND), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(
        GND), .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), 
        .WD9(GND), .WD8(GND), .WD7(DATA[7]), .WD6(DATA[6]), .WD5(
        DATA[5]), .WD4(DATA[4]), .WD3(DATA[3]), .WD2(DATA[2]), 
        .WD1(DATA[1]), .WD0(DATA[0]), .WW0(VCC), .WW1(VCC), .WW2(
        GND), .RW0(VCC), .RW1(VCC), .RW2(GND), .RPIPE(GND), .WEN(
        WEBP), .REN(RE), .WBLK(GND), .RBLK(GND), .WCLK(WCLOCK), 
        .RCLK(RCLOCK), .RESET(RESET), .ESTOP(VCC), .FSTOP(VCC), 
        .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), .RD12(), 
        .RD11(), .RD10(), .RD9(), .RD8(), .RD7(Q[7]), .RD6(Q[6]), 
        .RD5(Q[5]), .RD4(Q[4]), .RD3(Q[3]), .RD2(Q[2]), .RD1(Q[1])
        , .RD0(Q[0]), .FULL(FULL), .AFULL(), .EMPTY(EMPTY), 
        .AEMPTY());
    INV WEBUBBLEA(.A(WE), .Y(WEBP));
    
endmodule

// _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


// _GEN_File_Contents_

// Version:9.1.5.1
// ACTGENU_CALL:1
// BATCH:T
// FAM:SmartFusion
// OUTFORMAT:Verilog
// LPMTYPE:LPM_FIFO
// LPM_HINT:NONE
// INSERT_PAD:NO
// INSERT_IOREG:NO
// GEN_BHV_VHDL_VAL:F
// GEN_BHV_VERILOG_VAL:F
// MGNTIMER:F
// MGNCMPL:T
// DESDIR:C:/Actelprj/SDRv2_LiberoV9/smartgen\r_fifo
// GEN_BEHV_MODULE:T
// SMARTGEN_DIE:IP6X5M2
// SMARTGEN_PACKAGE:fg484
// AGENIII_IS_SUBPROJECT_LIBERO:T
// WWIDTH:8
// RWIDTH:8
// WDEPTH:512
// RDEPTH:512
// WE_POLARITY:1
// RE_POLARITY:1
// RCLK_EDGE:RISE
// WCLK_EDGE:RISE
// PMODE1:0
// FLAGS:NOFLAGS
// AFVAL:2
// AEVAL:1
// ESTOP:NO
// FSTOP:NO
// DATA_IN_PN:DATA
// DATA_OUT_PN:Q
// WE_PN:WE
// RE_PN:RE
// WCLOCK_PN:WCLOCK
// RCLOCK_PN:RCLOCK
// ACLR_PN:RESET
// FF_PN:FULL
// EF_PN:EMPTY
// AF_PN:AFULL
// AE_PN:AEMPTY
// AF_PORT_PN:AFVAL
// AE_PORT_PN:AEVAL
// RESET_POLARITY:0

// _End_Comments_

