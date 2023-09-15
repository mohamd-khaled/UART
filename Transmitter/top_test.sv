module top_test ();
logic       rst_system_t;  
logic       rst_baudgen_t;       
logic       send_t;          
logic       clk_t;         
logic [1:0] parity_type_t;   
logic [1:0] baud_rate_t;     
logic [7:0] data_t; 

logic data_out_t;           
logic parity_out_t; 
logic tx_active_t;       
logic tx_done_t;

uart_top ut(.rst_system(rst_system_t),
.rst_baudgen(rst_baudgen_t),
.send(send_t),
.clk(clk_t),
.parity_type(parity_type_t),
.baud_rate(baud_rate_t),
.data(data_t),
.data_out(data_out_t),
.parity_out(parity_out_t),
.tx_active(tx_active_t),
.tx_done(tx_done_t));

initial begin
    $dumpfile("uarttxTest.vcd");
    $dumpvars;
end

initial begin
    clk_t = 1'b0;
    forever #10 clk_t = ~clk_t;
end

initial begin
    rst_system_t = 1'b1;
#200  rst_system_t = 1'b0;
end

initial begin
    rst_baudgen_t = 1'b1;
#200  rst_baudgen_t = 1'b0;
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
        baud_rate_t = $urandom();
        data_t = $urandom();
    #1354166.671;
    end
end

initial begin
    #3500000 $stop;
end
endmodule