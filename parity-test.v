module parity_test;
    reg rst;
    reg [7:0] data_in;
    reg [1:0] parity_type;
    wire  parity_out;

parity		parity_U1 (rst, data_in, parity_type, parity_out);

initial begin
    #10 rst = 1; data_in = 11001100; parity_type=00;
    #10 rst = 0; data_in = 11001100; parity_type=00;
    #10 rst = 0; data_in = 11001100; parity_type=10;
    #10 rst = 0; data_in = 11001100; parity_type=01;
    #10 rst = 0; data_in = 11001101; parity_type=11;
    #10 rst = 0; data_in = 11001101; parity_type=00;
    #10 rst = 0; data_in = 11001101; parity_type=10;
    #10 rst = 0; data_in = 11001101; parity_type=01;
    #10 rst = 0; data_in = 11001101; parity_type=11;
end
initial
 $monitor ($time, ,rst, data_in, ,parity_type, parity_out);

endmodule