module parity_test();
logic       rst_t;
logic [7:0] data_t;
logic [1:0] parity_type_t;
logic       parity_out_t;

parity p(.rst(rst_t),
.data(data_t),
.parity_type(parity_type_t),
.parity_out(parity_out_t));

initial begin
    $dumpfile("parityTest.vcd");
    $dumpvars;
end


initial begin
    rst_t = 1'b1;
#100  rst_t = 1'b0;
end

integer i = 0;

initial begin
    for (i=0 ; i<10 ; i++)
    begin
        data_t = $urandom();
        parity_type_t = $urandom();
    #1000;
    end
end

initial begin
    #3500000 $stop;
    // Simulation for 4 ms
end

endmodule