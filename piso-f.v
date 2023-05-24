module piso	(rst, frame_out, parity_type, stop_bits, data_length, send, baud_out, data_out, p_parity_out, tx_active, tx_done);
input rst,stop_bits,data_length,send,baud_out;
input[10:0] frame_out;
input[1:0] parity_type;
output reg p_parity_out,data_out,tx_active,tx_done;
reg [10:0] frame_o;
reg [3:0] i,length;

always @(data_length,posedge baud_out) begin
    case (data_length)
       1'b1 :  length<=11;
        default: length<=10; 
    endcase
end

always @(posedge parity_type,posedge baud_out,posedge rst) begin
    if (rst==1) begin
        p_parity_out<=0;
        tx_active<=0;
        tx_done<=1;
    end
    else
    begin
        if (send==1) begin
            frame_o<=frame_out;
            i<=0;
            case (parity_type)
            2'b11 :
                if(length==11) begin
                    p_parity_out<=~(frame_o[1]^ frame_o[2]^ frame_o[3]^ frame_o[4]^ frame_o[5]^ frame_o[6]^ frame_o[7]^ frame_o[8]); 
                end
                else begin
                    p_parity_out<=~(frame_o[1]^ frame_o[2]^ frame_o[3]^ frame_o[4]^ frame_o[5]^ frame_o[6]^ frame_o[7]); 
                end
            default: p_parity_out<=0;
            endcase
            if(i<length) begin
                tx_active<=1;
                tx_done<=0;
                data_out<=frame_o[i];
                i<=i+1;
            end
            else begin
                tx_active<=0;
                tx_done<=1;
            end
        end
    end
end
endmodule