module uart_tx(
	
	input 		clock, rst, send,
	input [1:0]	baud_rate,
	input [7:0] data_in, 
	input [1:0] parity_type, 	//refer to the block comment above. 
	input 		stop_bits, 		//low when using 1 stop bit, high when using two stop bits
	input 		data_length, 	//low when using 7 data bits, high when using 8.
	
	output wire 	data_out, 		//Serial data_out
	output wire 	p_parity_out, 	//parallel odd parity output, low when using the frame parity.
	output wire 	tx_active, 		//high when Tx is transmitting, low when idle.
	output wire 	tx_done 		//high when transmission is done, low when not.
);

	wire parity_out, baud_out;
	wire [10:0] frame_out;
	

	parity		parity_gen1 (rst, data_in, parity_type, parity_out);
	frame_gen	frame_gen1  (rst, data_in, parity_out, parity_type, stop_bits, data_length, frame_out);
	baud_gen	baud_gen1	(rst, clock, baud_rate, baud_out);
	
	piso		shift_reg1	(rst, frame_out, parity_type, stop_bits, data_length, send, baud_out, data_out, p_parity_out, tx_active, tx_done);
	

endmodule