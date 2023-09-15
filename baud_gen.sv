module baud_gen(rst,clk,baud_rate,baud_out);

input logic       rst;
input logic       clk;
input logic [1:0] baud_rate;

output logic baud_out;

logic [11:0] final_value;
logic [11:0] count=12'd0;

always @(*)
begin
    case (baud_rate)
        //the values for clk = 50MHz
        2'b00 : final_value = 12'd1303;  //  ratio ticks for the 2400 BaudRate.
        2'b01 : final_value = 12'd325;   //  ratio ticks for the 4800 BaudRate.
        2'b10 : final_value = 12'd162;   //  ratio ticks for the 9600 BaudRate.
        2'b11 : final_value = 12'd64;  //  ratio ticks for the 19200 BaudRate.
        default: final_value = 12'd162;      //  The common baud rate 9600
    endcase
end

always @(posedge clk,posedge rst)
begin
    if(rst) begin
        final_value = 12'd0;
        baud_out = 1'b0;
    end
    else begin
        if(count == final_value)
        begin
            count = 12'd0;
            baud_out = ~baud_out;
        end
        else
        begin
            count = count + 1;
            baud_out = baud_out;
        end
    end

end
endmodule