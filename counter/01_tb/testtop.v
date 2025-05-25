module testtop;

    reg clk;
    reg rst_n;
    reg sel;
    wire [3:0] out;

    synth_wrapper uut (
        .clk(clk),
        .rst_n(rst_n),
        .sel(sel),
        .out(out)
    );

    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // TASK: Reset system
    task reset_test();
    begin
        $display("\n>>> STARTING TEST CASE BY GROUP 19 L01 <<<");
        $display(">>> RESET <<<");
        rst_n = 0;
        #12;
        rst_n = 1;
        #10;
    end
    endtask

    // TASK: Count up for N cycles
    task count_up_test(input integer cycles);
    begin
        $display("\n>>> Counting UP for %0d cycles", cycles);
        sel = 1;
        repeat (cycles) @(posedge clk);
    end
    endtask

    // TASK: Count down for N cycles
    task count_down_test(input integer cycles);
    begin
        $display("\n>>> Counting DOWN for %0d cycles", cycles);
        sel = 0;
        repeat (cycles) @(posedge clk);
    end
    endtask

    // Test main
    initial begin
        rst_n = 1;
        sel = 1;

        reset_test();         
        count_up_test(10);       
        count_down_test(6);      
        count_up_test(4);        

        $display(">>> Simulation DONE <<<");
        $finish;
    end

    initial begin
        $monitor("Time = %0t ns | sel = %b | out = %0d", $time, sel, out);
    end

endmodule