/*
 * "Copyright (c) 2010-2013 The Regents of the University of Michigan.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the
 *   distribution.
 * - Neither the name of the copyright holders nor the names of
 *   its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE
 * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
 * @author Ye-Sheng Kuo <samkuo@eecs.umich.edu>
 * Last Modify: 2/21 '2013
 * Content: add define file, modify port definition
 */

`include "sdr_def.v"

module radio_ctl(
	// AHB interface
	input	HCLK,
	input	HRESETn, 
	input	[31:0] HADDR, 
	input	[31:0] HWDATA, 
	input	[3:0] HPROT, 
	input	[2:0] HSIZE, 
	input	[2:0] HBURST, 
	input	[1:0] HTRANS, 
	input	HSEL, 
	input	HWRITE, 
	input 	HMASTLOCK, 
	input	HREADY, 
	output reg 	HREADYOUT, 
	output 		[1:0] HRESP, 
	output 		[31:0] HRDATA,

	output reg	ack_en,
	output reg [7:0] led_out,
	output		agc_en, 
	output reg	correlator_en,
	// to fifo_ctl
	output reg	ack_flush, 
	output reg	fifo_ctl_tx_fire,
	// from fifo_ctl
	input	fifo_ready,
	input	fifo_ctl_sw_tx,			
	input	fifo_tx_cpl,
	input	[2:0] ack_gl_state,
	// from correlator
	input	agc_latch, 
	input	length_int,
	input	ack_glossy, 
	// interrupt to processor
	output	ready_to_transmit,
	// from processor
	input	tx_fire,
	// IOs for descrete chips
	output		ADCIO_S1, 
	output reg 	DACIO_PD, 
	output reg	DACIO_DACEN, 
	output reg	RFIO_SHDN,
	output reg	RFIO_RXTX,
	output reg  fifo_rst,
	output [7:0] test_points
);

reg				hwrite_reg;
reg		[7:0]	haddr_reg;
reg		[1:0]	fsm;
reg		[11:0]	HRDATA_reg;

assign HRDATA		= {20'b0, HRDATA_reg};
assign HRESP		= 2'b00;

// IOs from processor

// IOs from other blocks
reg				length_int_reg, fifo_tx_cpl_reg;

reg				ack_flush_reg, next_ack_flush, next_fifo_ctl_tx_fire;
reg				next_correlator_en;
reg				radio_off;
reg		[1:0]	agc_mode;

assign agc_en = (agc_mode==2'b11)? 1 : (agc_mode==0)? 0 : ~agc_latch;

// chip IO configuration

localparam RF_SHUTDOWN = 2'b00;
localparam RF_STANDBY = 2'b01;
localparam RF_RX = 2'b10;
localparam RF_TX = 2'b11;

localparam ADC_STANDBY = 0;
localparam ADC_ON = 1;

localparam DAC_STANDBY = 2'b00;
localparam DAC_ON = 2'b01;
localparam DAC_SHUTDOWN = 2'b10;

localparam RXTX_TURN_TIME = 2*(`HCLK_FREQ);		// HCLK is 48MHz, MAX2831 requires 2us to turnaround, 2/(1/48) = 96 ticks
localparam RF_WARMUP_TIME = 1000*(`HCLK_FREQ);	// 1000 us for crystal stablize
localparam AUTO_TX_TIME = 190*(`HCLK_FREQ);

localparam WAIT_FOR_TX_COMPLETE =			4'b1100;
localparam RX_TX_TURNAROUND =				4'b0100;
localparam TX_RX_TURNAROUND =				4'b0011;
localparam RX_IDLE =							4'b0000;
localparam RX_COLLECT =						4'b0001;
localparam RX_WAIT_FOR_ACK_GLOSSY =			4'b0101;
localparam RX_WAIT_FOR_ACK_GLOSSY_COMPLETE =	4'b1101;
localparam RADIO_OFF =						4'b1000;
localparam RADIO_WARMUP =					4'b1001;

