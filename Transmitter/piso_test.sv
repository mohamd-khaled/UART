module piso_test ();
logic        rst_t,clk_t,send_t;
logic [10:0] frame_t;
logic [1:0]  parity_type_t;
logic        parity_out_t,data_out_t,tx_active_t,tx_done_t;

piso p1(.rst(rst_t), 
.frame(frame_t), 
.parity_type(parity_type_t), 
.send(send_t), 
.clk(clk_t), 
.data_out(data_out_t), 
.parity_out(parity_out_t), 
.tx_active(tx_active_t), 
.tx_done(tx_done_t));


initial begin
    $dumpfile("pisoTest.vcd");
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

initial begin
    send_t = 1'b0;
#300  send_t = 1'b1;
end

integer i = 0;

initial begin
    for (i=0 ; i<10 ; i++)
    begin
        parity_type_t = $urandom();
        frame_t = $urandom();
    #1000;
    end
end

initial begin
    #3500000 $stop;
end

endmodule