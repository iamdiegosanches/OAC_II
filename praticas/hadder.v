module hadder (
    input a, b,
    output cout, sum);

    assign cout = (a & b);
    assign sum = (a ^ b);
    
endmodule

module test;

    reg a, b;
    wire cout;
    wire sum;
    integer i;

    hadder u0 ( .a(a), .b(b), .cout(cout), .sum(sum) );

    initial begin

        a <= 0;
        b <= 0;

        $monitor("a=%0b b=%0b cout=%0b sum=%0b", a, b, cout, sum);

        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i;
            #10;
        end

    end

endmodule
