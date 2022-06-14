`timescale 1ns / 1ps
module I_Block(E_D,bram_clk,Din,T_S,key,Dout);
input                 E_D,bram_clk,T_S;
input    [127:0]      Din,key;
output   [127:0]      Dout;

reg      [31:0]        R0 = 32'h0,R1 = 32'h0,R2 = 32'h0,R3 = 32'h0,
                       R4 = 32'h0,R5 = 32'h0,R6 = 32'h0,R7 = 32'h0,
                       R8 = 32'h0,R9 = 32'h0,R10 = 32'h0,R11 = 32'h0,
                       R12 = 32'h0,R13 = 32'h0,R14 = 32'h0,R15 = 32'h0;
reg      [7:0]        M0 = 8'bZ,M1 = 8'bZ,M2 = 8'bZ,M3 = 8'bZ,M4 = 8'bZ,M5 = 8'bZ,M6 = 8'bZ,M7 = 8'bZ;
wire     [31:0]       DOUTA1,DOUTB1,DOUTA2,DOUTB2,DOUTA3,DOUTB3,DOUTA4,DOUTB4;
reg      [0:0]        cnt=1'b0;


always@(posedge bram_clk)
cnt = cnt+1;

    
 //ST_BOX
              always@(posedge bram_clk)
                begin  M0 <= cnt?Din[127:120]:Din[119:112]; M1 <= cnt?Din[111:104]:Din[103:96];
                       M2 <= cnt?Din[95:88]:Din[87:80];     M3 <= cnt?Din[79:72]:Din[71:64];
                       M4 <= cnt?Din[63:56]:Din[55:48];     M5 <= cnt?Din[47:40]:Din[39:32];
                       M6 <= cnt?Din[31:24]:Din[23:16];     M7 <= cnt?Din[15:8]:Din[7:0]; 
              end                                                                        
              
              blk_mem_gen_0 U1(
                                  .clka(bram_clk),    // input wire clka
                                  .addra({T_S,E_D,M0}),  // input wire [9 : 0] addra
                                  .douta(DOUTA1),  // output wire [31 : 0] douta
                                  .clkb(bram_clk),    // input wire clkb
                                  .addrb({T_S,E_D,M1}),  // input wire [9 : 0] addrb
                                  .doutb(DOUTB1)  // output wire [31 : 0] doutb
                                  );                      
            
              blk_mem_gen_0 U2 (
                                   .clka(bram_clk),    // input wire clka
                                   .addra({T_S,E_D,M2}),  // input wire [9 : 0] addra
                                   .douta(DOUTA2),  // output wire [31 : 0] douta
                                   .clkb(bram_clk),    // input wire clkb
                                   .addrb({T_S,E_D,M3}),  // input wire [9 : 0] addrb
                                   .doutb(DOUTB2)  // output wire [31 : 0] doutb
                                   );                  
              blk_mem_gen_0 U3 (
                                   .clka(bram_clk),    // input wire clka
                                   .addra({T_S,E_D,M4}),  // input wire [9 : 0] addra
                                   .douta(DOUTA3),  // output wire [31 : 0] douta
                                   .clkb(bram_clk),    // input wire clkb
                                   .addrb({T_S,E_D,M5}),  // input wire [9 : 0] addrb
                                   .doutb(DOUTB3)  // output wire [31 : 0] doutb
                                   );          
              blk_mem_gen_0 U4(
                                   .clka(bram_clk),    // input wire clka
                                   .addra({T_S,E_D,M6}),  // input wire [9 : 0] addra
                                   .douta(DOUTA4),  // output wire [31 : 0] douta
                                   .clkb(bram_clk),    // input wire clkb
                                   .addrb({T_S,E_D,M7}),  // input wire [9 : 0] addrb
                                   .doutb(DOUTB4)  // output wire [31 : 0] doutb
                                   ); 
              always @(posedge bram_clk)
                    case (cnt)
                        1'b0: begin                
                        R0 <= DOUTA1;R2 <= DOUTB1; 
                        R4 <= DOUTA2;R6 <= DOUTB2;
                        R8 <= DOUTA3;R10 <= DOUTB3;
                        R12 <= DOUTA4; R14 <= DOUTB4;
                        end 
                        1'b1: begin
                        R1 <= DOUTA1;R3 <= DOUTB1; 
                        R5 <= DOUTA2;R7 <= DOUTB2;
                        R9 <= DOUTA3;R11 <= DOUTB3;
                        R13 <= DOUTA4;R15 <= DOUTB4;
                        end
                        endcase   

a_4 x(.R0(R0),.R1(R1),.R2(R2),.R3(R3),.R4(R4),.R5(R5),.R6(R6),.R7(R7),.R8(R8),.
        R9(R9),.R10(R10),.R11(R11),.R12(R12),.R13(R13),.R14(R14),.R15(R15),.
        key(key),.dout(Dout));
endmodule