
module uart_top(rst_system,rst_baudgen,send,clk,parity_type,baud_rate,data,data_out,parity_out,tx_active,tx_done);

input logic rst_system;  
input logic rst_baudgen;     
input logic send;          
input logic clk;         
input logic [1:0] parity_type;   
input logic [1:0] baud_rate;     
input logic [7:0] data; 

output logic data_out;           
output logic parity_out; 
output logic tx_active;       
output logic tx_done;           

//  Interconnections
logic parity_out_w;
logic baud_out_w;
logic [10:0] frame_out_w;

//  Baud generator unit
baud_gen unit1(
    .rst(rst_baudgen),
    .clk(clk),
    .baud_rate(baud_rate),
    
    .baud_out(baud_out_w)
);

//Parity unit 
parity unit2(.rst(rst_system),
.data(data),
.parity_type(parity_type),

.parity_out(parity_out_w));

//fare generator unit 
frame_gen unit3(
    .data(data),
    .parity_out(parity_out_w),
    .parity_type(parity_type),

    .frame_out(frame_out_w)
);
 
//parallel in serios out unit 
piso unit4(
    .rst(rst_system), 
    .frame(frame_out_w), 
    .parity_type(parity_type), 
    .send(send), 
    .clk(baud_out_w), 

    .data_out(data_out), 
    .parity_out(parity_out), 
    .tx_active(tx_active), 
    .tx_done(tx_done)
);


endmodule