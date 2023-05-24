module baud_gen_tset;
reg rst,clock;
reg  [1:0] baud_rate;
wire baud_out =0;
integer i;

baud_gen baud_U1(rst, clock, baud_rate, baud_out);

initial
begin
    #20 rst = 1; clock = 0; baud_rate=00;
    for(i=0;i<7812;i=i+1)begin
    #20 rst = 0; clock = ~clock; baud_rate=00;
    end
    for(i=0;i<3906;i=i+1)begin
    #20 rst = 0; clock = ~clock; baud_rate=01;
    end
    for(i=0;i<1956;i=i+1)begin
    #20 rst = 0; clock = ~clock; baud_rate=10;
    end
    for(i=0;i<978;i=i+1)begin
    #20 rst = 0; clock = ~clock; baud_rate=11;
    end
end
initial
 $monitor ($time, ,rst, clock, ,baud_rate, baud_out);

endmodule