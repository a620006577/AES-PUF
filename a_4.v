`timescale 1ns / 1ps
module a_4(R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,key,dout);
input [31:0] R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15;
input [127:0] key;
output[127:0] dout;
//col 1
a col_00(.dout(dout[127:120]),.r0(R0[31:24]),.r1(R1[7:0]),.r2(R2[15:8]),.r3(R3[23:16]),.key(key[127:120]));
a col_10(.dout(dout[119:112]),.r0(R0[23:16]),.r1(R1[31:24]),.r2(R2[7:0]),.r3(R3[15:8]),.key(key[119:112]));
a col_20(.dout(dout[111:104]),.r0(R0[15:8]),.r1(R1[23:16]),.r2(R2[31:24]),.r3(R3[7:0]),.key(key[111:104]));
a col_30(.dout(dout[103:96]),.r0(R0[7:0]),.r1(R1[15:8]),.r2(R2[23:16]),.r3(R3[31:24]),.key(key[103:96]));
//col 2
a col_01(.dout(dout[95:88]),.r0(R4[31:24]),.r1(R5[7:0]),.r2(R6[15:8]),.r3(R7[23:16]),.key(key[95:88]));
a col_11(.dout(dout[87:80]),.r0(R4[23:16]),.r1(R5[31:24]),.r2(R6[7:0]),.r3(R7[15:8]),.key(key[87:80]));
a col_21(.dout(dout[79:72]),.r0(R4[15:8]),.r1(R5[23:16]),.r2(R6[31:24]),.r3(R7[7:0]),.key(key[79:72]));
a col_31(.dout(dout[71:64]),.r0(R4[7:0]),.r1(R5[15:8]),.r2(R6[23:16]),.r3(R7[31:24]),.key(key[71:64]));
//col 3
a col_02(.dout(dout[63:56]),.r0(R8[31:24]),.r1(R9[7:0]),.r2(R10[15:8]),.r3(R11[23:16]),.key(key[63:56]));
a col_12(.dout(dout[55:48]),.r0(R8[23:16]),.r1(R9[31:24]),.r2(R10[7:0]),.r3(R11[15:8]),.key(key[55:48]));
a col_22(.dout(dout[47:40]),.r0(R8[15:8]),.r1(R9[23:16]),.r2(R10[31:24]),.r3(R11[7:0]),.key(key[47:40]));
a col_32(.dout(dout[39:32]),.r0(R8[7:0]),.r1(R9[15:8]),.r2(R10[23:16]),.r3(R11[31:24]),.key(key[39:32]));
//col 4
a col_03(.dout(dout[31:24]),.r0(R12[31:24]),.r1(R13[7:0]),.r2(R14[15:8]),.r3(R15[23:16]),.key(key[31:24]));
a col_13(.dout(dout[23:16]),.r0(R12[23:16]),.r1(R13[31:24]),.r2(R14[7:0]),.r3(R15[15:8]),.key(key[23:16]));
a col_23(.dout(dout[15:8]),.r0(R12[15:8]),.r1(R13[23:16]),.r2(R14[31:24]),.r3(R15[7:0]),.key(key[15:8]));
a col_33(.dout(dout[7:0]),.r0(R12[7:0]),.r1(R13[15:8]),.r2(R14[23:16]),.r3(R15[31:24]),.key(key[7:0]));
endmodule