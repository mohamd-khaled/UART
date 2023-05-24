module UART_test;
	reg 		clock, rst, send;
	reg [1:0]	buad_rate;
	reg [7:0] data_in;
	reg [1:0] parity_type;
	reg 		stop_bits;
	reg 		data_length;
	
	wire 	data_out;
	wire 	p_parity_out; 
	wire 	tx_active;
	wire 	tx_done;

uart_tx  uart_U1(clock, rst, send, buad_rate, data_in, parity_type, stop_bits, data_length, data_out, p_parity_out, tx_active, tx_done);

initial begin
    #20   rst = 1; data_in = 11001101; parity_type=00; stop_bits=0; data_length=1; send=1; buad_rate=00; clock=0 ;
    // buad_rate=00
    for(i=0;i<7812;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=00; stop_bits=0; data_length=1; send=1; buad_rate=00; clock=~clock;
    end
    for(i=0;i<7812;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=01; stop_bits=0; data_length=1; send=1; buad_rate=00; clock=~clock;
    end
    for(i=0;i<7812;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=10; stop_bits=0; data_length=1; send=1; buad_rate=00; clock=~clock;
    end
    for(i=0;i<7812;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=11; stop_bits=0; data_length=1; send=1; buad_rate=00; clock=~clock;
    end
    for(i=0;i<7812;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=00; stop_bits=1; data_length=1; send=1; buad_rate=00; clock=~clock;
    end
    for(i=0;i<7812;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=01; stop_bits=1; data_length=1; send=1; buad_rate=00; clock=~clock;
    end
    for(i=0;i<7812;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=10; stop_bits=1; data_length=1; send=1; buad_rate=00; clock=~clock;
    end
    for(i=0;i<7812;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=11; stop_bits=1; data_length=1; send=1; buad_rate=00; clock=~clock;
    end
    // buad_rate=01
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=00; stop_bits=0; data_length=1; send=1; buad_rate=01; clock=~clock;
    end
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=01; stop_bits=0; data_length=1; send=1; buad_rate=01; clock=~clock;
    end    
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=10; stop_bits=0; data_length=1; send=1; buad_rate=01; clock=~clock;
    end    
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=11; stop_bits=0; data_length=1; send=1; buad_rate=01; clock=~clock;
    end    
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=00; stop_bits=1; data_length=1; send=1; buad_rate=01; clock=~clock;
    end    
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=01; stop_bits=1; data_length=1; send=1; buad_rate=01; clock=~clock;
    end    
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=10; stop_bits=1; data_length=1; send=1; buad_rate=01; clock=~clock;
    end    
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=11; stop_bits=1; data_length=1; send=1; buad_rate=01; clock=~clock;
    end
    // buad_rate=10
    for(i=0;i<1956;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=00; stop_bits=0; data_length=1; send=1; buad_rate=10; clock=~clock;
    end
    for(i=0;i<1956;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=01; stop_bits=0; data_length=1; send=1; buad_rate=10; clock=~clock;
    end
    for(i=0;i<1956;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=10; stop_bits=0; data_length=1; send=1; buad_rate=10; clock=~clock;
    end
    for(i=0;i<1956;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=11; stop_bits=0; data_length=1; send=1; buad_rate=10; clock=~clock;
    end
    for(i=0;i<1956;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=00; stop_bits=1; data_length=1; send=1; buad_rate=10; clock=~clock;
    end
    for(i=0;i<1956;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=01; stop_bits=1; data_length=1; send=1; buad_rate=10; clock=~clock;
    end
    for(i=0;i<1956;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=10; stop_bits=1; data_length=1; send=1; buad_rate=10; clock=~clock;
    end
    for(i=0;i<1956;i=i+1)begin
    #20   rst = 0; data_in = 11001101; parity_type=11; stop_bits=1; data_length=1; send=1; buad_rate=10; clock=~clock;
    end
    // buad_rate=11
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=00; stop_bits=0; data_length=1; send=1; buad_rate=11; clock=~clock;
    end
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=01; stop_bits=0; data_length=1; send=1; buad_rate=11; clock=~clock;
    end    
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=10; stop_bits=0; data_length=1; send=1; buad_rate=11; clock=~clock;
    end    
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=11; stop_bits=0; data_length=1; send=1; buad_rate=11; clock=~clock;
    end    
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=00; stop_bits=1; data_length=1; send=1; buad_rate=11; clock=~clock;
    end    
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=01; stop_bits=1; data_length=1; send=1; buad_rate=11; clock=~clock;
    end    
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=10; stop_bits=1; data_length=1; send=1; buad_rate=11; clock=~clock;
    end    
    for(i=0;i<3906;i=i+1)begin
    #20   rst = 0; data_in = 11001001; parity_type=11; stop_bits=1; data_length=1; send=1; buad_rate=11; clock=~clock;
    end
end
initial
 $monitor ($time, ,clock, rst, ,send, buad_rate, data_in, parity_type, stop_bits, data_length, data_out, p_parity_out, tx_active, tx_done);

endmodule