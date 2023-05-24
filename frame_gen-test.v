module frame_gen_test;
    reg rst;
    reg [7:0] data_in; 
    reg parity_out; 
    reg [1:0] parity_type;
    reg stop_bits;
    reg data_length; 
    wire [10:0] frame_out;

frame_gen	frame_U1  (rst, data_in, parity_out, parity_type, stop_bits, data_length, frame_out);
initial begin
    #10 rst = 1; data_in = 11001100; parity_type=00; parity_out=0;  stop_bits=0; data_length=1;
    #10 rst = 0; data_in = 11001100; parity_type=00; parity_out=0;  stop_bits=0; data_length=1;
    #10 rst = 0; data_in = 11001100; parity_type=10; parity_out=1;  stop_bits=0; data_length=1;
    #10 rst = 0; data_in = 11001100; parity_type=01; parity_out=0;  stop_bits=0; data_length=1;
    #10 rst = 0; data_in = 11001100; parity_type=11; parity_out=1;  stop_bits=0; data_length=1;
    #10 rst = 0; data_in = 11001100; parity_type=00; parity_out=0;  stop_bits=1; data_length=1;
    #10 rst = 0; data_in = 11001100; parity_type=10; parity_out=1;  stop_bits=1; data_length=1;
    #10 rst = 0; data_in = 11001100; parity_type=01; parity_out=0;  stop_bits=1; data_length=1;
    #10 rst = 0; data_in = 11001100; parity_type=11; parity_out=1;  stop_bits=1; data_length=1;
end
initial
 $monitor ($time, ,rst, data_in, ,parity_type, parity_out, stop_bits, data_length, frame_out);

endmodule