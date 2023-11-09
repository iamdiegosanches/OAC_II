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

module test;
    reg d, rstb, clk;
    wire q;
    integer i;

    dff u0 (.d(d), .rstb(rstb), .clk(clk), .q(q));

    reg clock = 0;
    always begin
        #5 clock = ~clock;
        clk = clock;
    end

    initial begin
        $monitor("d=%0b rstb=%0b clk=%0b q=%0b", d, rstb, clk, q);

        rstb <= 0;
        clk <= 0;
        d <= 1;

        #5 rstb <= 1;
        #10 d <= 0;
        #10 d <= 1;
        #10 d <= 0;

        #5 clk <= 1; // Alterne o clock após 5 unidades de tempo
        #10 clk <= 0; // Alterne o clock de volta para 0 após 10 unidades de tempo
        #10 clk <= 1;
    end
endmodule
