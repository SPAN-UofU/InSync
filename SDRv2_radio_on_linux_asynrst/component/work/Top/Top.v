//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Jan 29 14:05:10 2015
// Version: v11.4 SP1 11.4.1.17
//////////////////////////////////////////////////////////////////////

`timescale 1 ns/100 ps

// Top
module Top(
    // Inputs
    CLKC,
    MAC_0_CRSDV,
    MAC_0_RXD,
    MAC_0_RXER,
    MAINXIN,
    MSS_RESET_N,
    RSSI_DIN,
    SPI_1_DI,
    SW1,
    SW2,
    SW3,
    SW4,
    UART_0_RXD,
    in_phase,
    quad_phase,
    // Outputs
    ADC_CLK,
    ADC_S1,
    DAC_CLK,
    DAC_DACEN,
    DAC_DOUT,
    DAC_PD,
    GPIO_10_OUT,
    GPIO_11_OUT,
    GPIO_12_OUT,
    GPIO_13_OUT,
    GPIO_14_OUT,
    GPIO_15_OUT,
    GPIO_8_OUT,
    GPIO_9_OUT,
    LED,
    MAC_0_MDC,
    MAC_0_TXD,
    MAC_0_TXEN,
    RF_CLK,
    RF_CS,
    RF_DOUT,
    RF_GAIN,
    RF_RXTX,
    RF_SHDN,
    RSSI_CLK,
    RSSI_CS,
    SPI_1_DO,
    TEST_PTS,
    UART_0_TXD,
    sfd_int,
    tx_complete,
    // Inouts
    MAC_0_MDIO,
    SPI_1_CLK,
    SPI_1_SS
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CLKC;
input         MAC_0_CRSDV;
input  [1:0]  MAC_0_RXD;
input         MAC_0_RXER;
input         MAINXIN;
input         MSS_RESET_N;
input         RSSI_DIN;
input         SPI_1_DI;
input         SW1;
input         SW2;
input         SW3;
input         SW4;
input         UART_0_RXD;
input  [7:0]  in_phase;
input  [7:0]  quad_phase;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ADC_CLK;
output        ADC_S1;
output        DAC_CLK;
output        DAC_DACEN;
output [7:0]  DAC_DOUT;
output        DAC_PD;
output        GPIO_10_OUT;
output        GPIO_11_OUT;
output        GPIO_12_OUT;
output        GPIO_13_OUT;
output        GPIO_14_OUT;
output        GPIO_15_OUT;
output        GPIO_8_OUT;
output        GPIO_9_OUT;
output [7:0]  LED;
output        MAC_0_MDC;
output [1:0]  MAC_0_TXD;
output        MAC_0_TXEN;
output        RF_CLK;
output        RF_CS;
output        RF_DOUT;
output [6:0]  RF_GAIN;
output        RF_RXTX;
output        RF_SHDN;
output        RSSI_CLK;
output        RSSI_CS;
output        SPI_1_DO;
output [15:0] TEST_PTS;
output        UART_0_TXD;
output        sfd_int;
output        tx_complete;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout         MAC_0_MDIO;
inout         SPI_1_CLK;
inout         SPI_1_SS;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          ADC_S1_net_0;
wire          CLKC;
wire   [31:0] CoreAHBLite_0_AHBmslave5_HADDR;
wire   [2:0]  CoreAHBLite_0_AHBmslave5_HBURST;
wire          CoreAHBLite_0_AHBmslave5_HMASTLOCK;
wire   [3:0]  CoreAHBLite_0_AHBmslave5_HPROT;
wire   [31:0] CoreAHBLite_0_AHBmslave5_HRDATA;
wire          CoreAHBLite_0_AHBmslave5_HREADY;
wire          CoreAHBLite_0_AHBmslave5_HREADYOUT;
wire   [1:0]  CoreAHBLite_0_AHBmslave5_HRESP;
wire          CoreAHBLite_0_AHBmslave5_HSELx;
wire   [2:0]  CoreAHBLite_0_AHBmslave5_HSIZE;
wire   [1:0]  CoreAHBLite_0_AHBmslave5_HTRANS;
wire   [31:0] CoreAHBLite_0_AHBmslave5_HWDATA;
wire          CoreAHBLite_0_AHBmslave5_HWRITE;
wire   [31:0] CoreAHBLite_0_AHBmslave6_HADDR;
wire   [2:0]  CoreAHBLite_0_AHBmslave6_HBURST;
wire          CoreAHBLite_0_AHBmslave6_HMASTLOCK;
wire   [3:0]  CoreAHBLite_0_AHBmslave6_HPROT;
wire   [31:0] CoreAHBLite_0_AHBmslave6_HRDATA;
wire          CoreAHBLite_0_AHBmslave6_HREADY;
wire          CoreAHBLite_0_AHBmslave6_HREADYOUT;
wire   [1:0]  CoreAHBLite_0_AHBmslave6_HRESP;
wire          CoreAHBLite_0_AHBmslave6_HSELx;
wire   [2:0]  CoreAHBLite_0_AHBmslave6_HSIZE;
wire   [1:0]  CoreAHBLite_0_AHBmslave6_HTRANS;
wire   [31:0] CoreAHBLite_0_AHBmslave6_HWDATA;
wire          CoreAHBLite_0_AHBmslave6_HWRITE;
wire   [31:0] CoreAHBLite_0_AHBmslave7_HADDR;
wire   [2:0]  CoreAHBLite_0_AHBmslave7_HBURST;
wire          CoreAHBLite_0_AHBmslave7_HMASTLOCK;
wire   [3:0]  CoreAHBLite_0_AHBmslave7_HPROT;
wire   [31:0] CoreAHBLite_0_AHBmslave7_HRDATA;
wire          CoreAHBLite_0_AHBmslave7_HREADY;
wire          CoreAHBLite_0_AHBmslave7_HREADYOUT;
wire   [1:0]  CoreAHBLite_0_AHBmslave7_HRESP;
wire          CoreAHBLite_0_AHBmslave7_HSELx;
wire   [2:0]  CoreAHBLite_0_AHBmslave7_HSIZE;
wire   [1:0]  CoreAHBLite_0_AHBmslave7_HTRANS;
wire   [31:0] CoreAHBLite_0_AHBmslave7_HWDATA;
wire          CoreAHBLite_0_AHBmslave7_HWRITE;
wire   [31:0] CoreAHBLite_0_AHBmslave8_HADDR;
wire   [2:0]  CoreAHBLite_0_AHBmslave8_HBURST;
wire          CoreAHBLite_0_AHBmslave8_HMASTLOCK;
wire   [3:0]  CoreAHBLite_0_AHBmslave8_HPROT;
wire   [31:0] CoreAHBLite_0_AHBmslave8_HRDATA;
wire          CoreAHBLite_0_AHBmslave8_HREADY;
wire          CoreAHBLite_0_AHBmslave8_HREADYOUT;
wire   [1:0]  CoreAHBLite_0_AHBmslave8_HRESP;
wire          CoreAHBLite_0_AHBmslave8_HSELx;
wire   [2:0]  CoreAHBLite_0_AHBmslave8_HSIZE;
wire   [1:0]  CoreAHBLite_0_AHBmslave8_HTRANS;
wire   [31:0] CoreAHBLite_0_AHBmslave8_HWDATA;
wire          CoreAHBLite_0_AHBmslave8_HWRITE;
wire          DAC_CLK_net_0;
wire          DAC_DACEN_net_0;
wire   [7:0]  DAC_DOUT_net_0;
wire          DAC_PD_net_0;
wire          SW1;
wire          SW2;
wire          SW3;
wire          SW4;
wire          GLB;
wire          GPIO_8_OUT_net_0;
wire          GPIO_9_OUT_net_0;
wire          GPIO_10_OUT_net_0;
wire          GPIO_11_OUT_net_0;
wire          GPIO_12_OUT_net_0;
wire          GPIO_13_OUT_net_0;
wire          GPIO_14_OUT_net_0;
wire          GPIO_15_OUT_net_0;
wire   [7:0]  in_phase;
wire   [7:0]  LED_net_0;
wire          MAC_0_CRSDV;
wire          MAC_0_MDC_net_0;
wire          MAC_0_MDIO;
wire   [1:0]  MAC_0_RXD;
wire          MAC_0_RXER;
wire   [1:0]  MAC_0_TXD_net_0;
wire          MAC_0_TXEN_net_0;
wire          MAINXIN;
wire          MSS_RESET_N;
wire   [7:0]  quad_phase;
wire          RF_CLK_net_0;
wire          RF_CS_net_0;
wire          RF_DOUT_net_0;
wire   [6:0]  RF_GAIN_net_0;
wire          RF_RXTX_net_0;
wire          RF_SHDN_net_0;
wire          RSSI_CLK_net_0;
wire          RSSI_CS_net_0;
wire          RSSI_DIN;
wire          SDR_MSS_0_FAB_CLK;
wire          SDR_MSS_0_M2F_GPO_6;
wire          SDR_MSS_0_M2F_GPO_7;
wire          SDR_MSS_0_M2F_RESET_N;
wire          SDR_MSS_0_MSS_MASTER_AHB_LITE_HLOCK;
wire   [31:0] SDR_MSS_0_MSS_MASTER_AHB_LITE_HRDATA;
wire          SDR_MSS_0_MSS_MASTER_AHB_LITE_HREADY;
wire   [1:0]  SDR_MSS_0_MSS_MASTER_AHB_LITE_HTRANS;
wire   [31:0] SDR_MSS_0_MSS_MASTER_AHB_LITE_HWDATA;
wire          SDR_MSS_0_MSS_MASTER_AHB_LITE_HWRITE;
wire          sdrv2_top_0_length_int;
wire          sdrv2_top_0_packet_done;
wire          sdrv2_top_0_ready_to_transmit;
wire          sfd_int_net_0;
wire          SPI_1_CLK;
wire          SPI_1_DI;
wire          SPI_1_DO_net_0;
wire          SPI_1_SS;
wire   [15:0] TEST_PTS_net_0;
wire          tx_complete_net_0;
wire          UART_0_RXD;
wire          UART_0_TXD_net_0;
wire          UART_0_TXD_net_1;
wire          SPI_1_DO_net_1;
wire          GPIO_8_OUT_net_1;
wire          GLB_net_0;
wire          RF_DOUT_net_1;
wire          RF_CLK_net_1;
wire          RF_CS_net_1;
wire          RF_SHDN_net_1;
wire          RF_RXTX_net_1;
wire          ADC_S1_net_1;
wire          DAC_PD_net_1;
wire          DAC_DACEN_net_1;
wire          RSSI_CLK_net_1;
wire          RSSI_CS_net_1;
wire          DAC_CLK_net_1;
wire          MAC_0_TXEN_net_1;
wire          MAC_0_MDC_net_1;
wire          GPIO_15_OUT_net_1;
wire          GPIO_14_OUT_net_1;
wire          GPIO_13_OUT_net_1;
wire          GPIO_12_OUT_net_1;
wire          GPIO_11_OUT_net_1;
wire          GPIO_10_OUT_net_1;
wire          GPIO_9_OUT_net_1;
wire          sfd_int_net_1;
wire          tx_complete_net_1;
wire   [7:0]  LED_net_1;
wire   [7:0]  DAC_DOUT_net_1;
wire   [15:0] TEST_PTS_net_1;
wire   [6:0]  RF_GAIN_net_1;
wire   [1:0]  MAC_0_TXD_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [31:0] HADDR_M0_const_net_0;
wire   [1:0]  HTRANS_M0_const_net_0;
wire   [2:0]  HSIZE_M0_const_net_0;
wire   [2:0]  HBURST_M0_const_net_0;
wire   [3:0]  HPROT_M0_const_net_0;
wire   [31:0] HWDATA_M0_const_net_0;
wire   [2:0]  HBURST_M1_const_net_0;
wire   [3:0]  HPROT_M1_const_net_0;
wire   [31:0] HRDATA_S0_const_net_0;
wire          VCC_net;
wire   [1:0]  HRESP_S0_const_net_0;
wire   [31:0] HRDATA_S1_const_net_0;
wire   [1:0]  HRESP_S1_const_net_0;
wire   [31:0] HRDATA_S2_const_net_0;
wire   [1:0]  HRESP_S2_const_net_0;
wire   [31:0] HRDATA_S3_const_net_0;
wire   [1:0]  HRESP_S3_const_net_0;
wire   [31:0] HRDATA_S4_const_net_0;
wire   [1:0]  HRESP_S4_const_net_0;
wire   [31:0] HRDATA_S9_const_net_0;
wire   [1:0]  HRESP_S9_const_net_0;
wire   [31:0] HRDATA_S10_const_net_0;
wire   [1:0]  HRESP_S10_const_net_0;
wire   [31:0] HRDATA_S11_const_net_0;
wire   [1:0]  HRESP_S11_const_net_0;
wire   [31:0] HRDATA_S12_const_net_0;
wire   [1:0]  HRESP_S12_const_net_0;
wire   [31:0] HRDATA_S13_const_net_0;
wire   [1:0]  HRESP_S13_const_net_0;
wire   [31:0] HRDATA_S14_const_net_0;
wire   [1:0]  HRESP_S14_const_net_0;
wire   [31:0] HRDATA_S15_const_net_0;
wire   [1:0]  HRESP_S15_const_net_0;
wire   [31:0] HRDATA_SHG_const_net_0;
wire   [1:0]  HRESP_SHG_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [19:0] SDR_MSS_0_MSS_MASTER_AHB_LITE_HADDR;
wire   [31:20]SDR_MSS_0_MSS_MASTER_AHB_LITE_HADDR_0_31to20;
wire   [19:0] SDR_MSS_0_MSS_MASTER_AHB_LITE_HADDR_0_19to0;
wire   [31:0] SDR_MSS_0_MSS_MASTER_AHB_LITE_HADDR_0;
wire   [0:0]  SDR_MSS_0_MSS_MASTER_AHB_LITE_HRESP_0_0to0;
wire          SDR_MSS_0_MSS_MASTER_AHB_LITE_HRESP_0;
wire   [1:0]  SDR_MSS_0_MSS_MASTER_AHB_LITE_HRESP;
wire   [1:0]  SDR_MSS_0_MSS_MASTER_AHB_LITE_HSIZE;
wire   [2:2]  SDR_MSS_0_MSS_MASTER_AHB_LITE_HSIZE_0_2to2;
wire   [1:0]  SDR_MSS_0_MSS_MASTER_AHB_LITE_HSIZE_0_1to0;
wire   [2:0]  SDR_MSS_0_MSS_MASTER_AHB_LITE_HSIZE_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                = 1'b0;
assign HADDR_M0_const_net_0   = 32'h00000000;
assign HTRANS_M0_const_net_0  = 2'h0;
assign HSIZE_M0_const_net_0   = 3'h0;
assign HBURST_M0_const_net_0  = 3'h0;
assign HPROT_M0_const_net_0   = 4'h0;
assign HWDATA_M0_const_net_0  = 32'h00000000;
assign HBURST_M1_const_net_0  = 3'h0;
assign HPROT_M1_const_net_0   = 4'h0;
assign HRDATA_S0_const_net_0  = 32'h00000000;
assign VCC_net                = 1'b1;
assign HRESP_S0_const_net_0   = 2'h0;
assign HRDATA_S1_const_net_0  = 32'h00000000;
assign HRESP_S1_const_net_0   = 2'h0;
assign HRDATA_S2_const_net_0  = 32'h00000000;
assign HRESP_S2_const_net_0   = 2'h0;
assign HRDATA_S3_const_net_0  = 32'h00000000;
assign HRESP_S3_const_net_0   = 2'h0;
assign HRDATA_S4_const_net_0  = 32'h00000000;
assign HRESP_S4_const_net_0   = 2'h0;
assign HRDATA_S9_const_net_0  = 32'h00000000;
assign HRESP_S9_const_net_0   = 2'h0;
assign HRDATA_S10_const_net_0 = 32'h00000000;
assign HRESP_S10_const_net_0  = 2'h0;
assign HRDATA_S11_const_net_0 = 32'h00000000;
assign HRESP_S11_const_net_0  = 2'h0;
assign HRDATA_S12_const_net_0 = 32'h00000000;
assign HRESP_S12_const_net_0  = 2'h0;
assign HRDATA_S13_const_net_0 = 32'h00000000;
assign HRESP_S13_const_net_0  = 2'h0;
assign HRDATA_S14_const_net_0 = 32'h00000000;
assign HRESP_S14_const_net_0  = 2'h0;
assign HRDATA_S15_const_net_0 = 32'h00000000;
assign HRESP_S15_const_net_0  = 2'h0;
assign HRDATA_SHG_const_net_0 = 32'h00000000;
assign HRESP_SHG_const_net_0  = 2'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign UART_0_TXD_net_1  = UART_0_TXD_net_0;
assign UART_0_TXD        = UART_0_TXD_net_1;
assign SPI_1_DO_net_1    = SPI_1_DO_net_0;
assign SPI_1_DO          = SPI_1_DO_net_1;
assign GPIO_8_OUT_net_1  = GPIO_8_OUT_net_0;
assign GPIO_8_OUT        = GPIO_8_OUT_net_1;
assign GLB_net_0         = GLB;
assign ADC_CLK           = GLB_net_0;
assign RF_DOUT_net_1     = RF_DOUT_net_0;
assign RF_DOUT           = RF_DOUT_net_1;
assign RF_CLK_net_1      = RF_CLK_net_0;
assign RF_CLK            = RF_CLK_net_1;
assign RF_CS_net_1       = RF_CS_net_0;
assign RF_CS             = RF_CS_net_1;
assign RF_SHDN_net_1     = RF_SHDN_net_0;
assign RF_SHDN           = RF_SHDN_net_1;
assign RF_RXTX_net_1     = RF_RXTX_net_0;
assign RF_RXTX           = RF_RXTX_net_1;
assign ADC_S1_net_1      = ADC_S1_net_0;
assign ADC_S1            = ADC_S1_net_1;
assign DAC_PD_net_1      = DAC_PD_net_0;
assign DAC_PD            = DAC_PD_net_1;
assign DAC_DACEN_net_1   = DAC_DACEN_net_0;
assign DAC_DACEN         = DAC_DACEN_net_1;
assign RSSI_CLK_net_1    = RSSI_CLK_net_0;
assign RSSI_CLK          = RSSI_CLK_net_1;
assign RSSI_CS_net_1     = RSSI_CS_net_0;
assign RSSI_CS           = RSSI_CS_net_1;
assign DAC_CLK_net_1     = DAC_CLK_net_0;
assign DAC_CLK           = DAC_CLK_net_1;
assign MAC_0_TXEN_net_1  = MAC_0_TXEN_net_0;
assign MAC_0_TXEN        = MAC_0_TXEN_net_1;
assign MAC_0_MDC_net_1   = MAC_0_MDC_net_0;
assign MAC_0_MDC         = MAC_0_MDC_net_1;
assign GPIO_15_OUT_net_1 = GPIO_15_OUT_net_0;
assign GPIO_15_OUT       = GPIO_15_OUT_net_1;
assign GPIO_14_OUT_net_1 = GPIO_14_OUT_net_0;
assign GPIO_14_OUT       = GPIO_14_OUT_net_1;
assign GPIO_13_OUT_net_1 = GPIO_13_OUT_net_0;
assign GPIO_13_OUT       = GPIO_13_OUT_net_1;
assign GPIO_12_OUT_net_1 = GPIO_12_OUT_net_0;
assign GPIO_12_OUT       = GPIO_12_OUT_net_1;
assign GPIO_11_OUT_net_1 = GPIO_11_OUT_net_0;
assign GPIO_11_OUT       = GPIO_11_OUT_net_1;
assign GPIO_10_OUT_net_1 = GPIO_10_OUT_net_0;
assign GPIO_10_OUT       = GPIO_10_OUT_net_1;
assign GPIO_9_OUT_net_1  = GPIO_9_OUT_net_0;
assign GPIO_9_OUT        = GPIO_9_OUT_net_1;
assign sfd_int_net_1     = sfd_int_net_0;
assign sfd_int           = sfd_int_net_1;
assign tx_complete_net_1 = tx_complete_net_0;
assign tx_complete       = tx_complete_net_1;
assign LED_net_1         = LED_net_0;
assign LED[7:0]          = LED_net_1;
assign DAC_DOUT_net_1    = DAC_DOUT_net_0;
assign DAC_DOUT[7:0]     = DAC_DOUT_net_1;
assign TEST_PTS_net_1    = TEST_PTS_net_0;
assign TEST_PTS[15:0]    = TEST_PTS_net_1;
assign RF_GAIN_net_1     = RF_GAIN_net_0;
assign RF_GAIN[6:0]      = RF_GAIN_net_1;
assign MAC_0_TXD_net_1   = MAC_0_TXD_net_0;
assign MAC_0_TXD[1:0]    = MAC_0_TXD_net_1;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign SDR_MSS_0_MSS_MASTER_AHB_LITE_HADDR_0_31to20 = 12'h0;
assign SDR_MSS_0_MSS_MASTER_AHB_LITE_HADDR_0_19to0 = SDR_MSS_0_MSS_MASTER_AHB_LITE_HADDR[19:0];
assign SDR_MSS_0_MSS_MASTER_AHB_LITE_HADDR_0 = { SDR_MSS_0_MSS_MASTER_AHB_LITE_HADDR_0_31to20, SDR_MSS_0_MSS_MASTER_AHB_LITE_HADDR_0_19to0 };

assign SDR_MSS_0_MSS_MASTER_AHB_LITE_HRESP_0_0to0 = SDR_MSS_0_MSS_MASTER_AHB_LITE_HRESP[0:0];
assign SDR_MSS_0_MSS_MASTER_AHB_LITE_HRESP_0 = { SDR_MSS_0_MSS_MASTER_AHB_LITE_HRESP_0_0to0 };

assign SDR_MSS_0_MSS_MASTER_AHB_LITE_HSIZE_0_2to2 = 1'b0;
assign SDR_MSS_0_MSS_MASTER_AHB_LITE_HSIZE_0_1to0 = SDR_MSS_0_MSS_MASTER_AHB_LITE_HSIZE[1:0];
assign SDR_MSS_0_MSS_MASTER_AHB_LITE_HSIZE_0 = { SDR_MSS_0_MSS_MASTER_AHB_LITE_HSIZE_0_2to2, SDR_MSS_0_MSS_MASTER_AHB_LITE_HSIZE_0_1to0 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CoreAHBLite   -   Actel:DirectCore:CoreAHBLite:3.1.102
CoreAHBLite #( 
        .FAMILY             ( 15 ),
        .HADDR_SHG_CFG      ( 1 ),
        .M0_AHBSLOT0ENABLE  ( 0 ),
        .M0_AHBSLOT1ENABLE  ( 0 ),
        .M0_AHBSLOT2ENABLE  ( 0 ),
        .M0_AHBSLOT3ENABLE  ( 0 ),
        .M0_AHBSLOT4ENABLE  ( 0 ),
        .M0_AHBSLOT5ENABLE  ( 0 ),
        .M0_AHBSLOT6ENABLE  ( 0 ),
        .M0_AHBSLOT7ENABLE  ( 0 ),
        .M0_AHBSLOT8ENABLE  ( 0 ),
        .M0_AHBSLOT9ENABLE  ( 0 ),
        .M0_AHBSLOT10ENABLE ( 0 ),
        .M0_AHBSLOT11ENABLE ( 0 ),
        .M0_AHBSLOT12ENABLE ( 0 ),
        .M0_AHBSLOT13ENABLE ( 0 ),
        .M0_AHBSLOT14ENABLE ( 0 ),
        .M0_AHBSLOT15ENABLE ( 0 ),
        .M0_HUGESLOTENABLE  ( 0 ),
        .M0_INITCFG0ENABLE  ( 0 ),
        .M0_INITCFG1ENABLE  ( 0 ),
        .M0_INITCFG2ENABLE  ( 0 ),
        .M0_INITCFG3ENABLE  ( 0 ),
        .M0_INITCFG4ENABLE  ( 0 ),
        .M0_INITCFG5ENABLE  ( 0 ),
        .M0_INITCFG6ENABLE  ( 0 ),
        .M0_INITCFG7ENABLE  ( 0 ),
        .M0_INITCFG8ENABLE  ( 0 ),
        .M0_INITCFG9ENABLE  ( 0 ),
        .M0_INITCFG10ENABLE ( 0 ),
        .M0_INITCFG11ENABLE ( 0 ),
        .M0_INITCFG12ENABLE ( 0 ),
        .M0_INITCFG13ENABLE ( 0 ),
        .M0_INITCFG14ENABLE ( 0 ),
        .M0_INITCFG15ENABLE ( 0 ),
        .M1_AHBSLOT0ENABLE  ( 0 ),
        .M1_AHBSLOT1ENABLE  ( 0 ),
        .M1_AHBSLOT2ENABLE  ( 0 ),
        .M1_AHBSLOT3ENABLE  ( 0 ),
        .M1_AHBSLOT4ENABLE  ( 0 ),
        .M1_AHBSLOT5ENABLE  ( 1 ),
        .M1_AHBSLOT6ENABLE  ( 1 ),
        .M1_AHBSLOT7ENABLE  ( 1 ),
        .M1_AHBSLOT8ENABLE  ( 1 ),
        .M1_AHBSLOT9ENABLE  ( 0 ),
        .M1_AHBSLOT10ENABLE ( 0 ),
        .M1_AHBSLOT11ENABLE ( 0 ),
        .M1_AHBSLOT12ENABLE ( 0 ),
        .M1_AHBSLOT13ENABLE ( 0 ),
        .M1_AHBSLOT14ENABLE ( 0 ),
        .M1_AHBSLOT15ENABLE ( 0 ),
        .M1_HUGESLOTENABLE  ( 0 ),
        .M1_INITCFG0ENABLE  ( 0 ),
        .M1_INITCFG1ENABLE  ( 0 ),
        .M1_INITCFG2ENABLE  ( 0 ),
        .M1_INITCFG3ENABLE  ( 0 ),
        .M1_INITCFG4ENABLE  ( 0 ),
        .M1_INITCFG5ENABLE  ( 0 ),
        .M1_INITCFG6ENABLE  ( 0 ),
        .M1_INITCFG7ENABLE  ( 0 ),
        .M1_INITCFG8ENABLE  ( 0 ),
        .M1_INITCFG9ENABLE  ( 0 ),
        .M1_INITCFG10ENABLE ( 0 ),
        .M1_INITCFG11ENABLE ( 0 ),
        .M1_INITCFG12ENABLE ( 0 ),
        .M1_INITCFG13ENABLE ( 0 ),
        .M1_INITCFG14ENABLE ( 0 ),
        .M1_INITCFG15ENABLE ( 0 ),
        .MODE_CFG           ( 1 ) )
CoreAHBLite_0(
        // Inputs
        .HCLK           ( SDR_MSS_0_FAB_CLK ),
        .HRESETN        ( SDR_MSS_0_M2F_RESET_N ),
        .REMAP_M0       ( GND_net ), // tied to 1'b0 from definition
        .HMASTLOCK_M0   ( GND_net ), // tied to 1'b0 from definition
        .HWRITE_M0      ( GND_net ), // tied to 1'b0 from definition
        .HMASTLOCK_M1   ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HLOCK ),
        .HWRITE_M1      ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HWRITE ),
        .HREADYOUT_S0   ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S1   ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S2   ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S3   ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S4   ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S5   ( CoreAHBLite_0_AHBmslave5_HREADYOUT ),
        .HREADYOUT_S6   ( CoreAHBLite_0_AHBmslave6_HREADYOUT ),
        .HREADYOUT_S7   ( CoreAHBLite_0_AHBmslave7_HREADYOUT ),
        .HREADYOUT_S8   ( CoreAHBLite_0_AHBmslave8_HREADYOUT ),
        .HREADYOUT_S9   ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S10  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S11  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S12  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S13  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S14  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S15  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_SHG  ( VCC_net ), // tied to 1'b1 from definition
        .HADDR_M0       ( HADDR_M0_const_net_0 ), // tied to 32'h00000000 from definition
        .HSIZE_M0       ( HSIZE_M0_const_net_0 ), // tied to 3'h0 from definition
        .HTRANS_M0      ( HTRANS_M0_const_net_0 ), // tied to 2'h0 from definition
        .HWDATA_M0      ( HWDATA_M0_const_net_0 ), // tied to 32'h00000000 from definition
        .HBURST_M0      ( HBURST_M0_const_net_0 ), // tied to 3'h0 from definition
        .HPROT_M0       ( HPROT_M0_const_net_0 ), // tied to 4'h0 from definition
        .HADDR_M1       ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HADDR_0 ),
        .HSIZE_M1       ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HSIZE_0 ),
        .HTRANS_M1      ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HTRANS ),
        .HWDATA_M1      ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HWDATA ),
        .HBURST_M1      ( HBURST_M1_const_net_0 ), // tied to 3'h0 from definition
        .HPROT_M1       ( HPROT_M1_const_net_0 ), // tied to 4'h0 from definition
        .HRDATA_S0      ( HRDATA_S0_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S0       ( HRESP_S0_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S1      ( HRDATA_S1_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S1       ( HRESP_S1_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S2      ( HRDATA_S2_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S2       ( HRESP_S2_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S3      ( HRDATA_S3_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S3       ( HRESP_S3_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S4      ( HRDATA_S4_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S4       ( HRESP_S4_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S5      ( CoreAHBLite_0_AHBmslave5_HRDATA ),
        .HRESP_S5       ( CoreAHBLite_0_AHBmslave5_HRESP ),
        .HRDATA_S6      ( CoreAHBLite_0_AHBmslave6_HRDATA ),
        .HRESP_S6       ( CoreAHBLite_0_AHBmslave6_HRESP ),
        .HRDATA_S7      ( CoreAHBLite_0_AHBmslave7_HRDATA ),
        .HRESP_S7       ( CoreAHBLite_0_AHBmslave7_HRESP ),
        .HRDATA_S8      ( CoreAHBLite_0_AHBmslave8_HRDATA ),
        .HRESP_S8       ( CoreAHBLite_0_AHBmslave8_HRESP ),
        .HRDATA_S9      ( HRDATA_S9_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S9       ( HRESP_S9_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S10     ( HRDATA_S10_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S10      ( HRESP_S10_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S11     ( HRDATA_S11_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S11      ( HRESP_S11_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S12     ( HRDATA_S12_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S12      ( HRESP_S12_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S13     ( HRDATA_S13_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S13      ( HRESP_S13_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S14     ( HRDATA_S14_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S14      ( HRESP_S14_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S15     ( HRDATA_S15_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S15      ( HRESP_S15_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_SHG     ( HRDATA_SHG_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_SHG      ( HRESP_SHG_const_net_0 ), // tied to 2'h0 from definition
        // Outputs
        .HREADY_M0      (  ),
        .HREADY_M1      ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HREADY ),
        .HSEL_S0        (  ),
        .HWRITE_S0      (  ),
        .HREADY_S0      (  ),
        .HMASTLOCK_S0   (  ),
        .HSEL_S1        (  ),
        .HWRITE_S1      (  ),
        .HREADY_S1      (  ),
        .HMASTLOCK_S1   (  ),
        .HSEL_S2        (  ),
        .HWRITE_S2      (  ),
        .HREADY_S2      (  ),
        .HMASTLOCK_S2   (  ),
        .HSEL_S3        (  ),
        .HWRITE_S3      (  ),
        .HREADY_S3      (  ),
        .HMASTLOCK_S3   (  ),
        .HSEL_S4        (  ),
        .HWRITE_S4      (  ),
        .HREADY_S4      (  ),
        .HMASTLOCK_S4   (  ),
        .HSEL_S5        ( CoreAHBLite_0_AHBmslave5_HSELx ),
        .HWRITE_S5      ( CoreAHBLite_0_AHBmslave5_HWRITE ),
        .HREADY_S5      ( CoreAHBLite_0_AHBmslave5_HREADY ),
        .HMASTLOCK_S5   ( CoreAHBLite_0_AHBmslave5_HMASTLOCK ),
        .HSEL_S6        ( CoreAHBLite_0_AHBmslave6_HSELx ),
        .HWRITE_S6      ( CoreAHBLite_0_AHBmslave6_HWRITE ),
        .HREADY_S6      ( CoreAHBLite_0_AHBmslave6_HREADY ),
        .HMASTLOCK_S6   ( CoreAHBLite_0_AHBmslave6_HMASTLOCK ),
        .HSEL_S7        ( CoreAHBLite_0_AHBmslave7_HSELx ),
        .HWRITE_S7      ( CoreAHBLite_0_AHBmslave7_HWRITE ),
        .HREADY_S7      ( CoreAHBLite_0_AHBmslave7_HREADY ),
        .HMASTLOCK_S7   ( CoreAHBLite_0_AHBmslave7_HMASTLOCK ),
        .HSEL_S8        ( CoreAHBLite_0_AHBmslave8_HSELx ),
        .HWRITE_S8      ( CoreAHBLite_0_AHBmslave8_HWRITE ),
        .HREADY_S8      ( CoreAHBLite_0_AHBmslave8_HREADY ),
        .HMASTLOCK_S8   ( CoreAHBLite_0_AHBmslave8_HMASTLOCK ),
        .HSEL_S9        (  ),
        .HWRITE_S9      (  ),
        .HREADY_S9      (  ),
        .HMASTLOCK_S9   (  ),
        .HSEL_S10       (  ),
        .HWRITE_S10     (  ),
        .HREADY_S10     (  ),
        .HMASTLOCK_S10  (  ),
        .HSEL_S11       (  ),
        .HWRITE_S11     (  ),
        .HREADY_S11     (  ),
        .HMASTLOCK_S11  (  ),
        .HSEL_S12       (  ),
        .HWRITE_S12     (  ),
        .HREADY_S12     (  ),
        .HMASTLOCK_S12  (  ),
        .HSEL_S13       (  ),
        .HWRITE_S13     (  ),
        .HREADY_S13     (  ),
        .HMASTLOCK_S13  (  ),
        .HSEL_S14       (  ),
        .HWRITE_S14     (  ),
        .HREADY_S14     (  ),
        .HMASTLOCK_S14  (  ),
        .HSEL_S15       (  ),
        .HWRITE_S15     (  ),
        .HREADY_S15     (  ),
        .HMASTLOCK_S15  (  ),
        .HSEL_SHG       (  ),
        .HWRITE_SHG     (  ),
        .HREADY_SHG     (  ),
        .HMASTLOCK_SHG  (  ),
        .INITDATVAL_C0  (  ),
        .INITDONE_C0    (  ),
        .INITDATVAL_C1  (  ),
        .INITDONE_C1    (  ),
        .INITDATVAL_C2  (  ),
        .INITDONE_C2    (  ),
        .INITDATVAL_C3  (  ),
        .INITDONE_C3    (  ),
        .INITDATVAL_C4  (  ),
        .INITDONE_C4    (  ),
        .INITDATVAL_C5  (  ),
        .INITDONE_C5    (  ),
        .INITDATVAL_C6  (  ),
        .INITDONE_C6    (  ),
        .INITDATVAL_C7  (  ),
        .INITDONE_C7    (  ),
        .INITDATVAL_C8  (  ),
        .INITDONE_C8    (  ),
        .INITDATVAL_C9  (  ),
        .INITDONE_C9    (  ),
        .INITDATVAL_C10 (  ),
        .INITDONE_C10   (  ),
        .INITDATVAL_C11 (  ),
        .INITDONE_C11   (  ),
        .INITDATVAL_C12 (  ),
        .INITDONE_C12   (  ),
        .INITDATVAL_C13 (  ),
        .INITDONE_C13   (  ),
        .INITDATVAL_C14 (  ),
        .INITDONE_C14   (  ),
        .INITDATVAL_C15 (  ),
        .INITDONE_C15   (  ),
        .HRESP_M0       (  ),
        .HRDATA_M0      (  ),
        .HRESP_M1       ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HRESP ),
        .HRDATA_M1      ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HRDATA ),
        .HADDR_S0       (  ),
        .HSIZE_S0       (  ),
        .HTRANS_S0      (  ),
        .HWDATA_S0      (  ),
        .HBURST_S0      (  ),
        .HPROT_S0       (  ),
        .HADDR_S1       (  ),
        .HSIZE_S1       (  ),
        .HTRANS_S1      (  ),
        .HWDATA_S1      (  ),
        .HBURST_S1      (  ),
        .HPROT_S1       (  ),
        .HADDR_S2       (  ),
        .HSIZE_S2       (  ),
        .HTRANS_S2      (  ),
        .HWDATA_S2      (  ),
        .HBURST_S2      (  ),
        .HPROT_S2       (  ),
        .HADDR_S3       (  ),
        .HSIZE_S3       (  ),
        .HTRANS_S3      (  ),
        .HWDATA_S3      (  ),
        .HBURST_S3      (  ),
        .HPROT_S3       (  ),
        .HADDR_S4       (  ),
        .HSIZE_S4       (  ),
        .HTRANS_S4      (  ),
        .HWDATA_S4      (  ),
        .HBURST_S4      (  ),
        .HPROT_S4       (  ),
        .HADDR_S5       ( CoreAHBLite_0_AHBmslave5_HADDR ),
        .HSIZE_S5       ( CoreAHBLite_0_AHBmslave5_HSIZE ),
        .HTRANS_S5      ( CoreAHBLite_0_AHBmslave5_HTRANS ),
        .HWDATA_S5      ( CoreAHBLite_0_AHBmslave5_HWDATA ),
        .HBURST_S5      ( CoreAHBLite_0_AHBmslave5_HBURST ),
        .HPROT_S5       ( CoreAHBLite_0_AHBmslave5_HPROT ),
        .HADDR_S6       ( CoreAHBLite_0_AHBmslave6_HADDR ),
        .HSIZE_S6       ( CoreAHBLite_0_AHBmslave6_HSIZE ),
        .HTRANS_S6      ( CoreAHBLite_0_AHBmslave6_HTRANS ),
        .HWDATA_S6      ( CoreAHBLite_0_AHBmslave6_HWDATA ),
        .HBURST_S6      ( CoreAHBLite_0_AHBmslave6_HBURST ),
        .HPROT_S6       ( CoreAHBLite_0_AHBmslave6_HPROT ),
        .HADDR_S7       ( CoreAHBLite_0_AHBmslave7_HADDR ),
        .HSIZE_S7       ( CoreAHBLite_0_AHBmslave7_HSIZE ),
        .HTRANS_S7      ( CoreAHBLite_0_AHBmslave7_HTRANS ),
        .HWDATA_S7      ( CoreAHBLite_0_AHBmslave7_HWDATA ),
        .HBURST_S7      ( CoreAHBLite_0_AHBmslave7_HBURST ),
        .HPROT_S7       ( CoreAHBLite_0_AHBmslave7_HPROT ),
        .HADDR_S8       ( CoreAHBLite_0_AHBmslave8_HADDR ),
        .HSIZE_S8       ( CoreAHBLite_0_AHBmslave8_HSIZE ),
        .HTRANS_S8      ( CoreAHBLite_0_AHBmslave8_HTRANS ),
        .HWDATA_S8      ( CoreAHBLite_0_AHBmslave8_HWDATA ),
        .HBURST_S8      ( CoreAHBLite_0_AHBmslave8_HBURST ),
        .HPROT_S8       ( CoreAHBLite_0_AHBmslave8_HPROT ),
        .HADDR_S9       (  ),
        .HSIZE_S9       (  ),
        .HTRANS_S9      (  ),
        .HWDATA_S9      (  ),
        .HBURST_S9      (  ),
        .HPROT_S9       (  ),
        .HADDR_S10      (  ),
        .HSIZE_S10      (  ),
        .HTRANS_S10     (  ),
        .HWDATA_S10     (  ),
        .HBURST_S10     (  ),
        .HPROT_S10      (  ),
        .HADDR_S11      (  ),
        .HSIZE_S11      (  ),
        .HTRANS_S11     (  ),
        .HWDATA_S11     (  ),
        .HBURST_S11     (  ),
        .HPROT_S11      (  ),
        .HADDR_S12      (  ),
        .HSIZE_S12      (  ),
        .HTRANS_S12     (  ),
        .HWDATA_S12     (  ),
        .HBURST_S12     (  ),
        .HPROT_S12      (  ),
        .HADDR_S13      (  ),
        .HSIZE_S13      (  ),
        .HTRANS_S13     (  ),
        .HWDATA_S13     (  ),
        .HBURST_S13     (  ),
        .HPROT_S13      (  ),
        .HADDR_S14      (  ),
        .HSIZE_S14      (  ),
        .HTRANS_S14     (  ),
        .HWDATA_S14     (  ),
        .HBURST_S14     (  ),
        .HPROT_S14      (  ),
        .HADDR_S15      (  ),
        .HSIZE_S15      (  ),
        .HTRANS_S15     (  ),
        .HWDATA_S15     (  ),
        .HBURST_S15     (  ),
        .HPROT_S15      (  ),
        .HADDR_SHG      (  ),
        .HSIZE_SHG      (  ),
        .HTRANS_SHG     (  ),
        .HWDATA_SHG     (  ),
        .HBURST_SHG     (  ),
        .HPROT_SHG      (  ),
        .INITADDR_C0    (  ),
        .INITDATA_C0    (  ),
        .INITADDR_C1    (  ),
        .INITDATA_C1    (  ),
        .INITADDR_C2    (  ),
        .INITDATA_C2    (  ),
        .INITADDR_C3    (  ),
        .INITDATA_C3    (  ),
        .INITADDR_C4    (  ),
        .INITDATA_C4    (  ),
        .INITADDR_C5    (  ),
        .INITDATA_C5    (  ),
        .INITADDR_C6    (  ),
        .INITDATA_C6    (  ),
        .INITADDR_C7    (  ),
        .INITDATA_C7    (  ),
        .INITADDR_C8    (  ),
        .INITDATA_C8    (  ),
        .INITADDR_C9    (  ),
        .INITDATA_C9    (  ),
        .INITADDR_C10   (  ),
        .INITDATA_C10   (  ),
        .INITADDR_C11   (  ),
        .INITDATA_C11   (  ),
        .INITADDR_C12   (  ),
        .INITDATA_C12   (  ),
        .INITADDR_C13   (  ),
        .INITDATA_C13   (  ),
        .INITADDR_C14   (  ),
        .INITDATA_C14   (  ),
        .INITADDR_C15   (  ),
        .INITDATA_C15   (  ) 
        );

//--------SDR_MSS
SDR_MSS SDR_MSS_0(
        // Inputs
        .UART_0_RXD  ( UART_0_RXD ),
        .SPI_1_DI    ( SPI_1_DI ),
        .MSS_RESET_N ( MSS_RESET_N ),
        .MSSHREADY   ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HREADY ),
        .MSSHRESP    ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HRESP_0 ),
        .F2M_GPI_31  ( tx_complete_net_0 ),
        .F2M_GPI_27  ( SW4 ),
        .F2M_GPI_26  ( SW3 ),
        .F2M_GPI_25  ( SW2 ),
        .F2M_GPI_24  ( SW1 ),
        .F2M_GPI_23  ( sfd_int_net_0 ),
        .F2M_GPI_19  ( sdrv2_top_0_ready_to_transmit ),
        .F2M_GPI_17  ( sdrv2_top_0_packet_done ),
        .F2M_GPI_16  ( sdrv2_top_0_length_int ),
        .MAINXIN     ( MAINXIN ),
        .CLKC        ( CLKC ),
        .MAC_0_CRSDV ( MAC_0_CRSDV ),
        .MAC_0_RXER  ( MAC_0_RXER ),
        .F2M_GPI_30  ( SDR_MSS_0_M2F_GPO_6 ),
        .MSSHRDATA   ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HRDATA ),
        .MAC_0_RXD   ( MAC_0_RXD ),
        // Outputs
        .UART_0_TXD  ( UART_0_TXD_net_0 ),
        .SPI_1_DO    ( SPI_1_DO_net_0 ),
        .M2F_RESET_N ( SDR_MSS_0_M2F_RESET_N ),
        .MSSHWRITE   ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HWRITE ),
        .MSSHLOCK    ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HLOCK ),
        .GPIO_8_OUT  ( GPIO_8_OUT_net_0 ),
        .M2F_GPO_7   ( SDR_MSS_0_M2F_GPO_7 ),
        .GLB         ( GLB ),
        .FAB_CLK     ( SDR_MSS_0_FAB_CLK ),
        .GLC         (  ),
        .MAC_0_TXEN  ( MAC_0_TXEN_net_0 ),
        .MAC_0_MDC   ( MAC_0_MDC_net_0 ),
        .GPIO_15_OUT ( GPIO_15_OUT_net_0 ),
        .GPIO_14_OUT ( GPIO_14_OUT_net_0 ),
        .GPIO_13_OUT ( GPIO_13_OUT_net_0 ),
        .GPIO_12_OUT ( GPIO_12_OUT_net_0 ),
        .GPIO_11_OUT ( GPIO_11_OUT_net_0 ),
        .GPIO_10_OUT ( GPIO_10_OUT_net_0 ),
        .GPIO_9_OUT  ( GPIO_9_OUT_net_0 ),
        .M2F_GPO_6   ( SDR_MSS_0_M2F_GPO_6 ),
        .MSSHADDR    ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HADDR ),
        .MSSHTRANS   ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HTRANS ),
        .MSSHSIZE    ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HSIZE ),
        .MSSHWDATA   ( SDR_MSS_0_MSS_MASTER_AHB_LITE_HWDATA ),
        .MAC_0_TXD   ( MAC_0_TXD_net_0 ),
        // Inouts
        .SPI_1_CLK   ( SPI_1_CLK ),
        .SPI_1_SS    ( SPI_1_SS ),
        .MAC_0_MDIO  ( MAC_0_MDIO ) 
        );

//--------sdrv2_top
sdrv2_top sdrv2_top_0(
        // Inputs
        .RSSI_DIN          ( RSSI_DIN ),
        .ADC_CLK           ( GLB ),
        .tx_fire           ( SDR_MSS_0_M2F_GPO_7 ),
        .HRESETn           ( SDR_MSS_0_M2F_RESET_N ),
        .HCLK              ( SDR_MSS_0_FAB_CLK ),
        .HSEL0             ( CoreAHBLite_0_AHBmslave5_HSELx ),
        .HSEL1             ( CoreAHBLite_0_AHBmslave6_HSELx ),
        .HSEL2             ( CoreAHBLite_0_AHBmslave7_HSELx ),
        .HSEL3             ( CoreAHBLite_0_AHBmslave8_HSELx ),
        .HWRITE0           ( CoreAHBLite_0_AHBmslave5_HWRITE ),
        .HWRITE1           ( CoreAHBLite_0_AHBmslave6_HWRITE ),
        .HWRITE2           ( CoreAHBLite_0_AHBmslave7_HWRITE ),
        .HWRITE3           ( CoreAHBLite_0_AHBmslave8_HWRITE ),
        .HMASTLOCK0        ( CoreAHBLite_0_AHBmslave5_HMASTLOCK ),
        .HMASTLOCK1        ( CoreAHBLite_0_AHBmslave6_HMASTLOCK ),
        .HMASTLOCK2        ( CoreAHBLite_0_AHBmslave7_HMASTLOCK ),
        .HMASTLOCK3        ( CoreAHBLite_0_AHBmslave8_HMASTLOCK ),
        .HREADY0           ( CoreAHBLite_0_AHBmslave5_HREADY ),
        .HREADY1           ( CoreAHBLite_0_AHBmslave6_HREADY ),
        .HREADY2           ( CoreAHBLite_0_AHBmslave7_HREADY ),
        .HREADY3           ( CoreAHBLite_0_AHBmslave8_HREADY ),
        .in_phase          ( in_phase ),
        .quad_phase        ( quad_phase ),
        .HADDR0            ( CoreAHBLite_0_AHBmslave5_HADDR ),
        .HADDR1            ( CoreAHBLite_0_AHBmslave6_HADDR ),
        .HADDR2            ( CoreAHBLite_0_AHBmslave7_HADDR ),
        .HADDR3            ( CoreAHBLite_0_AHBmslave8_HADDR ),
        .HWDATA0           ( CoreAHBLite_0_AHBmslave5_HWDATA ),
        .HWDATA1           ( CoreAHBLite_0_AHBmslave6_HWDATA ),
        .HWDATA2           ( CoreAHBLite_0_AHBmslave7_HWDATA ),
        .HWDATA3           ( CoreAHBLite_0_AHBmslave8_HWDATA ),
        .HSIZE0            ( CoreAHBLite_0_AHBmslave5_HSIZE ),
        .HSIZE1            ( CoreAHBLite_0_AHBmslave6_HSIZE ),
        .HSIZE2            ( CoreAHBLite_0_AHBmslave7_HSIZE ),
        .HSIZE3            ( CoreAHBLite_0_AHBmslave8_HSIZE ),
        .HBURST0           ( CoreAHBLite_0_AHBmslave5_HBURST ),
        .HBURST1           ( CoreAHBLite_0_AHBmslave6_HBURST ),
        .HBURST2           ( CoreAHBLite_0_AHBmslave7_HBURST ),
        .HBURST3           ( CoreAHBLite_0_AHBmslave8_HBURST ),
        .HPROT0            ( CoreAHBLite_0_AHBmslave5_HPROT ),
        .HPROT1            ( CoreAHBLite_0_AHBmslave6_HPROT ),
        .HPROT2            ( CoreAHBLite_0_AHBmslave7_HPROT ),
        .HPROT3            ( CoreAHBLite_0_AHBmslave8_HPROT ),
        .HTRANS0           ( CoreAHBLite_0_AHBmslave5_HTRANS ),
        .HTRANS1           ( CoreAHBLite_0_AHBmslave6_HTRANS ),
        .HTRANS2           ( CoreAHBLite_0_AHBmslave7_HTRANS ),
        .HTRANS3           ( CoreAHBLite_0_AHBmslave8_HTRANS ),
        // Outputs
        .RSSI_CLK          ( RSSI_CLK_net_0 ),
        .RSSI_CS           ( RSSI_CS_net_0 ),
        .ADC_S1            ( ADC_S1_net_0 ),
        .DAC_DACEN         ( DAC_DACEN_net_0 ),
        .DAC_PD            ( DAC_PD_net_0 ),
        .DAC_CLK           ( DAC_CLK_net_0 ),
        .RF_RXTX           ( RF_RXTX_net_0 ),
        .RF_SHDN           ( RF_SHDN_net_0 ),
        .RF_DOUT           ( RF_DOUT_net_0 ),
        .RF_CS             ( RF_CS_net_0 ),
        .RF_CLK            ( RF_CLK_net_0 ),
        .length_int        ( sdrv2_top_0_length_int ),
        .packet_done       ( sdrv2_top_0_packet_done ),
        .ready_to_transmit ( sdrv2_top_0_ready_to_transmit ),
        .sfd_int           ( sfd_int_net_0 ),
        .tx_complete       ( tx_complete_net_0 ),
        .HREADYOUT0        ( CoreAHBLite_0_AHBmslave5_HREADYOUT ),
        .HREADYOUT1        ( CoreAHBLite_0_AHBmslave6_HREADYOUT ),
        .HREADYOUT2        ( CoreAHBLite_0_AHBmslave7_HREADYOUT ),
        .HREADYOUT3        ( CoreAHBLite_0_AHBmslave8_HREADYOUT ),
        .DAC_DOUT          ( DAC_DOUT_net_0 ),
        .LED               ( LED_net_0 ),
        .RF_GAIN           ( RF_GAIN_net_0 ),
        .TEST_PTS          ( TEST_PTS_net_0 ),
        .HRESP0            ( CoreAHBLite_0_AHBmslave5_HRESP ),
        .HRESP1            ( CoreAHBLite_0_AHBmslave6_HRESP ),
        .HRESP2            ( CoreAHBLite_0_AHBmslave7_HRESP ),
        .HRESP3            ( CoreAHBLite_0_AHBmslave8_HRESP ),
        .HRDATA0           ( CoreAHBLite_0_AHBmslave5_HRDATA ),
        .HRDATA1           ( CoreAHBLite_0_AHBmslave6_HRDATA ),
        .HRDATA2           ( CoreAHBLite_0_AHBmslave7_HRDATA ),
        .HRDATA3           ( CoreAHBLite_0_AHBmslave8_HRDATA ) 
        );


endmodule
