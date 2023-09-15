module sipo_test ();

logic rst_t;
logic data_tx_t;
logic clk_t;

logic [10:0] data_prll_t;
logic        recieved_flag_t;


sipo s1(.rst(rst_t),
.data_tx(data_tx_t),
.clk(clk_t),

.data_prll(data_prll_t),
.recieved_flag(recieved_flag_t));

initial begin
    $dumpfile("sipoTest.vcd");
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
    for (i=0 ; i<50 ; i++)
    begin
        data_tx_t = $urandom();
    #10;
    end
end

initial begin
    #3500000 $stop;
end

endmodule