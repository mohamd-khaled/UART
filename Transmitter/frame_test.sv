module frame_gen_test ();
logic [7:0]  data_t;
logic        parity_out_t;
logic [1:0]  parity_type_t;
logic [10:0] frame_out_t;

frame_gen fg(.data(data_t),
.parity_out(parity_out_t),
.parity_type(parity_type_t),
.frame_out(frame_out_t));

initial begin
    $dumpfile("frameTest.vcd");
    $dumpvars;
end

integer i = 0;

initial begin
    for (i=0 ; i<10 ; i++)
    begin
        data_t = $urandom();
        parity_type_t = $urandom();

        case (parity_type_t)
        2'b00:  parity_out_t=1; //no parity

        2'b10:begin //odd parity
            if(^data_t)
                parity_out_t=0;
            else
                parity_out_t=1;
        end

        2'b01:begin //even parity
            if(^data_t)
                parity_out_t=1;
            else
                parity_out_t=0;
        end

        2'b11:begin  //odd parity but not added
            if(^data_t)
                parity_out_t=0;
            else
                parity_out_t=1;
            end 

        default: parity_out_t=1; //no parity
    endcase        
    #1000;
    end
end

initial begin
    #3500000 $stop;
    // Simulation for 4 ms
end

endmodule