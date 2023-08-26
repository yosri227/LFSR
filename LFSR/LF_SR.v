module LF_SR #(parameter wid=4)
  (
input                 clk,
input                 rest,
input  wire [wid-1:0] seed,
output reg            out,
output reg            vaild
);
  
reg [wid-1:0] LFSR; // declare R 4_bit register 
 
reg [wid-1:0]  counter;
//reg [2:0]      mov_bit;
wire       counter_finish;
//wire       mov_done;
integer N;
integer w;
wire feedback;
assign feedback= ^LFSR[wid-2:0];


// for lfsr operation
always@(posedge clk or negedge rest)
begin
if(!rest)
  begin
 LFSR<=seed;
 vaild<=1'b0;
 out<='b0;
  end
else if(!counter_finish)
  begin
        out<='b0;
        vaild<=1'b0;
        LFSR[3]<=feedback;
         for(N=0;N<3;N=N+1)
          LFSR[N]<=LFSR[N+1];
  end
    else 
      begin
        out<=LFSR[0];
        vaild<=1'b1;
          for (w=0;w<3;w=w+1)
            begin
              LFSR[w]=LFSR[w+1];
            end
end
end

// for counting 8 cycles 

always@(posedge clk or negedge rest)
begin
if(!rest)
  begin
  counter<=4'b0;
  end
else if(!counter_finish)
   begin 
   counter<=counter+4'b1;
    end
 else 
   begin
  counter<=counter;
   end   
end
assign counter_finish=(counter==4'b1000)?1'b1:1'b0;


endmodule 
