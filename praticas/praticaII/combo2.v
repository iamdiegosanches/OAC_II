module combo2 (
    input a, b, c, d,
    output reg o);

    always @ (a or b or c or d) begin
        o <= ~((a & b) | (c ^ d));
    end
endmodule

module test;
    reg a, b, c, d;
    wire o;
    integer k;
   
    combo2 u0 ( .a(a), .b(b), .c(c), .d(d), .o(o));
   
    initial begin
   
        a <= 0;
        b <= 0;
        c <= 0;
        d <= 0;

        $monitor ("a=%0b b=%0b c=%0b d=%0b o=%0b", a, b, c, d, o);
        $dumpfile("comb.vcd");
        $dumpvars(0, test);
   
        for (k = 0; k < 16; k = k + 1) begin
            {a, b, c, d} = k;
            #10;
        end
    end
endmodule