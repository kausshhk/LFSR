module lfsr
  #(parameter N = 3) (
    input clk,
    input reset_n,
    output [1:N] Q
  );

  reg [1:N] Q_reg, Q_next;
  wire taps;

  always @(posedge clk, negedge reset_n)
  begin
    if (~reset_n)
      Q_reg <= 'd1; // LFSR shouldn't start with 0 or FFFF
    else
      Q_reg <= Q_next;
  end

  // Next state logic
  always @(*)
    Q_next = {taps, Q_reg[1:N - 1]};

  // Output logic
  assign Q = Q_reg;

  // ============================================================
  // For maximum-length LFSR taps, check table 3 in the following:
  // http://www.xilinx.com/support/documentation/application_notes/xapp052.pdf
  // ============================================================

  // N = 3
  assign taps = Q_reg[3] ^ Q_reg[2];

  // N = 8
  //assign taps = Q_reg[8] ^ Q_reg[6] ^ Q_reg[5] ^ Q_reg[4];

endmodule
