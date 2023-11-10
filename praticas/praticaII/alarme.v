module alarme (
    input moto, cinto, igni,
    output reg luz);

    always @(moto or cinto or igni) begin
        luz = (moto & ~cinto & igni);
    end
    
endmodule

module tb_;
    reg moto, cinto, igni;
    wire luz;
    integer i;

    alarme a1 ( .moto(moto), .cinto(cinto), .igni(igni), .luz(luz));


    initial begin
        $monitor("motorista_presente=%0b, cinto_em_uso=%0b, ignicao_ligada=%0b, luz_de_advertencia=%0b", moto, cinto, igni, luz);
        $dumpfile("alarme.vcd");
        $dumpvars(0, tb_);

        for (i = 0; i < 8; i = i + 1) begin
            {moto, cinto, igni} = i;
            #10;
        end

        $finish;
    end

endmodule
