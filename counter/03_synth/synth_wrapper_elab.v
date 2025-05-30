
// Generated by Cadence Genus(TM) Synthesis Solution GENUS15.20 - 15.20-p004_1
// Generated on: May 23 2025 23:34:20

// Verification Directory fv/synth_wrapper 

module adder_1(X, Y, Cin, S, Cout);
  input X, Y, Cin;
  output S, Cout;
  wire X, Y, Cin;
  wire S, Cout;
  wire n_3, n_5, n_6, n_7, n_8;
  xor g1 (n_3, X, Y);
  xor g2 (S, n_3, Cin);
  and g3 (n_5, X, Y);
  and g4 (n_6, Y, Cin);
  or g5 (n_7, n_5, n_6);
  and g6 (n_8, X, Cin);
  or g7 (Cout, n_7, n_8);
endmodule

module bmux(ctl, in_0, in_1, z);
  input ctl;
  input [3:0] in_0, in_1;
  output [3:0] z;
  wire ctl;
  wire [3:0] in_0, in_1;
  wire [3:0] z;
  CDN_bmux2 g1(.sel0 (ctl), .data0 (in_0[3]), .data1 (in_1[3]), .z
       (z[3]));
  CDN_bmux2 g2(.sel0 (ctl), .data0 (in_0[2]), .data1 (in_1[2]), .z
       (z[2]));
  CDN_bmux2 g3(.sel0 (ctl), .data0 (in_0[1]), .data1 (in_1[1]), .z
       (z[1]));
  CDN_bmux2 g4(.sel0 (ctl), .data0 (in_0[0]), .data1 (in_1[0]), .z
       (z[0]));
endmodule

module adder_4(X, Y, T, S, Cout);
  input [3:0] X, Y;
  input T;
  output [3:0] S;
  output Cout;
  wire [3:0] X, Y;
  wire T;
  wire [3:0] S;
  wire Cout;
  wire [3:0] Y_eff;
  wire C0, C1, C2, n_2, n_4, n_6, n_8;
  adder_1 ADD0(X[0], Y_eff[0], T, S[0], C0);
  adder_1 ADD1(X[1], Y_eff[1], C0, S[1], C1);
  adder_1 ADD2(X[2], Y_eff[2], C1, S[2], C2);
  adder_1 ADD3(X[3], Y_eff[3], C2, S[3], Cout);
  bmux mux_35_20(.ctl (T), .in_0 (Y), .in_1 ({n_8, n_6, n_4, n_2}), .z
       (Y_eff));
  not g1 (n_8, Y[3]);
  not g3 (n_6, Y[2]);
  not g4 (n_4, Y[1]);
  not g5 (n_2, Y[0]);
endmodule

module DFF(in, clk, rst_n, out);
  input [3:0] in;
  input clk, rst_n;
  output [3:0] out;
  wire [3:0] in;
  wire clk, rst_n;
  wire [3:0] out;
  wire UNCONNECTED, UNCONNECTED0, UNCONNECTED1, UNCONNECTED2, n_5;
  bmux mux_out_16_9(.ctl (n_5), .in_0 (in), .in_1 (4'b0000), .z
       ({UNCONNECTED2, UNCONNECTED1, UNCONNECTED0, UNCONNECTED}));
  not g1 (n_5, rst_n);
  CDN_flop \out_reg[0] (.clk (clk), .d (in[0]), .sena (1'b1), .aclr
       (n_5), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[0]));
  CDN_flop \out_reg[1] (.clk (clk), .d (in[1]), .sena (1'b1), .aclr
       (n_5), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[1]));
  CDN_flop \out_reg[2] (.clk (clk), .d (in[2]), .sena (1'b1), .aclr
       (n_5), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[2]));
  CDN_flop \out_reg[3] (.clk (clk), .d (in[3]), .sena (1'b1), .aclr
       (n_5), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[3]));
endmodule

module counter(clk, rst_n, sel, out);
  input clk, rst_n, sel;
  output [3:0] out;
  wire clk, rst_n, sel;
  wire [3:0] out;
  wire [3:0] next_val;
  wire carry_unused, t;
  adder_4 u_adder_4(.X (out), .Y (4'b0001), .T (t), .S (next_val),
       .Cout (carry_unused));
  DFF ff_inst(.in (next_val), .clk (clk), .rst_n (rst_n), .out (out));
  not g1 (t, sel);
endmodule

module synth_wrapper(clk, rst_n, sel, out);
  input clk, rst_n, sel;
  output [3:0] out;
  wire clk, rst_n, sel;
  wire [3:0] out;
  wire [3:0] counter_out;
  wire UNCONNECTED3, UNCONNECTED4, UNCONNECTED5, UNCONNECTED6, n_5;
  counter u_counter(.clk (clk), .rst_n (rst_n), .sel (sel), .out
       (counter_out));
  bmux mux_out_11_13(.ctl (n_5), .in_0 (counter_out), .in_1 (4'b0000),
       .z ({UNCONNECTED6, UNCONNECTED5, UNCONNECTED4, UNCONNECTED3}));
  not g1 (n_5, rst_n);
  CDN_flop \out_reg[0] (.clk (clk), .d (counter_out[0]), .sena (1'b1),
       .aclr (n_5), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (out[0]));
  CDN_flop \out_reg[1] (.clk (clk), .d (counter_out[1]), .sena (1'b1),
       .aclr (n_5), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (out[1]));
  CDN_flop \out_reg[2] (.clk (clk), .d (counter_out[2]), .sena (1'b1),
       .aclr (n_5), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (out[2]));
  CDN_flop \out_reg[3] (.clk (clk), .d (counter_out[3]), .sena (1'b1),
       .aclr (n_5), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (out[3]));
endmodule

`ifdef RC_CDN_GENERIC_GATE
`else
module CDN_flop(clk, d, sena, aclr, apre, srl, srd, q);
  input clk, d, sena, aclr, apre, srl, srd;
  output q;
  wire clk, d, sena, aclr, apre, srl, srd;
  wire q;
  reg  qi;
  assign #1 q = qi;
  always 
    @(posedge clk or posedge apre or posedge aclr) 
      if (aclr) 
        qi <= 0;
      else if (apre) 
          qi <= 1;
        else if (srl) 
            qi <= srd;
          else begin
            if (sena) 
              qi <= d;
          end
  initial 
    qi <= 1'b0;
endmodule
`endif
`ifdef RC_CDN_GENERIC_GATE
`else
`ifdef ONE_HOT_MUX
module CDN_bmux2(sel0, data0, data1, z);
  input sel0, data0, data1;
  output z;
  wire sel0, data0, data1;
  reg  z;
  always 
    @(sel0 or data0 or data1) 
      case ({sel0})
       1'b0: z = data0;
       1'b1: z = data1;
      endcase
endmodule
`else
module CDN_bmux2(sel0, data0, data1, z);
  input sel0, data0, data1;
  output z;
  wire sel0, data0, data1;
  wire z;
  wire inv_sel0, w_0, w_1;
  not i_0 (inv_sel0, sel0);
  and a_0 (w_0, inv_sel0, data0);
  and a_1 (w_1, sel0, data1);
  or org (z, w_0, w_1);
endmodule
`endif // ONE_HOT_MUX
`endif
