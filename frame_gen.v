module frame_gen (
    input rst, 
    input [7:0] data_in, 
    input parity_out, 
    input [1:0] parity_type, 
    input stop_bits, 
    input data_length, 
    output reg [10:0] frame_out
);
always @(*) begin
    if ( rst == 1) begin
        frame_out = 11'b0;
    end
    else
    case({stop_bits,parity_type})
    // without parity bit & 2 stop bits
        3'b100:
        begin
        frame_out = {1'b1,1'b1,data_in,1'b0};
        end
        3'b111:
        begin
        frame_out = {1'b1,1'b1,data_in,1'b0};
        end
    // with parity bit & 1 stop bits
        3'b001:
        begin
        frame_out = {1'b1,parity_out,data_in,1'b0};
        end
        3'b010:
        begin
        frame_out = {1'b1,parity_out,data_in,1'b0};
        end
    // without parity bit & 1 stop bits 
        3'b000:
        begin
        frame_out = {1'b1,1'bz,data_in,1'b0};
        end
        3'b011:
        begin
        frame_out = {1'b1,1'bz,data_in,1'b0};
        end
        default: frame_out = 11'bX;
    endcase
end
endmodule