module deframe_test();

logic [10:0] data_parll_t;

logic [7:0] data_out_t;
logic       parity_bit_t;
logic       start_bit_t;
logic       stop_bit_t;
logic       done_flag_t;

//  Design module instance
deframe df(
.data_parll(data_parll_t),

.parity_bit(parity_bit_t),
.start_bit(start_bit_t),
.stop_bit(stop_bit_t),
.done_flag(done_flag_t),
.data_out(data_out_t)
);


initial
begin
    $dumpfile("DeFrameTest.vcd");
    $dumpvars;
end

integer i = 0;

initial begin
    for (i=0 ; i<50 ; i++)
    begin
        data_parll_t = $urandom();
    #1000;
    end
end

initial begin
    #3500000 $stop;
end

endmodule