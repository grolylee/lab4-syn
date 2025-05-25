module DFF (
    in,
    clk,
    rst_n,
    out
);
  input [3:0] in;
  input clk, rst_n;
  output reg [3:0] out;

  initial begin
    out <= 0;
  end

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      out <= 4'd0;  // Reset đồng bộ
    end else begin
      out <= in;  // Lưu giá trị d khi clock tăng
    end
  end
endmodule
