module parity (
    input rst,
    input [7:0] data_in,
    input [1:0] parity_type,
    output reg  parity_out
);

always @(rst or parity_type or data_in) begin
    if (rst == 1) begin
        parity_out = 0;
    end
    else
    begin
        case (parity_type)
           2'b00:
             begin
               parity_out = 0;
             end
           2'b01:
             begin
               parity_out = ~(data_in[0]^ data_in[1]^ data_in[2]^ data_in[3]^ data_in[4]^ data_in[5]^ data_in[6]^ data_in[7]);
             end
           2'b10:
             begin
               parity_out = data_in[0]^ data_in[1]^ data_in[2]^ data_in[3]^ data_in[4]^ data_in[5]^ data_in[6]^ data_in[7];
             end 
             2'b11:
             begin
               parity_out = ~(data_in[0]^ data_in[1]^ data_in[2]^ data_in[3]^ data_in[4]^ data_in[5]^ data_in[6]^ data_in[7]);
             end 
             default : parity_out = 1'bZ;

        endcase
    end              
end
    
endmodule