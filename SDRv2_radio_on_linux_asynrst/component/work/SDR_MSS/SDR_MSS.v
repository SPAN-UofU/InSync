//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Jan 29 14:04:32 2015
// Version: v11.4 SP1 11.4.1.17
//////////////////////////////////////////////////////////////////////

`timescale 1 ns/100 ps

// SDR_MSS
module SDR_MSS(
    // Inputs
    CLKC,
    F2M_GPI_16,
    F2M_GPI_17,
    F2M_GPI_19,
    F2M_GPI_23,
    F2M_GPI_24,
    F2M_GPI_25,
    F2M_GPI_26,
    F2M_GPI_27,
    F2M_GPI_30,
    F2M_GPI_31,
    MAC_0_CRSDV,
    MAC_0_RXD,
    MAC_0_RXER,
    MAINXIN,
    MSSHRDATA,
    MSSHREADY,
    MSSHRESP,
    MSS_RESET_N,
    SPI_1_DI,
    UART_0_RXD,
    // Outputs
    FAB_CLK,
    GLB,
    GLC,
    GPIO_10_OUT,
    GPIO_11_OUT,
    GPIO_12_OUT,
    GPIO_13_OUT,
    GPIO_14_OUT,
    GPIO_15_OUT,
    GPIO_8_OUT,
    GPIO_9_OUT,
    M2F_GPO_6,
    M2F_GPO_7,
    M2F_RESET_N,
    MAC_0_MDC,
    MAC_0_TXD,
    MAC_0_TXEN,
    MSSHADDR,
    MSSHLOCK,
    MSSHSIZE,
    MSSHTRANS,
    MSSHWDATA,
    MSSHWRITE,
    SPI_1_DO,
    UART_0_TXD,
    // Inouts
    MAC_0_MDIO,
    SPI_1_CLK,
    SPI_1_SS
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CLKC;
input         F2M_GPI_16;
input         F2M_GPI_17;
input         F2M_GPI_19;
input         F2M_GPI_23;
input         F2M_GPI_24;
input         F2M_GPI_25;
input         F2M_GPI_26;
input         F2M_GPI_27;
input         F2M_GPI_30;
input         F2M_GPI_31;
input         MAC_0_CRSDV;
input  [1:0]  MAC_0_RXD;
input         MAC_0_RXER;
input         MAINXIN;
input  [31:0] MSSHRDATA;
input         MSSHREADY;
input         MSSHRESP;
input         MSS_RESET_N;
input         SPI_1_DI;
input         UART_0_RXD;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        FAB_CLK;
output        GLB;
output        GLC;
output        GPIO_10_OUT;
output        GPIO_11_OUT;
output        GPIO_12_OUT;
output        GPIO_13_OUT;
output        GPIO_14_OUT;
output        GPIO_15_OUT;
output        GPIO_8_OUT;
output        GPIO_9_OUT;
output        M2F_GPO_6;
output        M2F_GPO_7;
output        M2F_RESET_N;
output        MAC_0_MDC;
output [1:0]  MAC_0_TXD;
output        MAC_0_TXEN;
output [19:0] MSSHADDR;
output        MSSHLOCK;
output [1:0]  MSSHSIZE;
output [1:0]  MSSHTRANS;
output [31:0] MSSHWDATA;
output        MSSHWRITE;
output        SPI_1_DO;
output        UART_0_TXD;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout         MAC_0_MDIO;
inout         SPI_1_CLK;
inout         SPI_1_SS;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire           CLKC;
wire   [0:0]   MAC_0_RXD_slice_0;
wire   [1:1]   MAC_0_RXD_slice_1;
wire           DSSGEN_MAC_0_TXD_0;
wire           DSSGEN_MAC_0_TXD_1;
wire           F2M_GPI_16;
wire           F2M_GPI_17;
wire           F2M_GPI_19;
wire           F2M_GPI_23;
wire           F2M_GPI_24;
wire           F2M_GPI_25;
wire           F2M_GPI_26;
wire           F2M_GPI_27;
wire           F2M_GPI_30;
wire           F2M_GPI_31;
wire           GLB_net_0;
wire           GLC_net_0;
wire           GPIO_8_OUT_net_0;
wire           GPIO_9_OUT_net_0;
wire           GPIO_10_OUT_net_0;
wire           GPIO_11_OUT_net_0;
wire           GPIO_12_OUT_net_0;
wire           GPIO_13_OUT_net_0;
wire           GPIO_14_OUT_net_0;
wire           GPIO_15_OUT_net_0;
wire           MAC_0_CRSDV;
wire           MAC_0_MDC_net_0;
wire           MAC_0_MDIO;
wire           MAC_0_RXER;
wire           MAC_0_TXEN_net_0;
wire           MAINXIN;
wire           MSS_ADLIB_INST_EMCCLK;
wire           MSS_ADLIB_INST_FCLK;
wire           MSS_ADLIB_INST_MACCLK;
wire           MSS_ADLIB_INST_MACCLKCCC;
wire           MSS_ADLIB_INST_PLLLOCK;
wire           MSS_ADLIB_INST_SYNCCLKFDBK;
wire   [8:8]   MSS_GPIO_0_GPIO_8_OUT_D;
wire   [9:9]   MSS_GPIO_0_GPIO_9_OUT_D;
wire   [10:10] MSS_GPIO_0_GPIO_10_OUT_D;
wire   [11:11] MSS_GPIO_0_GPIO_11_OUT_D;
wire   [12:12] MSS_GPIO_0_GPIO_12_OUT_D;
wire   [13:13] MSS_GPIO_0_GPIO_13_OUT_D;
wire   [14:14] MSS_GPIO_0_GPIO_14_OUT_D;
wire   [15:15] MSS_GPIO_0_GPIO_15_OUT_D;
wire           MSS_MAC_0_CRSDV_Y;
wire           MSS_MAC_0_MDC_D;
wire           MSS_MAC_0_MDIO_D;
wire           MSS_MAC_0_MDIO_E;
wire           MSS_MAC_0_MDIO_Y;
wire           MSS_MAC_0_RXD_0_Y;
wire           MSS_MAC_0_RXD_1_Y;
wire           MSS_MAC_0_RXER_Y;
wire   [0:0]   MSS_MAC_0_TXD_0_D;
wire   [1:1]   MSS_MAC_0_TXD_1_D;
wire           MSS_MAC_0_TXEN_D;
wire           MSS_RESET_0_MSS_RESET_N_Y;
wire           MSS_RESET_N;
wire           MSS_SPI_1_CLK_D;
wire           MSS_SPI_1_CLK_Y;
wire           MSS_SPI_1_DI_Y;
wire           MSS_SPI_1_DO_D;
wire           MSS_SPI_1_DO_E;
wire   [0:0]   MSS_SPI_1_SS_D;
wire           MSS_SPI_1_SS_E;
wire           MSS_SPI_1_SS_Y;
wire           MSS_UART_0_RXD_Y;
wire           MSS_UART_0_TXD_D;
wire           MSSINT_GPI_16_Y;
wire           MSSINT_GPI_17_Y;
wire           MSSINT_GPI_19_Y;
wire           MSSINT_GPI_23_Y;
wire           MSSINT_GPI_24_Y;
wire           MSSINT_GPI_25_Y;
wire           MSSINT_GPI_26_Y;
wire           MSSINT_GPI_27_Y;
wire           MSSINT_GPI_30_Y;
wire           MSSINT_GPI_31_Y;
wire   [6:6]   MSSINT_GPO_6_A;
wire   [7:7]   MSSINT_GPO_7_A;
wire           net_71;
wire           net_72;
wire           net_73;
wire   [19:0]  net_74_HADDR;
wire           net_74_HLOCK;
wire   [31:0]  MSSHRDATA;
wire           MSSHREADY;
wire           MSSHRESP;
wire   [1:0]   net_74_HSIZE;
wire   [1:0]   net_74_HTRANS;
wire   [31:0]  net_74_HWDATA;
wire           net_74_HWRITE;
wire           SPI_1_CLK;
wire           SPI_1_DI;
wire           SPI_1_DO_net_0;
wire           SPI_1_SS;
wire           UART_0_RXD;
wire           UART_0_TXD_net_0;
wire           net_73_net_0;
wire           net_74_HWRITE_net_0;
wire           net_74_HLOCK_net_0;
wire           net_72_net_0;
wire           GLB_net_1;
wire           MSS_ADLIB_INST_SYNCCLKFDBK_net_0;
wire           GLC_net_1;
wire           net_71_net_0;
wire   [19:0]  net_74_HADDR_net_0;
wire   [1:0]   net_74_HTRANS_net_0;
wire   [1:0]   net_74_HSIZE_net_0;
wire   [31:0]  net_74_HWDATA_net_0;
wire           UART_0_TXD_net_1;
wire           SPI_1_DO_net_1;
wire           GPIO_15_OUT_net_1;
wire           GPIO_14_OUT_net_1;
wire           GPIO_13_OUT_net_1;
wire           GPIO_12_OUT_net_1;
wire           GPIO_11_OUT_net_1;
wire           GPIO_10_OUT_net_1;
wire           GPIO_9_OUT_net_1;
wire           GPIO_8_OUT_net_1;
wire   [0:0]   DSSGEN_MAC_0_TXD_0_net_0;
wire   [1:1]   DSSGEN_MAC_0_TXD_1_net_0;
wire           MAC_0_TXEN_net_1;
wire           MAC_0_MDC_net_1;
wire   [31:0]  GPI_net_0;
wire   [1:0]   MACRXD_net_0;
wire   [1:0]   MAC_0_RXD;
wire   [31:0]  GPO_net_0;
wire   [7:0]   SPI1SSO_net_0;
wire   [1:0]   MACTXD_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           GND_net;
wire           VCC_net;
wire   [1:0]   DMAREADY_const_net_0;
wire   [1:0]   MACF2MRXD_const_net_0;
wire   [15:0]  EMCRDB_const_net_0;
wire   [31:0]  FABHADDR_const_net_0;
wire   [31:0]  FABHWDATA_const_net_0;
wire   [1:0]   FABHTRANS_const_net_0;
wire   [1:0]   FABHSIZE_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net               = 1'b0;
assign VCC_net               = 1'b1;
assign DMAREADY_const_net_0  = 2'h0;
assign MACF2MRXD_const_net_0 = 2'h0;
assign EMCRDB_const_net_0    = 16'h0000;
assign FABHADDR_const_net_0  = 32'h00000000;
assign FABHWDATA_const_net_0 = 32'h00000000;
assign FABHTRANS_const_net_0 = 2'h0;
assign FABHSIZE_const_net_0  = 2'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign net_73_net_0                     = net_73;
assign M2F_RESET_N                      = net_73_net_0;
assign net_74_HWRITE_net_0              = net_74_HWRITE;
assign MSSHWRITE                        = net_74_HWRITE_net_0;
assign net_74_HLOCK_net_0               = net_74_HLOCK;
assign MSSHLOCK                         = net_74_HLOCK_net_0;
assign net_72_net_0                     = net_72;
assign M2F_GPO_7                        = net_72_net_0;
assign GLB_net_1                        = GLB_net_0;
assign GLB                              = GLB_net_1;
assign MSS_ADLIB_INST_SYNCCLKFDBK_net_0 = MSS_ADLIB_INST_SYNCCLKFDBK;
assign FAB_CLK                          = MSS_ADLIB_INST_SYNCCLKFDBK_net_0;
assign GLC_net_1                        = GLC_net_0;
assign GLC                              = GLC_net_1;
assign net_71_net_0                     = net_71;
assign M2F_GPO_6                        = net_71_net_0;
assign net_74_HADDR_net_0               = net_74_HADDR;
assign MSSHADDR[19:0]                   = net_74_HADDR_net_0;
assign net_74_HTRANS_net_0              = net_74_HTRANS;
assign MSSHTRANS[1:0]                   = net_74_HTRANS_net_0;
assign net_74_HSIZE_net_0               = net_74_HSIZE;
assign MSSHSIZE[1:0]                    = net_74_HSIZE_net_0;
assign net_74_HWDATA_net_0              = net_74_HWDATA;
assign MSSHWDATA[31:0]                  = net_74_HWDATA_net_0;
assign UART_0_TXD_net_1                 = UART_0_TXD_net_0;
assign UART_0_TXD                       = UART_0_TXD_net_1;
assign SPI_1_DO_net_1                   = SPI_1_DO_net_0;
assign SPI_1_DO                         = SPI_1_DO_net_1;
assign GPIO_15_OUT_net_1                = GPIO_15_OUT_net_0;
assign GPIO_15_OUT                      = GPIO_15_OUT_net_1;
assign GPIO_14_OUT_net_1                = GPIO_14_OUT_net_0;
assign GPIO_14_OUT                      = GPIO_14_OUT_net_1;
assign GPIO_13_OUT_net_1                = GPIO_13_OUT_net_0;
assign GPIO_13_OUT                      = GPIO_13_OUT_net_1;
assign GPIO_12_OUT_net_1                = GPIO_12_OUT_net_0;
assign GPIO_12_OUT                      = GPIO_12_OUT_net_1;
assign GPIO_11_OUT_net_1                = GPIO_11_OUT_net_0;
assign GPIO_11_OUT                      = GPIO_11_OUT_net_1;
assign GPIO_10_OUT_net_1                = GPIO_10_OUT_net_0;
assign GPIO_10_OUT                      = GPIO_10_OUT_net_1;
assign GPIO_9_OUT_net_1                 = GPIO_9_OUT_net_0;
assign GPIO_9_OUT                       = GPIO_9_OUT_net_1;
assign GPIO_8_OUT_net_1                 = GPIO_8_OUT_net_0;
assign GPIO_8_OUT                       = GPIO_8_OUT_net_1;
assign DSSGEN_MAC_0_TXD_0_net_0[0]      = DSSGEN_MAC_0_TXD_0;
assign MAC_0_TXD[0:0]                   = DSSGEN_MAC_0_TXD_0_net_0[0];
assign DSSGEN_MAC_0_TXD_1_net_0[1]      = DSSGEN_MAC_0_TXD_1;
assign MAC_0_TXD[1:1]                   = DSSGEN_MAC_0_TXD_1_net_0[1];
assign MAC_0_TXEN_net_1                 = MAC_0_TXEN_net_0;
assign MAC_0_TXEN                       = MAC_0_TXEN_net_1;
assign MAC_0_MDC_net_1                  = MAC_0_MDC_net_0;
assign MAC_0_MDC                        = MAC_0_MDC_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign MAC_0_RXD_slice_0[0]         = MAC_0_RXD[0:0];
assign MAC_0_RXD_slice_1[1]         = MAC_0_RXD[1:1];
assign MSS_GPIO_0_GPIO_8_OUT_D[8]   = GPO_net_0[8:8];
assign MSS_GPIO_0_GPIO_9_OUT_D[9]   = GPO_net_0[9:9];
assign MSS_GPIO_0_GPIO_10_OUT_D[10] = GPO_net_0[10:10];
assign MSS_GPIO_0_GPIO_11_OUT_D[11] = GPO_net_0[11:11];
assign MSS_GPIO_0_GPIO_12_OUT_D[12] = GPO_net_0[12:12];
assign MSS_GPIO_0_GPIO_13_OUT_D[13] = GPO_net_0[13:13];
assign MSS_GPIO_0_GPIO_14_OUT_D[14] = GPO_net_0[14:14];
assign MSS_GPIO_0_GPIO_15_OUT_D[15] = GPO_net_0[15:15];
assign MSS_MAC_0_TXD_0_D[0]         = MACTXD_net_0[0:0];
assign MSS_MAC_0_TXD_1_D[1]         = MACTXD_net_0[1:1];
assign MSS_SPI_1_SS_D[0]            = SPI1SSO_net_0[0:0];
assign MSSINT_GPO_6_A[6]            = GPO_net_0[6:6];
assign MSSINT_GPO_7_A[7]            = GPO_net_0[7:7];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign GPI_net_0    = { MSSINT_GPI_31_Y , MSSINT_GPI_30_Y , 2'h0 , MSSINT_GPI_27_Y , MSSINT_GPI_26_Y , MSSINT_GPI_25_Y , MSSINT_GPI_24_Y , MSSINT_GPI_23_Y , 3'h0 , MSSINT_GPI_19_Y , 1'b0 , MSSINT_GPI_17_Y , MSSINT_GPI_16_Y , 16'h0000 };
assign MACRXD_net_0 = { MSS_MAC_0_RXD_1_Y , MSS_MAC_0_RXD_0_Y };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------MSS_AHB
MSS_AHB #( 
        .ACT_CONFIG ( 32768 ),
        .ACT_DIE    ( "IP6X5M2" ),
        .ACT_FCLK   ( 48000000 ),
        .ACT_PKG    ( "fg484" ) )
MSS_ADLIB_INST(
        // Inputs
        .MSSHRDATA      ( MSSHRDATA ),
        .MSSHREADY      ( MSSHREADY ),
        .MSSHRESP       ( MSSHRESP ),
        .FABHADDR       ( FABHADDR_const_net_0 ), // tied to 32'h00000000 from definition
        .FABHWDATA      ( FABHWDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .FABHTRANS      ( FABHTRANS_const_net_0 ), // tied to 2'h0 from definition
        .FABHSIZE       ( FABHSIZE_const_net_0 ), // tied to 2'h0 from definition
        .FABHMASTLOCK   ( GND_net ), // tied to 1'b0 from definition
        .FABHWRITE      ( GND_net ), // tied to 1'b0 from definition
        .FABHSEL        ( GND_net ), // tied to 1'b0 from definition
        .FABHREADY      ( VCC_net ), // tied to 1'b1 from definition
        .SYNCCLKFDBK    ( MSS_ADLIB_INST_SYNCCLKFDBK ),
        .CALIBIN        ( GND_net ), // tied to 1'b0 from definition
        .FABINT         ( GND_net ), // tied to 1'b0 from definition
        .F2MRESETn      ( VCC_net ), // tied to 1'b1 from definition
        .DMAREADY       ( DMAREADY_const_net_0 ), // tied to 2'h0 from definition
        .RXEV           ( GND_net ), // tied to 1'b0 from definition
        .VRON           ( GND_net ), // tied to 1'b0 from definition
        .GPI            ( GPI_net_0 ),
        .UART0CTSn      ( GND_net ), // tied to 1'b0 from definition
        .UART0DSRn      ( GND_net ), // tied to 1'b0 from definition
        .UART0RIn       ( GND_net ), // tied to 1'b0 from definition
        .UART0DCDn      ( GND_net ), // tied to 1'b0 from definition
        .UART1CTSn      ( GND_net ), // tied to 1'b0 from definition
        .UART1DSRn      ( GND_net ), // tied to 1'b0 from definition
        .UART1RIn       ( GND_net ), // tied to 1'b0 from definition
        .UART1DCDn      ( GND_net ), // tied to 1'b0 from definition
        .I2C0SMBUSNI    ( GND_net ), // tied to 1'b0 from definition
        .I2C0SMBALERTNI ( GND_net ), // tied to 1'b0 from definition
        .I2C0BCLK       ( GND_net ), // tied to 1'b0 from definition
        .I2C1SMBUSNI    ( GND_net ), // tied to 1'b0 from definition
        .I2C1SMBALERTNI ( GND_net ), // tied to 1'b0 from definition
        .I2C1BCLK       ( GND_net ), // tied to 1'b0 from definition
        .MACF2MRXD      ( MACF2MRXD_const_net_0 ), // tied to 2'h0 from definition
        .MACF2MCRSDV    ( GND_net ), // tied to 1'b0 from definition
        .MACF2MRXER     ( GND_net ), // tied to 1'b0 from definition
        .MACF2MMDI      ( GND_net ), // tied to 1'b0 from definition
        .FABSDD0D       ( GND_net ), // tied to 1'b0 from definition
        .FABSDD1D       ( GND_net ), // tied to 1'b0 from definition
        .FABSDD2D       ( GND_net ), // tied to 1'b0 from definition
        .FABSDD0CLK     ( GND_net ), // tied to 1'b0 from definition
        .FABSDD1CLK     ( GND_net ), // tied to 1'b0 from definition
        .FABSDD2CLK     ( GND_net ), // tied to 1'b0 from definition
        .FABACETRIG     ( GND_net ), // tied to 1'b0 from definition
        .LVTTL0EN       ( GND_net ), // tied to 1'b0 from definition
        .LVTTL1EN       ( GND_net ), // tied to 1'b0 from definition
        .LVTTL2EN       ( GND_net ), // tied to 1'b0 from definition
        .LVTTL3EN       ( GND_net ), // tied to 1'b0 from definition
        .LVTTL4EN       ( GND_net ), // tied to 1'b0 from definition
        .LVTTL5EN       ( GND_net ), // tied to 1'b0 from definition
        .LVTTL6EN       ( GND_net ), // tied to 1'b0 from definition
        .LVTTL7EN       ( GND_net ), // tied to 1'b0 from definition
        .LVTTL8EN       ( GND_net ), // tied to 1'b0 from definition
        .LVTTL9EN       ( GND_net ), // tied to 1'b0 from definition
        .LVTTL10EN      ( GND_net ), // tied to 1'b0 from definition
        .LVTTL11EN      ( GND_net ), // tied to 1'b0 from definition
        .FCLK           ( MSS_ADLIB_INST_FCLK ),
        .MACCLKCCC      ( MSS_ADLIB_INST_MACCLKCCC ),
        .RCOSC          ( GND_net ), // tied to 1'b0 from definition
        .MACCLK         ( MSS_ADLIB_INST_MACCLK ),
        .PLLLOCK        ( MSS_ADLIB_INST_PLLLOCK ),
        .MSSRESETn      ( MSS_RESET_0_MSS_RESET_N_Y ),
        .SPI0DI         ( GND_net ), // tied to 1'b0 from definition
        .SPI0CLKI       ( GND_net ), // tied to 1'b0 from definition
        .SPI0SSI        ( GND_net ), // tied to 1'b0 from definition
        .UART0RXD       ( MSS_UART_0_RXD_Y ),
        .I2C0SDAI       ( GND_net ), // tied to 1'b0 from definition
        .I2C0SCLI       ( GND_net ), // tied to 1'b0 from definition
        .SPI1DI         ( MSS_SPI_1_DI_Y ),
        .SPI1CLKI       ( MSS_SPI_1_CLK_Y ),
        .SPI1SSI        ( MSS_SPI_1_SS_Y ),
        .UART1RXD       ( GND_net ), // tied to 1'b0 from definition
        .I2C1SDAI       ( GND_net ), // tied to 1'b0 from definition
        .I2C1SCLI       ( GND_net ), // tied to 1'b0 from definition
        .MACRXD         ( MACRXD_net_0 ),
        .MACCRSDV       ( MSS_MAC_0_CRSDV_Y ),
        .MACRXER        ( MSS_MAC_0_RXER_Y ),
        .MACMDI         ( MSS_MAC_0_MDIO_Y ),
        .EMCCLKRTN      ( MSS_ADLIB_INST_EMCCLK ),
        .EMCRDB         ( EMCRDB_const_net_0 ), // tied to 16'h0000 from definition
        .ADC0           ( GND_net ), // tied to 1'b0 from definition
        .ADC1           ( GND_net ), // tied to 1'b0 from definition
        .ADC2           ( GND_net ), // tied to 1'b0 from definition
        .ADC3           ( GND_net ), // tied to 1'b0 from definition
        .ADC4           ( GND_net ), // tied to 1'b0 from definition
        .ADC5           ( GND_net ), // tied to 1'b0 from definition
        .ADC6           ( GND_net ), // tied to 1'b0 from definition
        .ADC7           ( GND_net ), // tied to 1'b0 from definition
        .ADC8           ( GND_net ), // tied to 1'b0 from definition
        .ADC9           ( GND_net ), // tied to 1'b0 from definition
        .ADC10          ( GND_net ), // tied to 1'b0 from definition
        .ADC11          ( GND_net ), // tied to 1'b0 from definition
        .ABPS0          ( GND_net ), // tied to 1'b0 from definition
        .ABPS1          ( GND_net ), // tied to 1'b0 from definition
        .ABPS2          ( GND_net ), // tied to 1'b0 from definition
        .ABPS3          ( GND_net ), // tied to 1'b0 from definition
        .ABPS4          ( GND_net ), // tied to 1'b0 from definition
        .ABPS5          ( GND_net ), // tied to 1'b0 from definition
        .ABPS6          ( GND_net ), // tied to 1'b0 from definition
        .ABPS7          ( GND_net ), // tied to 1'b0 from definition
        .ABPS8          ( GND_net ), // tied to 1'b0 from definition
        .ABPS9          ( GND_net ), // tied to 1'b0 from definition
        .ABPS10         ( GND_net ), // tied to 1'b0 from definition
        .ABPS11         ( GND_net ), // tied to 1'b0 from definition
        .TM0            ( GND_net ), // tied to 1'b0 from definition
        .TM1            ( GND_net ), // tied to 1'b0 from definition
        .TM2            ( GND_net ), // tied to 1'b0 from definition
        .TM3            ( GND_net ), // tied to 1'b0 from definition
        .TM4            ( GND_net ), // tied to 1'b0 from definition
        .TM5            ( GND_net ), // tied to 1'b0 from definition
        .CM0            ( GND_net ), // tied to 1'b0 from definition
        .CM1            ( GND_net ), // tied to 1'b0 from definition
        .CM2            ( GND_net ), // tied to 1'b0 from definition
        .CM3            ( GND_net ), // tied to 1'b0 from definition
        .CM4            ( GND_net ), // tied to 1'b0 from definition
        .CM5            ( GND_net ), // tied to 1'b0 from definition
        .GNDTM0         ( GND_net ), // tied to 1'b0 from definition
        .GNDTM1         ( GND_net ), // tied to 1'b0 from definition
        .GNDTM2         ( GND_net ), // tied to 1'b0 from definition
        .VAREF0         ( GND_net ), // tied to 1'b0 from definition
        .VAREF1         ( GND_net ), // tied to 1'b0 from definition
        .VAREF2         ( GND_net ), // tied to 1'b0 from definition
        .GNDVAREF       ( GND_net ), // tied to 1'b0 from definition
        .PUn            ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .MSSHADDR       ( net_74_HADDR ),
        .MSSHWDATA      ( net_74_HWDATA ),
        .MSSHTRANS      ( net_74_HTRANS ),
        .MSSHSIZE       ( net_74_HSIZE ),
        .MSSHLOCK       ( net_74_HLOCK ),
        .MSSHWRITE      ( net_74_HWRITE ),
        .FABHRDATA      (  ),
        .FABHREADYOUT   (  ),
        .FABHRESP       (  ),
        .CALIBOUT       (  ),
        .MSSINT         (  ),
        .WDINT          (  ),
        .M2FRESETn      ( net_73 ),
        .DEEPSLEEP      (  ),
        .SLEEP          (  ),
        .TXEV           (  ),
        .GPO            ( GPO_net_0 ),
        .UART0RTSn      (  ),
        .UART0DTRn      (  ),
        .UART1RTSn      (  ),
        .UART1DTRn      (  ),
        .I2C0SMBUSNO    (  ),
        .I2C0SMBALERTNO (  ),
        .I2C1SMBUSNO    (  ),
        .I2C1SMBALERTNO (  ),
        .MACM2FTXD      (  ),
        .MACM2FTXEN     (  ),
        .MACM2FMDO      (  ),
        .MACM2FMDEN     (  ),
        .MACM2FMDC      (  ),
        .ACEFLAGS       (  ),
        .CMP0           (  ),
        .CMP1           (  ),
        .CMP2           (  ),
        .CMP3           (  ),
        .CMP4           (  ),
        .CMP5           (  ),
        .CMP6           (  ),
        .CMP7           (  ),
        .CMP8           (  ),
        .CMP9           (  ),
        .CMP10          (  ),
        .CMP11          (  ),
        .LVTTL0         (  ),
        .LVTTL1         (  ),
        .LVTTL2         (  ),
        .LVTTL3         (  ),
        .LVTTL4         (  ),
        .LVTTL5         (  ),
        .LVTTL6         (  ),
        .LVTTL7         (  ),
        .LVTTL8         (  ),
        .LVTTL9         (  ),
        .LVTTL10        (  ),
        .LVTTL11        (  ),
        .PUFABn         (  ),
        .VCC15GOOD      (  ),
        .VCC33GOOD      (  ),
        .GPOE           (  ),
        .SPI0DO         (  ),
        .SPI0DOE        (  ),
        .SPI0CLKO       (  ),
        .SPI0MODE       (  ),
        .SPI0SSO        (  ),
        .UART0TXD       ( MSS_UART_0_TXD_D ),
        .I2C0SDAO       (  ),
        .I2C0SCLO       (  ),
        .SPI1DO         ( MSS_SPI_1_DO_D ),
        .SPI1DOE        ( MSS_SPI_1_DO_E ),
        .SPI1CLKO       ( MSS_SPI_1_CLK_D ),
        .SPI1MODE       ( MSS_SPI_1_SS_E ),
        .SPI1SSO        ( SPI1SSO_net_0 ),
        .UART1TXD       (  ),
        .I2C1SDAO       (  ),
        .I2C1SCLO       (  ),
        .MACTXD         ( MACTXD_net_0 ),
        .MACTXEN        ( MSS_MAC_0_TXEN_D ),
        .MACMDO         ( MSS_MAC_0_MDIO_D ),
        .MACMDEN        ( MSS_MAC_0_MDIO_E ),
        .MACMDC         ( MSS_MAC_0_MDC_D ),
        .EMCCLK         ( MSS_ADLIB_INST_EMCCLK ),
        .EMCAB          (  ),
        .EMCWDB         (  ),
        .EMCRWn         (  ),
        .EMCCS0n        (  ),
        .EMCCS1n        (  ),
        .EMCOEN0n       (  ),
        .EMCOEN1n       (  ),
        .EMCBYTEN       (  ),
        .EMCDBOE        (  ),
        .SDD0           (  ),
        .SDD1           (  ),
        .SDD2           (  ),
        .VAREFOUT       (  ) 
        );

//--------SDR_MSS_tmp_MSS_CCC_0_MSS_CCC   -   Actel:SmartFusionMSS:MSS_CCC:2.0.106
SDR_MSS_tmp_MSS_CCC_0_MSS_CCC MSS_CCC_0(
        // Inputs
        .CLKA           ( GND_net ), // tied to 1'b0 from definition
        .CLKA_PAD       ( GND_net ), // tied to 1'b0 from definition
        .CLKA_PADP      ( GND_net ), // tied to 1'b0 from definition
        .CLKA_PADN      ( GND_net ), // tied to 1'b0 from definition
        .CLKB           ( GND_net ), // tied to 1'b0 from definition
        .CLKB_PAD       ( GND_net ), // tied to 1'b0 from definition
        .CLKB_PADP      ( GND_net ), // tied to 1'b0 from definition
        .CLKB_PADN      ( GND_net ), // tied to 1'b0 from definition
        .CLKC           ( CLKC ),
        .CLKC_PAD       ( GND_net ), // tied to 1'b0 from definition
        .CLKC_PADP      ( GND_net ), // tied to 1'b0 from definition
        .CLKC_PADN      ( GND_net ), // tied to 1'b0 from definition
        .MAINXIN        ( MAINXIN ),
        .LPXIN          ( GND_net ), // tied to 1'b0 from definition
        .MAC_CLK        ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .GLA            (  ),
        .GLB            ( GLB_net_0 ),
        .GLC            ( GLC_net_0 ),
        .FAB_CLK        ( MSS_ADLIB_INST_SYNCCLKFDBK ),
        .YB             (  ),
        .YC             (  ),
        .FAB_LOCK       (  ),
        .RCOSC_CLKOUT   (  ),
        .MAINXIN_CLKOUT (  ),
        .LPXIN_CLKOUT   (  ),
        .GLA0           ( MSS_ADLIB_INST_FCLK ),
        .MSS_LOCK       ( MSS_ADLIB_INST_PLLLOCK ),
        .MAC_CLK_CCC    ( MSS_ADLIB_INST_MACCLKCCC ),
        .MAC_CLK_IO     ( MSS_ADLIB_INST_MACCLK ) 
        );

//--------OUTBUF_MSS
OUTBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "T3" ) )
MSS_GPIO_0_GPIO_8_OUT(
        // Inputs
        .D   ( MSS_GPIO_0_GPIO_8_OUT_D ),
        // Outputs
        .PAD ( GPIO_8_OUT_net_0 ) 
        );

//--------OUTBUF_MSS
OUTBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "V3" ) )
MSS_GPIO_0_GPIO_9_OUT(
        // Inputs
        .D   ( MSS_GPIO_0_GPIO_9_OUT_D ),
        // Outputs
        .PAD ( GPIO_9_OUT_net_0 ) 
        );

//--------OUTBUF_MSS
OUTBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "U3" ) )
MSS_GPIO_0_GPIO_10_OUT(
        // Inputs
        .D   ( MSS_GPIO_0_GPIO_10_OUT_D ),
        // Outputs
        .PAD ( GPIO_10_OUT_net_0 ) 
        );

//--------OUTBUF_MSS
OUTBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "T4" ) )
MSS_GPIO_0_GPIO_11_OUT(
        // Inputs
        .D   ( MSS_GPIO_0_GPIO_11_OUT_D ),
        // Outputs
        .PAD ( GPIO_11_OUT_net_0 ) 
        );

//--------OUTBUF_MSS
OUTBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "AA2" ) )
MSS_GPIO_0_GPIO_12_OUT(
        // Inputs
        .D   ( MSS_GPIO_0_GPIO_12_OUT_D ),
        // Outputs
        .PAD ( GPIO_12_OUT_net_0 ) 
        );

//--------OUTBUF_MSS
OUTBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "AB2" ) )
MSS_GPIO_0_GPIO_13_OUT(
        // Inputs
        .D   ( MSS_GPIO_0_GPIO_13_OUT_D ),
        // Outputs
        .PAD ( GPIO_13_OUT_net_0 ) 
        );

//--------OUTBUF_MSS
OUTBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "AB3" ) )
MSS_GPIO_0_GPIO_14_OUT(
        // Inputs
        .D   ( MSS_GPIO_0_GPIO_14_OUT_D ),
        // Outputs
        .PAD ( GPIO_14_OUT_net_0 ) 
        );

//--------OUTBUF_MSS
OUTBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "Y3" ) )
MSS_GPIO_0_GPIO_15_OUT(
        // Inputs
        .D   ( MSS_GPIO_0_GPIO_15_OUT_D ),
        // Outputs
        .PAD ( GPIO_15_OUT_net_0 ) 
        );

//--------INBUF_MSS
INBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "W4" ) )
MSS_MAC_0_CRSDV(
        // Inputs
        .PAD ( MAC_0_CRSDV ),
        // Outputs
        .Y   ( MSS_MAC_0_CRSDV_Y ) 
        );

//--------OUTBUF_MSS
OUTBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "AA3" ) )
MSS_MAC_0_MDC(
        // Inputs
        .D   ( MSS_MAC_0_MDC_D ),
        // Outputs
        .PAD ( MAC_0_MDC_net_0 ) 
        );

//--------BIBUF_MSS
BIBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "V4" ) )
MSS_MAC_0_MDIO(
        // Inputs
        .D   ( MSS_MAC_0_MDIO_D ),
        .E   ( MSS_MAC_0_MDIO_E ),
        // Outputs
        .Y   ( MSS_MAC_0_MDIO_Y ),
        // Inouts
        .PAD ( MAC_0_MDIO ) 
        );

//--------INBUF_MSS
INBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "V5" ) )
MSS_MAC_0_RXD_0(
        // Inputs
        .PAD ( MAC_0_RXD_slice_0 ),
        // Outputs
        .Y   ( MSS_MAC_0_RXD_0_Y ) 
        );

//--------INBUF_MSS
INBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "U5" ) )
MSS_MAC_0_RXD_1(
        // Inputs
        .PAD ( MAC_0_RXD_slice_1 ),
        // Outputs
        .Y   ( MSS_MAC_0_RXD_1_Y ) 
        );

//--------INBUF_MSS
INBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "AA4" ) )
MSS_MAC_0_RXER(
        // Inputs
        .PAD ( MAC_0_RXER ),
        // Outputs
        .Y   ( MSS_MAC_0_RXER_Y ) 
        );

//--------OUTBUF_MSS
OUTBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "AA5" ) )
MSS_MAC_0_TXD_0(
        // Inputs
        .D   ( MSS_MAC_0_TXD_0_D ),
        // Outputs
        .PAD ( DSSGEN_MAC_0_TXD_0 ) 
        );

//--------OUTBUF_MSS
OUTBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "W5" ) )
MSS_MAC_0_TXD_1(
        // Inputs
        .D   ( MSS_MAC_0_TXD_1_D ),
        // Outputs
        .PAD ( DSSGEN_MAC_0_TXD_1 ) 
        );

//--------OUTBUF_MSS
OUTBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "Y4" ) )
MSS_MAC_0_TXEN(
        // Inputs
        .D   ( MSS_MAC_0_TXEN_D ),
        // Outputs
        .PAD ( MAC_0_TXEN_net_0 ) 
        );

//--------INBUF_MSS
INBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "R1" ) )
MSS_RESET_0_MSS_RESET_N(
        // Inputs
        .PAD ( MSS_RESET_N ),
        // Outputs
        .Y   ( MSS_RESET_0_MSS_RESET_N_Y ) 
        );

//--------BIBUF_MSS
BIBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "AA22" ) )
MSS_SPI_1_CLK(
        // Inputs
        .D   ( MSS_SPI_1_CLK_D ),
        .E   ( MSS_SPI_1_SS_E ),
        // Outputs
        .Y   ( MSS_SPI_1_CLK_Y ),
        // Inouts
        .PAD ( SPI_1_CLK ) 
        );

//--------INBUF_MSS
INBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "V19" ) )
MSS_SPI_1_DI(
        // Inputs
        .PAD ( SPI_1_DI ),
        // Outputs
        .Y   ( MSS_SPI_1_DI_Y ) 
        );

//--------TRIBUFF_MSS
TRIBUFF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "T17" ) )
MSS_SPI_1_DO(
        // Inputs
        .D   ( MSS_SPI_1_DO_D ),
        .E   ( MSS_SPI_1_DO_E ),
        // Outputs
        .PAD ( SPI_1_DO_net_0 ) 
        );

//--------BIBUF_MSS
BIBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "W21" ) )
MSS_SPI_1_SS(
        // Inputs
        .D   ( MSS_SPI_1_SS_D ),
        .E   ( MSS_SPI_1_SS_E ),
        // Outputs
        .Y   ( MSS_SPI_1_SS_Y ),
        // Inouts
        .PAD ( SPI_1_SS ) 
        );

//--------INBUF_MSS
INBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "U18" ) )
MSS_UART_0_RXD(
        // Inputs
        .PAD ( UART_0_RXD ),
        // Outputs
        .Y   ( MSS_UART_0_RXD_Y ) 
        );

//--------OUTBUF_MSS
OUTBUF_MSS #( 
        .ACT_CONFIG ( 0 ),
        .ACT_PIN    ( "Y22" ) )
MSS_UART_0_TXD(
        // Inputs
        .D   ( MSS_UART_0_TXD_D ),
        // Outputs
        .PAD ( UART_0_TXD_net_0 ) 
        );

//--------MSSINT
MSSINT MSSINT_GPI_16(
        // Inputs
        .A ( F2M_GPI_16 ),
        // Outputs
        .Y ( MSSINT_GPI_16_Y ) 
        );

//--------MSSINT
MSSINT MSSINT_GPI_17(
        // Inputs
        .A ( F2M_GPI_17 ),
        // Outputs
        .Y ( MSSINT_GPI_17_Y ) 
        );

//--------MSSINT
MSSINT MSSINT_GPI_19(
        // Inputs
        .A ( F2M_GPI_19 ),
        // Outputs
        .Y ( MSSINT_GPI_19_Y ) 
        );

//--------MSSINT
MSSINT MSSINT_GPI_23(
        // Inputs
        .A ( F2M_GPI_23 ),
        // Outputs
        .Y ( MSSINT_GPI_23_Y ) 
        );

//--------MSSINT
MSSINT MSSINT_GPI_24(
        // Inputs
        .A ( F2M_GPI_24 ),
        // Outputs
        .Y ( MSSINT_GPI_24_Y ) 
        );

//--------MSSINT
MSSINT MSSINT_GPI_25(
        // Inputs
        .A ( F2M_GPI_25 ),
        // Outputs
        .Y ( MSSINT_GPI_25_Y ) 
        );

//--------MSSINT
MSSINT MSSINT_GPI_26(
        // Inputs
        .A ( F2M_GPI_26 ),
        // Outputs
        .Y ( MSSINT_GPI_26_Y ) 
        );

//--------MSSINT
MSSINT MSSINT_GPI_27(
        // Inputs
        .A ( F2M_GPI_27 ),
        // Outputs
        .Y ( MSSINT_GPI_27_Y ) 
        );

//--------MSSINT
MSSINT MSSINT_GPI_30(
        // Inputs
        .A ( F2M_GPI_30 ),
        // Outputs
        .Y ( MSSINT_GPI_30_Y ) 
        );

//--------MSSINT
MSSINT MSSINT_GPI_31(
        // Inputs
        .A ( F2M_GPI_31 ),
        // Outputs
        .Y ( MSSINT_GPI_31_Y ) 
        );

//--------MSSINT
MSSINT MSSINT_GPO_6(
        // Inputs
        .A ( MSSINT_GPO_6_A ),
        // Outputs
        .Y ( net_71 ) 
        );

//--------MSSINT
MSSINT MSSINT_GPO_7(
        // Inputs
        .A ( MSSINT_GPO_7_A ),
        // Outputs
        .Y ( net_72 ) 
        );


endmodule
