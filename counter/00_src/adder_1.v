module adder_1 (
    input  X,
    input  Y,
    input  Cin,
    output S,
    output Cout
);
    assign S = X ^ Y ^ Cin;
    assign Cout = (X & Y) | (Y & Cin) | (X & Cin);
endmodule
