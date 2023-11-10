module combo (input a, b, c, d, e,
            output z);
           
            assign z = ((a & b) | (c ^ d) & ~e);
endmodule

module test;

    reg a, b, c, d, e;
    wire z;
    integer k;
   
    combo u0 ( .a(a), .b(b), .c(c), .d(d), .e(e), .z(z) );
   
    initial begin
   
        a <= 0;
        b <= 0;
        c <= 0;
        d <= 0;
        e <= 0;

        $monitor ("a=%0b b=%0b c=%0b d=%0b e=%0b z=%0b", a, b, c, d, e, z);
   
        for (k = 0; k < 32; k = k + 1) begin
            {a, b, c, d, e} = k;
            #10;
        end
    end
endmodule