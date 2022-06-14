`timescale 1ns / 1ps

module b_clk(clkin,bram_clk,clk0,locked);
input  clkin;
output bram_clk,clk0,locked;
  clk_wiz_0 instance_name
   (
    // Clock out ports
    .clk0(clk0),     // output clk0
    .bram_clk(bram_clk),     // output bram_clk
    // Status and control signals
    .locked(locked),       // output locked
   // Clock in ports
    .clkin(clkin));      // input clkin
// INST_TAG_END ------ End INSTANTIATION Template ---------
endmodule