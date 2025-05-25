// module counter (
//     clk,
//     rst_n,
//     out
// );
//   input clk, rst_n;
//   output reg [3:0] out;

//   wire [3:0] cnt_add1;
//   wire [3:0] cnt;

//   add_1 add1_inst (
//       cnt,
//       cnt_add1
//   );
//   DFF ff_inst (
//       cnt_add1,
//       clk,
//       rst_n,
//       cnt
//   );
//   assign out = cnt;

// endmodule

// module counter (
// clk, 
// rst_n,
// sel,
// out
// );

// input clk, rst_n, sel;
// output reg [3:0] out;

// wire [3:0] current_val;
// wire [3:0] next_val;
// wire t;

// case (sel)
//     :1'd1: begin
//         // add counting up 
//         t = 1'd1;
//     end
//     :1'd0: begin
//         // add counting down
//         t = 1'd0;
//     end
//     default: begin
//         // add counting up
//         t = 1'd1;
//     end
// endcase

//     DFF ff_inst (
//       next_val,
//       clk,
//       rst_n,
//       current_val
//   );
// adder_4 u_adder_4 (
//     .X(current_val),
//     .Y(4'd1),
//     .T(t),
//     .S(next_val),
// );

// assign out = current_val;

// endmodule

module counter (
    input clk, 
    input rst_n,
    input sel,
    output [3:0] out
);

    wire [3:0] current_val;
    wire [3:0] next_val;
    wire carry_unused;

    // t: 1 = sub, 0 = add
    // sel: 1: add, 0: sub
    wire t;
    assign t = ~sel;


    // Bộ cộng/trừ
    adder_4 u_adder_4 (
        .X(current_val),
        .Y(4'd1),
        .T(t),
        .S(next_val),
        .Cout(carry_unused)  
    );
    DFF ff_inst (
    .in(next_val),        
    .clk(clk),
    .rst_n(rst_n),
    .out(current_val)        
);


    assign out = current_val;

endmodule