reg		[1:0]	RF_MODE, DAC_MODE, next_RF_MODE, next_DAC_MODE;
reg				ADC_MODE, next_ADC_MODE;
reg		[3:0]	radio_mode, next_radio_mode;
reg		[15:0]	turn_cnt, next_turn_cnt;

assign ADCIO_S1 = (ADC_MODE==ADC_ON)? 1 : 0;

reg				tx_fire_sampled, tx_fire_sampled_clear, next_tx_fire_sampled_clear;
assign test_points = {radio_mode, fifo_ctl_sw_tx, fifo_tx_cpl_reg, tx_fire, tx_fire_sampled};

reg		[13:0]	auto_tx_cnt, next_auto_tx_cnt;
reg				auto_tx_reg, next_auto_tx_reg;
reg		[1:0]	auto_tx_state, next_auto_tx_state;
reg				auto_tx_en;

reg				fire_en;

always @ (posedge HCLK or negedge HRESETn)
begin
	if (~HRESETn)
	begin
		tx_fire_sampled <= 0;
		fire_en <= 1;
	end
	else
	begin
		if (tx_fire_sampled_clear)
			tx_fire_sampled <= 0;
		else
		begin
			if (tx_fire)
			begin
				if (fire_en)
				begin
					tx_fire_sampled <= 1;
					fire_en <= 0;
				end
			end
			else
				fire_en <= 1;
		end
	end
end

wire	auto_tx_en_rstn = HRESETn & auto_tx_en;

always @ (posedge HCLK or negedge auto_tx_en_rstn)
begin
	if (~auto_tx_en_rstn)
	begin
		auto_tx_cnt <= AUTO_TX_TIME;
		auto_tx_state <= 0;
		auto_tx_reg <= 0;
	end
	else
	begin
		auto_tx_cnt <= next_auto_tx_cnt;
		auto_tx_state <= next_auto_tx_state;
		auto_tx_reg <= next_auto_tx_reg;
	end
end

always @ *
begin
	next_auto_tx_cnt = auto_tx_cnt;
	next_auto_tx_state = auto_tx_state;
	next_auto_tx_reg = auto_tx_reg;
	case(auto_tx_state)
		2'b00:
		begin
			next_auto_tx_cnt = AUTO_TX_TIME;
			next_auto_tx_reg = 0;
			if ((radio_mode==RX_COLLECT)&&(length_int_reg==0))
				next_auto_tx_state = 2'b01;
		end

		2'b01:
		begin
			next_auto_tx_cnt = auto_tx_cnt - 1;
			if (auto_tx_cnt==0)
				next_auto_tx_state = 2'b10;
		end

		2'b10:
		begin
			if (radio_mode==RX_IDLE)
			begin
				next_auto_tx_reg = 1;
				next_auto_tx_state = 2'b11;
			end
			else
				next_auto_tx_state = 2'b00;
		end

		2'b11:
		begin
			if (radio_mode!=RX_IDLE)
				next_auto_tx_state = 2'b00;
		end
	endcase
end

always @ *
begin
	case (RF_MODE)
		RF_SHUTDOWN:
		begin
			RFIO_SHDN = 0;
			RFIO_RXTX = 0;
		end

		RF_STANDBY:
		begin
			RFIO_SHDN = 0;
			RFIO_RXTX = 1;
		end

		RF_RX:
		begin
			RFIO_SHDN = 1;
			RFIO_RXTX = 0;
		end

		RF_TX:
		begin
			RFIO_SHDN = 1;
			RFIO_RXTX = 1;
		end
	endcase
end

always @ *
begin
	case (DAC_MODE)
		DAC_STANDBY:
		begin
			DACIO_PD = 0;
			DACIO_DACEN = 0;
		end

		DAC_ON:
		begin
			DACIO_PD = 0;
			DACIO_DACEN = 1;
		end

		DAC_SHUTDOWN:
		begin
			DACIO_PD = 1;
			DACIO_DACEN = 0;
		end

		default:
		begin
			DACIO_PD = 1;
			DACIO_DACEN = 0;
		end

	endcase
