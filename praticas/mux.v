module mux (
    input [3:0] a,
    input [3:0] b,
    input s,
    output reg [3:0] x);

    always @(a, b, s)
    begin
        if (s)
            x = b;
        else
            x = a;
    end

endmodule

module tb_;

    reg [3:0] a;
    reg [3:0] b;
    reg s;

    wire [3:0] x;

    mux uut (
        .a(a),
        .b(b),
        .s(s),
        .x(x)
    );

    initial begin
        a = 4'b1010;
        b = 4'b1100;
        s = 0;

        $monitor("At time %t, A = %b, B = %b, s = %b, x = %b", $time, a, b, s, x);

        s = 1;
        #5;
        s = 0;
        #5;

    end

endmodule
