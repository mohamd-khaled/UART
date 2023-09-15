module baud_gen_test();
logic       rst_t;
logic       clk_t;
logic [1:0] baud_rate_t;
logic       baud_out_t;

baud_gen unit1
(.rst(rst_t),
.clk(clk_t),
.baud_rate(baud_rate_t),
.baud_out(baud_out_t));

initial begin
    $dumpfile("BaudTest.vcd");
    $dumpvars;
end

initial begin
    clk_t = 1'b0;
    forever #10 clk_t = ~clk_t;
end

initial begin
    rst_t = 1'b1;
#100  rst_t = 1'b0;
end

integer i = 0;

initial begin
    for (i=0 ; i<10 ; i++)
    begin
        baud_rate_t = $urandom();
        #(1680000/(i+1));
    end
end

//  Stop
initial begin
#3500000 $stop;
// Simulation for 4 ms
end
endmodule