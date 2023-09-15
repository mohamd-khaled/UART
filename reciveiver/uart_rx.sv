module uart_rx(rst_system,rst_baudgen,data_tx,clk,parity_type,baud_rate,done_flag,error_flag,data_out);

input logic       rst_system;
input logic       rst_baudgen;    
input logic       data_tx;     
input logic       clk;  
input logic [1:0] parity_type; 
input logic [1:0] baud_rate; 

output logic       done_flag;
output logic [2:0] error_flag;
output logic [7:0] data_out;

logic        baud_clk_w; 
logic [10:0] data_parll_w;
logic        recieved_flag_w;
logic        parity_bit_w;
logic        start_bit_w;
logic        stop_bit_w;

baud_gen_rx unit1(.rst(rst_baudgen),
.clk(clk),
.baud_rate(baud_rate),

.baud_out(baud_clk_w));

sipo unit2(.rst(rst_system),
.data_tx(data_tx),
.clk(baud_clk_w),

.data_prll(data_parll_w),
.recieved_flag(recieved_flag_w));

deframe unit3(.data_parll(data_parll_w),
.recieved_flag(recieved_flag_w),

.parity_bit(parity_bit_w),
.start_bit(start_bit_w),
.stop_bit(stop_bit_w),
.done_flag(done_flag),
.data_out(data_out));

errorch unit4(.rst(rst_system),
.data(data_out),
.start_bit(start_bit_w),
.stop_bit(stop_bit_w),
.parity_bit(parity_bit_w),
.parity_type(parity_type),
.recieved_flag(recieved_flag_w),

.error_flag(error_flag));

endmodule