module parity(rst,data,parity_type,parity_out);

input logic       rst;
input logic [7:0] data;
input logic [1:0] parity_type;

output logic parity_out;

always @(*) begin
    if (rst) begin
        parity_out=1;
    end
    else begin
    case (parity_type)
        2'b00:  parity_out=1; //no parity

        2'b10:begin //odd parity
            if(^data)
                parity_out=0;
            else
                parity_out=1;
        end

        2'b01:begin //even parity
            if(^data)
                parity_out=1;
            else
                parity_out=0;
        end

        2'b11:begin  //odd parity but not added
            if(^data)
                parity_out=0;
            else
                parity_out=1;
            end 

        default: parity_out=1; //no parity
    endcase
    end
end

endmodule