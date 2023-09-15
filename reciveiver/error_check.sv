module errorch(rst,data,start_bit,stop_bit,parity_bit,parity_type,recieved_flag,error_flag);

input logic [7:0] data;
input logic       rst;
input logic       start_bit;
input logic       stop_bit;
input logic       parity_bit;
input logic [1:0] parity_type;
input logic       recieved_flag;

output logic [2:0] error_flag;

logic parity_out;
logic parity_flag;
logic start_flag;
logic stop_flag;

always @(*) begin
    case (parity_type)
        2'b00:  parity_out=1'bX; //no parity

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

        2'b11: parity_out=1'bX; //no parity

        default: parity_out=1; //no parity
    endcase
end

always @(*) begin
    parity_flag  = ~(parity_out == parity_bit);
    start_flag   = (start_bit || 1'b0);
    stop_flag    = ~(stop_bit && 1'b1);

end

always @(*) begin
    if (rst && !recieved_flag) 
    begin
        error_flag=3'b0;
    end
    else if (!recieved_flag) 
    begin
        error_flag=3'b0;
    end
    else 
    begin
        error_flag ={stop_flag,start_flag,parity_flag};
    end
end

endmodule