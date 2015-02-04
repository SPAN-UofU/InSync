# Synopsys, Inc. constraint file
# C:/Actelprj/SDRv2/constraint/clock_constraint.sdc
# Written on Fri Sep 07 14:13:23 2012
# by Synplify Pro, E-2010.09A-1 Scope Editor

#
# Collections
#

#
# Clocks
#
define_clock   {n:SDR_MSS_0.MSS_CCC_0.FAB_CLK} -name {n:SDR_MSS_0.MSS_CCC_0.FAB_CLK}  -freq 60 -clockgroup default_clkgroup_0
define_clock   {n:SDR_MSS_0.MSS_CCC_0.GLB} -name {n:SDR_MSS_0.MSS_CCC_0.GLB}  -freq 16 -clockgroup default_clkgroup_1
define_clock -disable   {}  -clockgroup default_clkgroup_2

#
# Clock to Clock
#

#
# Inputs/Outputs
#
define_input_delay -disable      -default -improve 0.00 -route 0.00
define_output_delay -disable     -default -improve 0.00 -route 0.00
define_output_delay -disable     {UART_0_TXD} -improve 0.00 -route 0.00
define_input_delay -disable      {UART_0_RXD} -improve 0.00 -route 0.00
define_output_delay -disable     {SPI_1_DO} -improve 0.00 -route 0.00
define_input_delay -disable      {SPI_1_SS} -improve 0.00 -route 0.00
define_output_delay -disable     {SPI_1_SS} -improve 0.00 -route 0.00
define_input_delay -disable      {SPI_1_CLK} -improve 0.00 -route 0.00
define_output_delay -disable     {SPI_1_CLK} -improve 0.00 -route 0.00
define_input_delay -disable      {SPI_1_DI} -improve 0.00 -route 0.00
define_input_delay -disable      {MSS_RESET_N} -improve 0.00 -route 0.00
define_output_delay -disable     {GPIO_8_OUT} -improve 0.00 -route 0.00
define_input_delay -disable      {MAINXIN} -improve 0.00 -route 0.00
define_output_delay -disable     {ADC_CLK} -improve 0.00 -route 0.00
define_input_delay -disable      {SW1} -improve 0.00 -route 0.00
define_input_delay -disable      {SW2} -improve 0.00 -route 0.00
define_input_delay -disable      {SW3} -improve 0.00 -route 0.00
define_input_delay -disable      {SW4} -improve 0.00 -route 0.00
define_input_delay -disable      {in_phase[7:0]} -improve 0.00 -route 0.00
define_input_delay -disable      {quad_phase[7:0]} -improve 0.00 -route 0.00
define_output_delay -disable     {RF_DOUT} -improve 0.00 -route 0.00
define_output_delay -disable     {RF_CLK} -improve 0.00 -route 0.00
define_output_delay -disable     {RF_CS} -improve 0.00 -route 0.00
define_output_delay -disable     {RF_SHDN} -improve 0.00 -route 0.00
define_output_delay -disable     {RF_RXTX} -improve 0.00 -route 0.00
define_output_delay -disable     {ADC_S1} -improve 0.00 -route 0.00
define_output_delay -disable     {DAC_PD} -improve 0.00 -route 0.00
define_output_delay -disable     {DAC_DACEN} -improve 0.00 -route 0.00
define_output_delay -disable     {RSSI_CLK} -improve 0.00 -route 0.00
define_output_delay -disable     {RSSI_CS} -improve 0.00 -route 0.00
define_input_delay -disable      {RSSI_DIN} -improve 0.00 -route 0.00
define_output_delay -disable     {LED[7:0]} -improve 0.00 -route 0.00
define_output_delay -disable     {DAC_DOUT[7:0]} -improve 0.00 -route 0.00
define_output_delay -disable     {DAC_CLK} -improve 0.00 -route 0.00
define_output_delay -disable     {TP_Radio_CTL[7:0]} -improve 0.00 -route 0.00
define_output_delay -disable     {TP_Correlator[7:0]} -improve 0.00 -route 0.00

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
