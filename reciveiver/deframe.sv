
module deframe(data_parll,recieved_flag,parity_bit,start_bit,stop_bit,done_flag,data_out);
input logic [10:0] data_parll;
input logic        recieved_flag;

output logic [7:0] data_out;
output logic       parity_bit;
output logic       start_bit;
output logic       stop_bit;
output logic       done_flag;

always @(*) 
begin
  start_bit = data_parll[0];
  data_out = data_parll[8:1];
  parity_bit = data_parll[9];
  stop_bit = data_parll[10];
  done_flag = recieved_flag;
end

endmodule