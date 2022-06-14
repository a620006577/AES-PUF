`timescale 1ns / 1ps
module a(r0,r1,r2,r3,key,dout);
     input [7:0] r0,r1,r2,r3,key;
     output[7:0] dout;
   
     LUT5 #(
         .INIT(32'h96696996) // Specify LUT Contents
         ) L0(
         .O(dout[0]), // LUT general output
         .I0(r0[0]), // LUT input
         .I1(r1[0]), // LUT input
         .I2(r2[0]), // LUT input
         .I3(r3[0]), // LUT input
         .I4(key[0]) // LUT input
         );
           LUT5 #(
         .INIT(32'h96696996) // Specify LUT Contents
         ) L1(
         .O(dout[1]), // LUT general output
         .I0(r0[1]), // LUT input
         .I1(r1[1]), // LUT input
         .I2(r2[1]), // LUT input
         .I3(r3[1]), // LUT input
         .I4(key[1]) // LUT input
         );
          LUT5 #(
         .INIT(32'h96696996) // Specify LUT Contents
         ) L2(
         .O(dout[2]), // LUT general output
         .I0(r0[2]), // LUT input
         .I1(r1[2]), // LUT input
         .I2(r2[2]), // LUT input
         .I3(r3[2]), // LUT input
         .I4(key[2]) // LUT input
         );
              LUT5 #(
         .INIT(32'h96696996) // Specify LUT Contents
         ) L3(
         .O(dout[3]), // LUT general output
         .I0(r0[3]), // LUT input
         .I1(r1[3]), // LUT input
         .I2(r2[3]), // LUT input
         .I3(r3[3]), // LUT input
         .I4(key[3]) // LUT input
         );
              LUT5 #(
         .INIT(32'h96696996) // Specify LUT Contents
         ) L4(
         .O(dout[4]), // LUT general output
         .I0(r0[4]), // LUT input
         .I1(r1[4]), // LUT input
         .I2(r2[4]), // LUT input
         .I3(r3[4]), // LUT input
         .I4(key[4]) // LUT input
         );
              LUT5 #(
         .INIT(32'h96696996) // Specify LUT Contents
         ) L5(
         .O(dout[5]), // LUT general output
         .I0(r0[5]), // LUT input
         .I1(r1[5]), // LUT input
         .I2(r2[5]), // LUT input
         .I3(r3[5]), // LUT input
         .I4(key[5]) // LUT input
         );
              LUT5 #(
         .INIT(32'h96696996) // Specify LUT Contents
         ) L6(
         .O(dout[6]), // LUT general output
         .I0(r0[6]), // LUT input
         .I1(r1[6]), // LUT input
         .I2(r2[6]), // LUT input
         .I3(r3[6]), // LUT input
         .I4(key[6]) // LUT input
         );
              LUT5 #(
         .INIT(32'h96696996) // Specify LUT Contents
         ) L7(
         .O(dout[7]), // LUT general output
         .I0(r0[7]), // LUT input
         .I1(r1[7]), // LUT input
         .I2(r2[7]), // LUT input
         .I3(r3[7]), // LUT input
         .I4(key[7]) // LUT input
         );
endmodule