module fulladder(
    input a, b, cin, 
    output sum, cout
);
    assign sum = a^b^cin;
    assign cout = a&b|b&cin|cin&a;
endmodule

module ripple_adder(
    input wire [3:0]a, 
    input wire [3:0]b, 
    input wire cin, 
    output wire [3:0]s, 
    output wire cout
);
    wire [2:0]c;
    fulladder f1(a[0],b[0],cin,s[0],c[0]);
    fulladder f2(a[1],b[1],c[0],s[1],c[1]);
    fulladder f3(a[2],b[2],c[1],s[2],c[2]);
    fulladder f4(a[3],b[3],c[2],s[3],cout);
endmodule

module count_ones(
    input [7:0] binary_in,
    output [3:0] ones_count
);
    // Split the input into two 4-bit groups
    wire [3:0] lower_bits = {3'b000, binary_in[0]} + 
                           {3'b000, binary_in[1]} + 
                           {3'b000, binary_in[2]} +
                           {3'b000, binary_in[3]};
                           
    wire [3:0] upper_bits = {3'b000, binary_in[4]} + 
                           {3'b000, binary_in[5]} + 
                           {3'b000, binary_in[6]} +
                           {3'b000, binary_in[7]};
    
    // Use ripple adder to sum the two groups
    wire cout;
    ripple_adder ra(
        .a(lower_bits),
        .b(upper_bits),
        .cin(1'b0),
        .s(ones_count),
        .cout(cout)
    );

endmodule