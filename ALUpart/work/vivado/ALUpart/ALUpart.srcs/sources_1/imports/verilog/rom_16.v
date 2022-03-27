/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module rom_16 (
    input [5:0] address,
    output reg [15:0] oA,
    output reg [15:0] oB,
    output reg [3:0] alufn,
    output reg [2:0] oZVN,
    output reg [15:0] out
  );
  
  
  
  localparam A = 848'hfaf0af00f00000001234fffffffff0f0f00ffffffffff0f0f00ffffffffff0f0f00f00000000ffff00000000ffff00000000ffff00000000ffff00000000000000000000000000000000000080007fff001e7fff001e80007fff80010001001e80007fff8001001e8000;
  
  localparam B = 848'h000c000f000a000f0004000800000004000f000800000004000f000800000004000f0000ffffffff0000ffffffff0000ffffffff0000ffffffff80007fff000080007fff000080007fff00007fff7fffffe20000001f0001ffff00017fff001fffff0001ffff001f0001;
  
  localparam ALUSGNL = 212'hffffcccccbbbbaaaa999888777666555444333222221111100000;
  
  localparam ZVN = 159'h49200000000000000000000603018d181324a241;
  
  localparam O = 848'hcfaffaf0af00f0000123ffffffffff0fffff00ffffff0f0f0001ff00ffff0f00800000000000ffff0000ffff00000000ffffffff00000000ffff00000001000100000001000000000000000180000001fc7c000003a27fff800080008002ffff7fff80008000003d8001;
  
  always @* begin
    out = O[(address)*16+15-:16];
    oA = A[(address)*16+15-:16];
    oB = B[(address)*16+15-:16];
    alufn = ALUSGNL[(address)*4+3-:4];
    oZVN = ZVN[(address)*3+2-:3];
  end
endmodule
