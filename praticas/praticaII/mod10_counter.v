module mod10_counter (
    input clk,
    input rstn,
    output reg[3:0] out);

    always @(posedge clk) begin
        if (!rstn) begin
            out <= 0;
        end else begin
            if (out == 10)
                out <= 0;    
            else
                out <= out + 1;
        end           
    end    
endmodule

module test;
    reg rstn, clk;
    wire [3:0] out;
   
    mod10_counter count (.clk(clk), .rstn(rstn), .out(out));

    always #2 clk = ~clk;

    initial begin
        $monitor ("rstn=%0b, clk=%0b, o=%b", rstn, clk, out);
        $dumpfile("counter.vcd");
        $dumpvars(0, test);

        {clk, rstn} = 0;

        #2 rstn <= 1;

        #100 $finish;
    end
    
endmodule