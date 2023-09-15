module piso	(rst, frame, parity_type, send, clk, data_out, parity_out, tx_active, tx_done);

input logic        rst,clk,send;
input logic [10:0] frame;
input logic [1:0]  parity_type;

output logic parity_out,data_out,tx_active,tx_done;

integer count = 0;


always_ff @(posedge rst, posedge clk) begin
    if (rst) begin
        parity_out = 0;
        data_out = 1;
        tx_active = 0;
        tx_done = 1;
        end
    else begin
        
        if((send == 1) && (frame[0]==0) && (count != 8)) begin
            tx_active <=1;
            tx_done <=0;
            data_out <= frame [count+1];
            parity_out <= frame [9];
            count <= count + 1;
        end

        else begin
            parity_out <= 0;
            data_out <= 1;
            tx_active <= 0;
            tx_done <= 1;
            count=0;
        end
        
    end
end

endmodule