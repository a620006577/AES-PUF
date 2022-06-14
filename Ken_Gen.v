module Key_Scd(clk,keyin,key1,key2,key3,key4,key5,key6,key7,key8,key9,key_last,E_D,start);
 input                   E_D;

 input                   clk;
 input                   start;
 output    [127:0]      key_last;
output     [127:0]      key1,key2,key3,key4,key5,key6,key7,key8,key9;
 
input[127:0] keyin;
 
 
 
 wire [127:0] in;
 wire [127:0] keyout,key_de;
 reg [127:0] key_buff[10:0];
 reg [127:0] key10;
 reg en;

 reg [3:0] cnt,i;
 
 
 assign in = (cnt==0) ? keyout : keyin;
 
 Key_Gen k0(.rc(cnt),.key_in(in),.key_out(keyout),.clk(clk));//encryption keys
 Inverse_Mix_Columns inv_col_0(.IN(keyout),.OUT(key_de),.CLK(clk));//decryption keys
 
 always@ (posedge clk)
 begin
 if(!start)
    begin
    cnt <= 0;
    en <=1;
    end
 else if(en)
    begin
    cnt <= cnt + 1;
    if(cnt>9)
       begin
        en=0;
        key10 <= keyout;
        end
     end
 end
 
 always@(posedge clk)
  begin 
    if(!E_D)
    begin 
    key_buff[cnt] <= keyout;
    i <= 1;
    end
    else
    begin
    key_buff[cnt] <= key_de;
    i<= 2;
    end
 end

assign     key1 = key_buff[i+0];
assign     key2 = key_buff[i+1]; 
assign     key3 = key_buff[i+2]; 
assign     key4 = key_buff[i+3];
assign     key5 = key_buff[i+4]; 
assign     key6 = key_buff[i+5]; 
assign     key7 = key_buff[i+6]; 
assign     key8 = key_buff[i+7];
assign     key9 = key_buff[i+8];
assign     key_last= key10;

endmodule

module Key_Gen(rc,key_in,key_out,clk);//rc denote round number;
input          [127:0]  key_in;
input          [3:0]    rc;
input                   clk;

output    reg  [127:0]  key_out =0;
wire           [31:0]   w0,w1,w2,w3,tem;
reg [31:0] rcon;

       s_box a1(.a(w3[23:16]),.d(tem[31:24]));
       s_box a2(.a(w3[15:8]),.d(tem[23:16]));
       s_box a3(.a(w3[7:0]),.d(tem[15:8]));
       s_box a4(.a(w3[31:24]),.d(tem[7:0]));
      

       assign w3 = key_in[31:0];
       assign w2 = key_in[63:32];
       assign w1 = key_in[95:64];
       assign w0 = key_in[127:96];
    
       always@(posedge clk)begin key_out[127:96] <= w0^tem^rcon;
                                 key_out[95:64]  <= w0^tem^rcon^w1;
                                 key_out[63:32]  <= w0^tem^rcon^w1^w2;
                                 key_out[31:0]   <= w0^tem^rcon^w1^w2^w3;
                            end
        
        always@(posedge clk)
        case(rc)
        4'd0: rcon = 32'h02_00_00_00;
        4'd1: rcon = 32'h04_00_00_00;
        4'd2: rcon = 32'h08_00_00_00;
        4'd3: rcon = 32'h10_00_00_00;
        4'd4: rcon = 32'h20_00_00_00;
        4'd5: rcon = 32'h40_00_00_00;
        4'd6: rcon = 32'h80_00_00_00;
        4'd7: rcon = 32'h1b_00_00_00;
        4'd8: rcon = 32'h36_00_00_00;
        default: rcon=32'h01_00_00_00;
        endcase 
     
         
  endmodule
