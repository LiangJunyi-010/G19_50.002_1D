/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_buttoncond_out;
  reg [1-1:0] M_buttoncond_in;
  button_conditioner_1 buttoncond (
    .clk(clk),
    .in(M_buttoncond_in),
    .out(M_buttoncond_out)
  );
  
  wire [1-1:0] M_buttondetector_out;
  reg [1-1:0] M_buttondetector_in;
  edge_detector_2 buttondetector (
    .clk(clk),
    .in(M_buttondetector_in),
    .out(M_buttondetector_out)
  );
  
  wire [16-1:0] M_alucheckfsm1_out;
  wire [2-1:0] M_alucheckfsm1_show;
  wire [3-1:0] M_alucheckfsm1_zvn;
  wire [3-1:0] M_alucheckfsm1_ls;
  reg [1-1:0] M_alucheckfsm1_bt;
  reg [5-1:0] M_alucheckfsm1_io_button;
  reg [24-1:0] M_alucheckfsm1_io_dip;
  alucheckfsm_3 alucheckfsm1 (
    .clk(clk),
    .rst(rst),
    .bt(M_alucheckfsm1_bt),
    .io_button(M_alucheckfsm1_io_button),
    .io_dip(M_alucheckfsm1_io_dip),
    .out(M_alucheckfsm1_out),
    .show(M_alucheckfsm1_show),
    .zvn(M_alucheckfsm1_zvn),
    .ls(M_alucheckfsm1_ls)
  );
  
  
  localparam S0_s_controller = 1'd0;
  localparam S1_s_controller = 1'd1;
  
  reg M_s_controller_d, M_s_controller_q = S0_s_controller;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_4 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_enter_game_conditioner_out;
  reg [1-1:0] M_enter_game_conditioner_in;
  button_conditioner_1 enter_game_conditioner (
    .clk(clk),
    .in(M_enter_game_conditioner_in),
    .out(M_enter_game_conditioner_out)
  );
  wire [1-1:0] M_enter_game_detector_out;
  reg [1-1:0] M_enter_game_detector_in;
  edge_detector_2 enter_game_detector (
    .clk(clk),
    .in(M_enter_game_detector_in),
    .out(M_enter_game_detector_out)
  );
  wire [24-1:0] M_pressbutton_io_led;
  wire [8-1:0] M_pressbutton_io_seg;
  wire [4-1:0] M_pressbutton_io_sel;
  pressbutton_5 pressbutton (
    .clk(clk),
    .rst(rst),
    .io_button(io_button),
    .io_led(M_pressbutton_io_led),
    .io_seg(M_pressbutton_io_seg),
    .io_sel(M_pressbutton_io_sel)
  );
  
  always @* begin
    M_s_controller_d = M_s_controller_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 4'hf;
    io_sel = 4'hf;
    M_enter_game_conditioner_in = io_button[2+0-:1];
    M_enter_game_detector_in = M_enter_game_conditioner_out;
    M_alucheckfsm1_io_dip = io_dip;
    M_alucheckfsm1_io_button = io_button;
    M_buttoncond_in = io_button[1+0-:1];
    M_buttondetector_in = M_buttoncond_out;
    M_alucheckfsm1_bt = M_buttondetector_out;
    
    case (M_s_controller_q)
      S0_s_controller: begin
        io_led[0+7-:8] = M_alucheckfsm1_out[0+7-:8];
        io_led[8+7-:8] = M_alucheckfsm1_out[8+7-:8];
        io_led[16+3+1-:2] = M_alucheckfsm1_show;
        io_led[16+5+2-:3] = M_alucheckfsm1_zvn;
        io_led[16+0+2-:3] = M_alucheckfsm1_ls;
        if (M_enter_game_detector_out) begin
          M_s_controller_d = S1_s_controller;
        end
      end
      S1_s_controller: begin
        io_led = M_pressbutton_io_led;
        io_seg = M_pressbutton_io_seg;
        io_sel = M_pressbutton_io_sel;
        if (M_enter_game_detector_out) begin
          M_s_controller_d = S0_s_controller;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_s_controller_q <= 1'h0;
    end else begin
      M_s_controller_q <= M_s_controller_d;
    end
  end
  
endmodule
