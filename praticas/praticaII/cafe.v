module cafe (
    input coffee_button, money, soup_button,
    output reg coffee, soup);

    always @(coffee_button or money or soup_button) begin
        coffee <= ((coffee_button & money) & ~(coffee_button & soup_button));
        soup <= (money & soup_button);
    end
endmodule

module test;

    reg coffee_button, money, soup_button;
    wire coffee, soup;
    integer i;

    cafe cof (.coffee_button(coffee_button), .money(money), .soup_button(soup_button), .coffee(coffee), .soup(soup));

    initial begin
        coffee_button <= 0;
        money <= 0;
        soup_button <= 0;

        $monitor ("Coffee_Button=%b, Money=%b, Soup_Button=%b, Coffee=%b, Soup=%b", coffee_button, money, soup_button, coffee, soup);

        for (i = 0 ; i < 8 ; i = i + 1) begin
            {coffee_button, money, soup_button} = i;
            #10;
        end
    end

endmodule
