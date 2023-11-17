module mux2 (input [3:0] A, input [3:0] B, input S, output reg [3:0] X);
    always @(A or B or S) begin
        if (S == 0)
            X = A;
        else
            X = B;
    end
endmodule

module teste;
    reg [3:0] A;
    reg [3:0] B;
    reg S;
    wire [3:0] X;
    integer i;

    mux2 m1 (.A(A), .B(B), .S(S), .X(X));

    initial begin
        A = 4'b1010;
        B = 4'b0010;
        S = 0;

        $monitor (" A=%b B=%b S=%b X=%b", A, B, S, X);

        S = 1;
        #5;
        S = 0;
        #5;

    end
endmodule
