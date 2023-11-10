module dff (
    input d, rstb, clk;
    output reg q
);

always @(posedge clk) begin
    if (!rstb)
        q <= 0;
    else
        q <= d;
end

endmodule


module tb_;

reg clk;
reg rst_n;
reg d;

wire q;

dff uut (
    .d(d),
    .rstb(~rst_n),
    .clk(clk),
    .q(q)
);

initial begin
    $dumpfile("tb_.vcd");
    $dumpvars(0, tb_);

    // Clock generation
    always #(CLK_PERIOD/2) clk = ~clk;

    // Testbench
    #1 rst_n = 1'b0; clk = 1'b0;
    #(CLK_PERIOD*3) rst_n = 1'b1;
    #(CLK_PERIOD*3) rst_n = 1'b0; clk = 1'b0;
    repeat(5) @(posedge clk);
    rst_n = 1'b1;
    @(posedge clk);
    repeat(2) @(posedge clk);
    // Assign values to d
    d = 1'b0; // or any other value
    @(posedge clk);
    // Continue testing as needed

    $finish;
end

endmodule
