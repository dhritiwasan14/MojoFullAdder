/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg a,
    output reg b,
    output reg c,
    input sum,
    input carry
  );
  
  
  
  reg rst;
  
  reg [25:0] M_counter_d, M_counter_q = 1'h0;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  localparam ALLOFF_state = 3'd0;
  localparam AON_state = 3'd1;
  localparam BON_state = 3'd2;
  localparam CON_state = 3'd3;
  localparam ABON_state = 3'd4;
  localparam BCON_state = 3'd5;
  localparam ACON_state = 3'd6;
  localparam ABCON_state = 3'd7;
  
  reg [2:0] M_state_d, M_state_q = ALLOFF_state;
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    a = 1'h0;
    b = 1'h0;
    c = 1'h0;
    io_led = 24'h000000;
    led = 8'hff;
    M_counter_d = M_counter_q + 1'h1;
    io_seg = 8'hff;
    io_sel = 4'hf;
    
    case (M_state_q)
      ALLOFF_state: begin
        a = 1'h0;
        b = 1'h0;
        c = 1'h0;
        io_led[0+0+0-:1] = 1'h1;
        if (sum == 1'h0 & carry == 1'h0) begin
          io_led[8+7-:8] = 8'hff;
        end else begin
          io_led[16+7-:8] = 8'hff;
        end
        if (M_counter_q[25+0-:1] == 1'h1) begin
          M_state_d = AON_state;
          M_counter_d = 1'h0;
        end
      end
      AON_state: begin
        a = 1'h1;
        b = 1'h0;
        c = 1'h0;
        io_led[0+1+0-:1] = 1'h1;
        if (sum == 1'h1 & carry == 1'h0) begin
          io_led[8+7-:8] = 8'hff;
        end else begin
          io_led[16+7-:8] = 8'hff;
        end
        if (M_counter_q[25+0-:1] == 1'h1) begin
          M_state_d = BON_state;
          M_counter_d = 1'h0;
        end
      end
      BON_state: begin
        a = 1'h0;
        b = 1'h1;
        c = 1'h0;
        io_led[0+2+0-:1] = 1'h1;
        if (sum == 1'h1 & carry == 1'h0) begin
          io_led[8+7-:8] = 8'hff;
        end else begin
          io_led[16+7-:8] = 8'hff;
        end
        if (M_counter_q[25+0-:1] == 1'h1) begin
          M_state_d = CON_state;
          M_counter_d = 1'h0;
        end
      end
      CON_state: begin
        a = 1'h0;
        b = 1'h0;
        c = 1'h1;
        io_led[0+3+0-:1] = 1'h1;
        if (sum == 1'h1 & carry == 1'h0) begin
          io_led[8+7-:8] = 8'hff;
        end else begin
          io_led[16+7-:8] = 8'hff;
        end
        if (M_counter_q[25+0-:1] == 1'h1) begin
          M_state_d = ABON_state;
          M_counter_d = 1'h0;
        end
      end
      ABON_state: begin
        a = 1'h1;
        b = 1'h1;
        c = 1'h0;
        io_led[0+4+0-:1] = 1'h1;
        if (sum == 1'h0 & carry == 1'h1) begin
          io_led[8+7-:8] = 8'hff;
        end else begin
          io_led[16+7-:8] = 8'hff;
        end
        if (M_counter_q[25+0-:1] == 1'h1) begin
          M_state_d = BCON_state;
          M_counter_d = 1'h0;
        end
      end
      BCON_state: begin
        a = 1'h0;
        b = 1'h1;
        c = 1'h1;
        io_led[0+5+0-:1] = 1'h1;
        if (sum == 1'h0 & carry == 1'h1) begin
          io_led[8+7-:8] = 8'hff;
        end else begin
          io_led[16+7-:8] = 8'hff;
        end
        if (M_counter_q[25+0-:1] == 1'h1) begin
          M_state_d = ACON_state;
          M_counter_d = 1'h0;
        end
      end
      ACON_state: begin
        a = 1'h1;
        b = 1'h0;
        c = 1'h1;
        io_led[0+6+0-:1] = 1'h1;
        if (sum == 1'h0 & carry == 1'h1) begin
          io_led[8+7-:8] = 8'hff;
        end else begin
          io_led[16+7-:8] = 8'hff;
        end
        if (M_counter_q[25+0-:1] == 1'h1) begin
          M_state_d = ABCON_state;
          M_counter_d = 1'h0;
        end
      end
      ABCON_state: begin
        a = 1'h1;
        b = 1'h1;
        c = 1'h1;
        io_led[0+7+0-:1] = 1'h1;
        if (sum == 1'h1 & carry == 1'h1) begin
          io_led[8+7-:8] = 8'hff;
        end else begin
          io_led[16+7-:8] = 8'hff;
        end
        if (M_counter_q[25+0-:1] == 1'h1) begin
          M_state_d = ALLOFF_state;
          M_counter_d = 1'h0;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule