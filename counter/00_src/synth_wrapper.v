module synth_wrapper (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       sel,     
    output reg  [3:0] out
);

    wire [3:0] counter_out;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out <= 4'd0;
        end
        else begin
            out <= counter_out;
        end
    end
    counter u_counter (
        .clk(clk),
        .rst_n(rst_n),
        .sel(sel),              
        .out(counter_out)
    );

endmodule