end


always @ (posedge HCLK or negedge HRESETn)
begin
	if (~HRESETn)
	begin
		RF_MODE <= RF_SHUTDOWN;
		ADC_MODE <= ADC_STANDBY;
		DAC_MODE <= DAC_SHUTDOWN;
		radio_mode <= RADIO_OFF;
		turn_cnt <= RXTX_TURN_TIME;
		fifo_ctl_tx_fire <= 0;
		correlator_en <= 0;
		length_int_reg <= 0;
		fifo_tx_cpl_reg <= 0;
		ack_flush <= 0;
		tx_fire_sampled_clear <= 0;
	end
	else
	begin
		RF_MODE <= next_RF_MODE;
		ADC_MODE <= next_ADC_MODE;
		DAC_MODE <= next_DAC_MODE;
		radio_mode <= next_radio_mode;
		turn_cnt <= next_turn_cnt;
		fifo_ctl_tx_fire <= next_fifo_ctl_tx_fire;
		correlator_en <= next_correlator_en;
		length_int_reg <= length_int;
		fifo_tx_cpl_reg <= fifo_tx_cpl;
		ack_flush <= next_ack_flush;
		tx_fire_sampled_clear <= next_tx_fire_sampled_clear;
	end
end

assign ready_to_transmit = (radio_mode==RX_IDLE)? 1 : 0;

always @ *
begin
	next_RF_MODE = RF_MODE;
	next_ADC_MODE = ADC_MODE;
	next_DAC_MODE = DAC_MODE;
	next_radio_mode = radio_mode;
	next_turn_cnt = turn_cnt;
	next_fifo_ctl_tx_fire = 0;
	next_correlator_en = correlator_en;
	next_ack_flush = 0;

	if ((~tx_fire_sampled) & tx_fire_sampled_clear)
		next_tx_fire_sampled_clear = 0;
	else
		next_tx_fire_sampled_clear = tx_fire_sampled_clear;

	case (radio_mode)
		WAIT_FOR_TX_COMPLETE:
		begin
			next_turn_cnt = RXTX_TURN_TIME;
			if (fifo_tx_cpl_reg)
				next_radio_mode = TX_RX_TURNAROUND;
		end

		RX_TX_TURNAROUND:
		begin
			next_correlator_en = 0;
			next_RF_MODE = RF_TX;
			next_ADC_MODE = ADC_STANDBY;
			next_tx_fire_sampled_clear = 1;
			if (turn_cnt==0)
			begin
				if (fifo_ready)
				begin
					next_fifo_ctl_tx_fire = 1;
					next_radio_mode = WAIT_FOR_TX_COMPLETE;
				end
				else
					next_radio_mode = RX_IDLE;
			end
			else
				next_turn_cnt = turn_cnt - 1;
		end

		TX_RX_TURNAROUND:
		begin
			next_turn_cnt = turn_cnt - 1;
			next_RF_MODE = RF_RX;
			next_ADC_MODE = ADC_ON;
			if (turn_cnt==0)
				next_radio_mode = RX_IDLE;
		end

		RX_IDLE:
		begin
			next_turn_cnt = RXTX_TURN_TIME;
			next_correlator_en = 1;
			next_RF_MODE = RF_RX;
			next_ADC_MODE = ADC_ON;
			next_DAC_MODE = DAC_ON;
			if (tx_fire_sampled | auto_tx_reg)
				next_radio_mode = RX_TX_TURNAROUND;
			else if (length_int_reg)	// start listen only if legnth field is correct
				next_radio_mode = RX_COLLECT;
			else if (radio_off)
				next_radio_mode = RADIO_OFF;
		end

		RX_COLLECT:
		begin
			next_DAC_MODE = DAC_SHUTDOWN;
			if (length_int_reg==0)
			begin
				if (ack_glossy)
					next_radio_mode = RX_WAIT_FOR_ACK_GLOSSY;
				else
					next_radio_mode = RX_IDLE;
			end
		end

		RX_WAIT_FOR_ACK_GLOSSY:
		begin
			next_DAC_MODE = DAC_ON;
			next_correlator_en = 0;
			if (ack_flush_reg)
			begin
				next_radio_mode = RX_IDLE;
				next_ack_flush = 1;
			end
			else if (fifo_ctl_sw_tx)	// 2us turnaround is taken care in fifo ctl
				next_radio_mode = RX_WAIT_FOR_ACK_GLOSSY_COMPLETE;
		end

		RX_WAIT_FOR_ACK_GLOSSY_COMPLETE:
		begin
			next_turn_cnt = RXTX_TURN_TIME;
			next_RF_MODE = RF_TX;
			next_ADC_MODE = ADC_STANDBY;
			if (fifo_tx_cpl_reg)
				next_radio_mode = TX_RX_TURNAROUND;
		end

		RADIO_OFF:
		begin
			next_RF_MODE = RF_SHUTDOWN;
			next_ADC_MODE = ADC_STANDBY;
			next_DAC_MODE = DAC_SHUTDOWN;
			next_turn_cnt = RF_WARMUP_TIME;
			next_correlator_en = 0;
			if (~radio_off)
				next_radio_mode = RADIO_WARMUP;
		end

		RADIO_WARMUP:
		begin
			next_RF_MODE = RF_RX;
			next_DAC_MODE = DAC_ON;
			next_ADC_MODE = ADC_ON;
			next_turn_cnt = turn_cnt - 1;
			if (turn_cnt==RXTX_TURN_TIME)
				next_radio_mode = TX_RX_TURNAROUND;
		end

	endcase
