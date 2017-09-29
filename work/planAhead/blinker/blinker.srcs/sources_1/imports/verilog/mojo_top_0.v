/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [1:0] io_led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
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
  localparam AON_state = 3'd0;
  localparam BON_state = 3'd1;
  localparam CON_state = 3'd2;
  localparam ABON_state = 3'd3;
  localparam BCON_state = 3'd4;
  localparam ACON_state = 3'd5;
  localparam ABCON_state = 3'd6;
  
  reg [2:0] M_state_d, M_state_q = AON_state;
  
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
    M_counter_d = M_counter_q + 1'h1;
    if (M_counter_q[25+0-:1] == 1'h1) begin
      
      case (M_state_q)
        AON_state: begin
          a = 1'h0;
          b = 1'h1;
          c = 1'h0;
          M_state_d = BON_state;
        end
        BON_state: begin
          a = 1'h0;
          b = 1'h0;
          c = 1'h0;
          M_state_d = CON_state;
        end
        CON_state: begin
          a = 1'h0;
          b = 1'h0;
          c = 1'h0;
          M_state_d = ABON_state;
        end
        ABON_state: begin
          a = 1'h0;
          b = 1'h0;
          c = 1'h0;
          M_state_d = BCON_state;
        end
        BCON_state: begin
          a = 1'h0;
          b = 1'h0;
          c = 1'h0;
          M_state_d = ACON_state;
        end
        ACON_state: begin
          a = 1'h0;
          b = 1'h0;
          c = 1'h0;
          M_state_d = ABCON_state;
        end
        ABCON_state: begin
          a = 1'h1;
          b = 1'h0;
          c = 1'h0;
          M_state_d = AON_state;
        end
      endcase
    end
    io_led[0+0-:1] = sum;
    io_led[1+0-:1] = carry;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
endmodule