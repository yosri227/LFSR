`timescale 1us/1ns // time scale 

module LF_SR_tb ();
  
  // all design inputs are defined in testbench as reg to be used inside initial block 
// all design outputs are defined in testbench as wire   
 reg           clk_tb;
 reg           rest_tb;
 reg     [3:0] seed_tb;
 wire          out_tb;
 wire          vaild_tb;


initial 
begin 
  $dumpfile("LF_SR.vcd");
  $dumpvars ;
// INITIAL VALUES
clk_tb=1'b0;
rest_tb=1'b0;
seed_tb=4'b1110;
$display ("test case");
#1.3
rest_tb=1'b1;

#20
$finish;
end
// Clock Generator  
  always #0.5 clk_tb = !clk_tb ;
  
  // PORT MAPPING
  LF_SR DUT (
.clk(clk_tb),
.rest(rest_tb),
.seed(seed_tb),
.out(out_tb),
.vaild(vaild_tb)
);

endmodule   