end


always @ (posedge HCLK or negedge HRESETn)
begin
	if (~HRESETn)
	begin
		fsm	    <= 2'b00;
		hwrite_reg  <= 1'b0;
		HREADYOUT <= 1;
		HRDATA_reg	<= 0;
		haddr_reg	<= 0;
		ack_en		<= 1;
		led_out		<= 8'hff;
		agc_mode	<= 0;
		ack_flush_reg	<= 0;
		radio_off 	<= 1;
		auto_tx_en<= 0;
		fifo_rst <= 1;
	end
	else
	begin
		case (fsm)
			2'b00:
			begin
				fifo_rst <= 1;
				if (HSEL && HREADY && HTRANS[1] && HSIZE==3'b010 )
				begin
					hwrite_reg	<= HWRITE;
					fsm			<= 2'b01;
					HREADYOUT <= 0;
					haddr_reg	<= HADDR[7:0];
				end
			end

			2'b01:
			begin
				fsm	<= 2'b10;
				case (hwrite_reg)
					1:
					begin
						case (haddr_reg[7:4])
							4'h1:
							begin
								fifo_rst <= 0;
							end

							4'h2:
							begin
								led_out <= (~HWDATA[7:0]);
							end

							4'h5:
							begin
								ack_flush_reg <= HWDATA[0];
							end

							4'h0:
							begin
								radio_off <= HWDATA[0];
								agc_mode <= HWDATA[2:1];
								ack_en <= HWDATA[3];
								auto_tx_en <= HWDATA[8];
							end
						endcase
					end
					
					0:	// read
					begin
						case (haddr_reg[7:4])
							4'h0:	// 0000
							begin
								HRDATA_reg <= {ack_gl_state, auto_tx_en, radio_mode, ack_en, agc_mode, radio_off};
							end

							4'h2:
							begin
								HRDATA_reg <=  {4'b0, ~led_out};
							end

						endcase
					end
				endcase
			end

			2'b10:
			begin
				ack_flush_reg <= 0;
				fsm <= 2'b11;
			end

			2'b11:
			begin
				HREADYOUT <= 1;
				fsm		<= 2'b00;
			end
		endcase
	end
end

endmodule
