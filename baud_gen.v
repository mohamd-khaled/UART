module baud_gen (rst,clock, baud_rate, baud_out);
input rst,clock;
input  [1:0] baud_rate;
output reg baud_out =0;
reg [10:0] count = 0;
reg [10:0] mod;
always @(posedge clock ) begin
    if(rst == 1)
    baud_out=0;
    else begin
    case (baud_rate)
        2'b00:
        begin
            mod = 1302;
        end
        2'b01:
        begin
            mod = 651;
        end
        2'b10:
        begin
            mod = 326;
        end
        2'b11:
        begin
            mod = 163;
        end
    endcase
    if(count==mod)
    begin
    count=0;
    baud_out<=~baud_out;
    end
    else
    begin
    count=count+1;
    baud_out<=baud_out;
    end
    end
end
    
endmodule