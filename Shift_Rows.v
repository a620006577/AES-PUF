`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/08 14:33:59
// Design Name: 
// Module Name: Shift_Rows
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module Shift_Rows(E_D,clk,Din,Dout);
input                  E_D,clk;
input         [127:0]  Din;
output        [127:0]  Dout;
reg           [7:0]    din00,din10,din20,din30,din01,din11,din21,din31,din02,din12,din22,din32,din03,din13,din23,din33;

always@(posedge clk)
  begin
    din00 <= Din[127:120];
    din10 <= E_D?Din[23:16]:Din[87:80];
    din20 <= Din[47:40];
    din30 <= E_D?Din[71:64]:Din[7:0];
    din01 <= Din[95:88]; 
    din11 <= E_D?Din[119:112]:Din[55:48];
    din21 <= Din[15:8];
    din31 <= E_D?Din[39:32]:Din[103:96];
    din02 <= Din[63:56];
    din12 <= E_D?Din[87:80]:Din[23:16];
    din22 <= Din[111:104];
    din32 <= E_D?Din[7:0]:Din[71:64];
    din03 <= Din[31:24]; 
    din13 <= E_D?Din[55:48]:Din[119:112];
    din23 <= Din[79:72];
    din33 <= E_D?Din[103:96]:Din[39:32];
    end

assign   Dout={din00,din10,din20,din30,din01,din11,din21,din31,din02,din12,din22,din32,din03,din13,din23,din33};

endmodule
