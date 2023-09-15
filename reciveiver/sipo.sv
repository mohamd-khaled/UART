module sipo (rst,data_tx,clk,data_prll,recieved_flag);

input logic rst;
input logic data_tx;
input logic clk;

output logic [10:0] data_prll;
output logic        recieved_flag;

integer i=0;

always_ff @(posedge clk, posedge rst)
begin
    if(rst)
    begin
        data_prll = 11'b0;
        recieved_flag =1'b0;
    end
    else
    begin
        if(data_tx != 0 && i == 0)
        begin
            data_prll = 11'b0;
            recieved_flag =1'b0;
        end 
        else if(data_tx == 0 && i == 0)
        begin
            data_prll[i] = data_tx;
            i = i+1;
            recieved_flag =1'b0;
        end 
        else if(i != 11)
        begin
            data_prll[i] = data_tx;
            i = i+1;
            recieved_flag =1'b0;
        end 
        else
        begin
            recieved_flag =1'b1;
        end
    end
end

endmodule