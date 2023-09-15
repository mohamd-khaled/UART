module frame_gen (data,parity_out,parity_type,frame_out);

input logic [7:0] data; 
input logic       parity_out;
input logic [1:0] parity_type;

output reg [10:0] frame_out;

always @(*) begin
    case(parity_type)
    // without parity bit & 1 stop bits
        2'b00:
        begin
        frame_out = {1'b1,1'bx,data,1'b0};
        end
        3'b11:
        begin
        frame_out = {1'b1,1'bx,data,1'b0};
        end
    // with parity bit & 1 stop bits
        3'b01:
        begin
        frame_out = {1'b1,parity_out,data,1'b0};
        end
        3'b10:
        begin
        frame_out = {1'b1,parity_out,data,1'b0};
        end
        default: frame_out = 11'bX;
    endcase
end
endmodule