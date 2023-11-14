module dff (
    input d, rstb, clk,
    output reg q);

always @(posedge clk) begin
    if (!rstb)
        q <= 0;
    else
        q <= d;
end

endmodule


module tb_;

    reg clk;
    reg rstb;
    reg d;

    wire q;

    dff uut (
        .d(d),
        .rstb(rstb),
        .clk(clk),
        .q(q)
    );

    always #2 clk = ~clk;

    initial begin
        $monitor ("d=%b, rstb=%b, clk=%b, q=%b", d, rstb, clk, q);

        {clk, rstb, d} = 0;
        #2 rstb <= 1;
        #25;
        d <= 1;
        #25;
        rstb <= 0;
        #10;

        #50 $finish;
    end

endmodule
