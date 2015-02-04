# Synopsys, Inc. constraint file
# C:\Actelprj\SDRv2_LiberoV9\synthesis\clock_constraint.sdc
# Written on Thu Aug 23 18:29:35 2012
# by Synplify Pro, E-2010.09A-1 Scope Editor

#
# Collections
#

#
# Clocks
#
define_clock   {n:SDR_MSS_0.MSS_CCC_0.FAB_CLK}  -freq 60 -clockgroup default_clkgroup_0
define_clock   {n:SDR_MSS_0.MSS_CCC_0.GLB}  -freq 16 -clockgroup default_clkgroup_1

#
# Clock to Clock
#

#
# Inputs/Outputs
#
define_input_delay -disable      -default
define_output_delay -disable     -default
define_output_delay -disable     {UART_0_TXD}
define_input_delay -disable      {UART_0_RXD}
define_output_delay -disable     {SPI_1_DO}
define_input_delay -disable      {SPI_1_SS}
define_output_delay -disable     {SPI_1_SS}
define_input_delay -disable      {SPI_1_CLK}
define_output_delay -disable     {SPI_1_CLK}
define_input_delay -disable      {SPI_1_DI}
define_input_delay -disable      {MSS_RESET_N}
define_output_delay -disable     {GPIO_8_OUT}
define_input_delay -disable      {MAINXIN}
define_output_delay -disable     {ADC_CLK}
define_input_delay -disable      {SW1}
define_input_delay -disable      {SW2}
define_input_delay -disable      {SW3}
define_input_delay -disable      {SW4}
define_input_delay -disable      {in_phase[7:0]}
define_input_delay -disable      {quad_phase[7:0]}
define_output_delay -disable     {RF_DOUT}
define_output_delay -disable     {RF_CLK}
define_output_delay -disable     {RF_CS}
define_output_delay -disable     {RF_SHDN}
define_output_delay -disable     {RF_RXTX}
define_output_delay -disable     {ADC_S1}
define_output_delay -disable     {DAC_PD}
define_output_delay -disable     {DAC_DACEN}
define_output_delay -disable     {RSSI_CLK}
define_output_delay -disable     {RSSI_CS}
define_input_delay -disable      {RSSI_DIN}
define_output_delay -disable     {LED[7:0]}
define_output_delay -disable     {DAC_DOUT[7:0]}
define_output_delay -disable     {DAC_CLK}
define_output_delay -disable     {TP_Radio_CTL[7:0]}
define_output_delay -disable     {TP_Correlator[7:0]}

#
# Registers
#

#
# Delay Paths
#

#
# Attributes
#

#
# I/O Standards
#
define_io_standard -disable      -default_input -delay_type input
define_io_standard -disable      -default_output -delay_type output
define_io_standard -disable      -default_bidir -delay_type bidir
define_io_standard -disable      {UART_0_TXD} -delay_type output
define_io_standard -disable      {UART_0_RXD} -delay_type input
define_io_standard -disable      {SPI_1_DO} -delay_type output
define_io_standard -disable      {SPI_1_SS} -delay_type bidir
define_io_standard -disable      {SPI_1_CLK} -delay_type bidir
define_io_standard -disable      {SPI_1_DI} -delay_type input
define_io_standard -disable      {MSS_RESET_N} -delay_type input
define_io_standard -disable      {GPIO_8_OUT} -delay_type output
define_io_standard -disable      {MAINXIN} -delay_type input
define_io_standard -disable      {ADC_CLK} -delay_type output
define_io_standard -disable      {SW1} -delay_type input
define_io_standard -disable      {SW2} -delay_type input
define_io_standard -disable      {SW3} -delay_type input
define_io_standard -disable      {SW4} -delay_type input
define_io_standard -disable      {in_phase[7:0]} -delay_type input
define_io_standard -disable      {quad_phase[7:0]} -delay_type input
define_io_standard -disable      {RF_DOUT} -delay_type output
define_io_standard -disable      {RF_CLK} -delay_type output
define_io_standard -disable      {RF_CS} -delay_type output
define_io_standard -disable      {RF_SHDN} -delay_type output
define_io_standard -disable      {RF_RXTX} -delay_type output
define_io_standard -disable      {ADC_S1} -delay_type output
define_io_standard -disable      {DAC_PD} -delay_type output
define_io_standard -disable      {DAC_DACEN} -delay_type output
define_io_standard -disable      {RSSI_CLK} -delay_type output
define_io_standard -disable      {RSSI_CS} -delay_type output
define_io_standard -disable      {RSSI_DIN} -delay_type input
define_io_standard -disable      {LED[7:0]} -delay_type output
define_io_standard -disable      {DAC_DOUT[7:0]} -delay_type output
define_io_standard -disable      {DAC_CLK} -delay_type output
define_io_standard -disable      {TP_Radio_CTL[7:0]} -delay_type output
define_io_standard -disable      {TP_Correlator[7:0]} -delay_type output

#
# Compile Points
#

#
# Other
#
