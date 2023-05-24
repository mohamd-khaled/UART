module piso_test;
reg rst,stop_bits,data_length,send,baud_out;
reg[10:0] frame_out;
reg[1:0] parity_type;
wire p_parity_out,data_out,tx_active,tx_done;
integer i;
piso    shift_U1  (rst, frame_out, parity_type, stop_bits, data_length, send, baud_out, data_out, p_parity_out, tx_active, tx_done);

initial begin
    #10   rst = 1; frame_out = 11'bX; parity_type=00; stop_bits=0; data_length=1; send=1; baud_out=0 ;
    for(i=0;i<22;i=i+1)begin
    #10    rst = 0; frame_out = 11 'b1Z110011010; parity_type=00; stop_bits=0; data_length=1; send=1; baud_out=~baud_out ;
    end
    for(i=0;i<22;i=i+1)begin
    #10    rst = 0; frame_out = 11 'b10110011010; parity_type=10; stop_bits=0; data_length=1; send=1; baud_out=~baud_out ;
    end
    for(i=0;i<22;i=i+1)begin
    #10    rst = 0; frame_out = 11 'b10110001010; parity_type=01; stop_bits=0; data_length=1; send=1; baud_out=~baud_out;
    end
    for(i=0;i<22;i=i+1)begin
    #10    rst = 0; frame_out = 11 'b1Z110011010; parity_type=11; stop_bits=0; data_length=1; send=1; baud_out=~baud_out;
    end
    for(i=0;i<22;i=i+1)begin
    #10   rst = 0; frame_out = 11 'b11110011010; parity_type=00; stop_bits=1; data_length=1; send=1; baud_out=~baud_out;
    end
    for(i=0;i<22;i=i+1)begin
    #10    rst = 0; frame_out = 11'bX; parity_type=10; stop_bits=1; data_length=1; send=1; baud_out=~baud_out;
    end
    for(i=0;i<22;i=i+1)begin
    #10    rst = 0; frame_out = 11'bX; parity_type=01; stop_bits=1; data_length=1; send=1; baud_out=~baud_out;
    end
    for(i=0;i<22;i=i+1)begin
    #10    rst = 0; frame_out = 11 'b11010011010; parity_type=11; stop_bits=1; data_length=1; send=1; baud_out=~baud_out ;
    end
end
initial
 $monitor ($time, ,rst, frame_out, ,parity_type, stop_bits, data_length, baud_out, data_out, p_parity_out, tx_active, tx_done);

endmodule