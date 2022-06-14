`timescale 1ns / 1ps
module AES_EN(Din,Dout,Key_in,clkin,E_D,start);
input     clkin,E_D,start;
input     [127:0]  Din, Key_in;
output    [127:0]  Dout;


wire      [127:0] dout1,dout2,dout3,dout4,dout5,dout6,dout7,dout8,dout9;
wire      bram_clk,clk0;
reg       [127:0] initial_round,round1,round2,round3,round4,round5,round6,round7,round8,round9;
wire      [127:0] dout1_s,dout2_s,dout3_s,dout4_s,dout5_s,dout6_s,dout7_s,dout8_s,dout9_s,dout_s;
wire              locked;
wire      [127:0] key0,key1,key2,key3,key4,key5,key6,key7,key8,key9;
reg       [127:0] i_key,i_key0,i_key1,i_key2,i_key3,i_key4,i_key5,i_key6,i_key7,i_key8,i_key9;
clk_wiz_0 clocking
   (
    // Clock out ports
    .clk0(clk0),     // output clk0
    .bram_clk(bram_clk),     // output bram_clk
    // Status and control signals
    .locked(locked),       // output locked
   // Clock in ports
    .clkin(clkin));      // input clkin
Key_Scd key_gen_10(.keyin(Key_in),.key1(key0),.key2(key1),.key3(key2),.key4(key3),.key5(key4),.
                   key6(key5),.key7(key6),.key8(key7),.key9(key8),.key_last(key9),.clk(clk0),.E_D(E_D),.start(start));
//initial 
always@( clk0 )begin 
    if (start&(!locked))
    begin
    initial_round<=128'h0;round1<=128'h0;round2<=128'h0;round3<=128'h0;round4<=128'h0;
    round5<=128'h0;round6<=128'h0;round7<=128'h0;round8<=128'h0;round9<=128'h0;
    end
    else 
    begin
    initial_round<=Din ^ i_key; //Initial AddRoundKey
    round1<=dout1;round2<=dout2;
    round3<=dout3;round4<=dout4;
    round5<=dout5;round6<=dout6;
    round7<=dout7;round8<=dout8;
    round9<=dout9;
    end
    end

    always@(posedge clk0)
    begin
    if(!E_D)
    begin 
      i_key<=Key_in;i_key0<=key0;i_key1<=key1;i_key2<=key2;i_key3<=key3;
      i_key4<=key4;i_key4<=key4;i_key5<=key5;i_key6<=key6;i_key7<=key7;
      i_key8<=key8;i_key9<=key9;
      end
    else begin
      i_key<=key9;i_key0<=key8;i_key1<=key7;i_key2<=key6;i_key3<=key5;
      i_key4<=key4;i_key5<=key3;i_key6<=key2;i_key7<=key1;i_key8<=key0;
      i_key9<=Key_in;
    end
    end
//round 1
Shift_Rows S1(.E_D(E_D),.Din(initial_round),.clk(clk0),.Dout(dout1_s));
I_Block    I1(.E_D(E_D),.Din(dout1_s),.bram_clk(bram_clk),.T_S(1'b0),.key(i_key0),.Dout(dout1));
//round 2
Shift_Rows S2(.E_D(E_D),.Din(round1),.clk(clk0),.Dout(dout2_s));
I_Block    I2(.E_D(E_D),.Din(dout2_s),.bram_clk(bram_clk),.T_S(1'b0),.key(i_key1),.Dout(dout2));
//round 3
Shift_Rows S3(.E_D(E_D),.Din(round2),.clk(clk0),.Dout(dout3_s));
I_Block    I3(.E_D(E_D),.Din(dout3_s),.bram_clk(bram_clk),.T_S(1'b0),.key(i_key2),.Dout(dout3));
//round 4
Shift_Rows S4(.E_D(E_D),.Din(round3),.clk(clk0),.Dout(dout4_s));
I_Block    I4(.E_D(E_D),.Din(dout4_s),.bram_clk(bram_clk),.T_S(1'b0),.key(i_key3),.Dout(dout4));
//round 5
Shift_Rows S5(.E_D(E_D),.Din(round4),.clk(clk0),.Dout(dout5_s));
I_Block    I5(.E_D(E_D),.Din(dout5_s),.bram_clk(bram_clk),.T_S(1'b0),.key(i_key4),.Dout(dout5));
//round 6
Shift_Rows S6(.E_D(E_D),.Din(round5),.clk(clk0),.Dout(dout6_s)); 
I_Block    I6(.E_D(E_D),.Din(dout6_s),.bram_clk(bram_clk),.T_S(1'b0),.key(i_key5),.Dout(dout6));
//round 7
Shift_Rows S7(.E_D(E_D),.Din(round6),.clk(clk0),.Dout(dout7_s));
I_Block    I7(.E_D(E_D),.Din(dout7_s),.bram_clk(bram_clk),.T_S(1'b0),.key(i_key6),.Dout(dout7));
//round 8
Shift_Rows S8(.E_D(E_D),.Din(round7),.clk(clk0),.Dout(dout8_s)); 
I_Block    I8(.E_D(E_D),.Din(dout8_s),.bram_clk(bram_clk),.T_S(1'b0),.key(i_key7),.Dout(dout8));
//round 9
Shift_Rows S9(.E_D(E_D),.Din(round8),.clk(clk0),.Dout(dout9_s));
I_Block    I9(.E_D(E_D),.Din(dout9_s),.bram_clk(bram_clk),.T_S(1'b0),.key(i_key8),.Dout(dout9));
//round 10
Shift_Rows S10(.E_D(E_D),.Din(round9),.clk(clk0),.Dout(dout_s));
I_Block    I10(.E_D(E_D),.Din(dout_s),.bram_clk(bram_clk),.T_S(1'b1),.key(i_key9),.Dout(Dout));

endmodule
