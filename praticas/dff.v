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
