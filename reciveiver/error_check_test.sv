module errorch_test();

logic [7:0] data_t;
logic       rst_t;
logic       start_bit_t;
logic       stop_bit_t;
logic       parity_bit_t;
logic [1:0] parity_type_t;
logic       recieved_flag_t;

logic [2:0] error_flag_t;

errorch er(.rst(rst_t),
.data(data_t),
.start_bit(start_bit_t),
.stop_bit(stop_bit_t),
.parity_bit(parity_bit_t),
.parity_type(parity_type_t),
.recieved_flag(recieved_flag_t),

.error_flag(error_flag_t));

initial
begin
    $dumpfile("errorchecktest.vcd");
    $dumpvars;
end

initial begin
    rst_t = 1'b1;
#100  rst_t = 1'b0;
end

integer i = 0;

initial begin
    for (i=0 ; i<50 ; i++)
    begin
        data_t = $urandom();
        start_bit_t = $urandom();
        stop_bit_t = $urandom();
        parity_bit_t = $urandom();
        parity_type_t = $urandom();
        recieved_flag_t = $urandom();
    #1000;
    end
end

initial begin
    #3500000 $stop;
end



endmodule

