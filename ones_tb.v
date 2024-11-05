`timescale 1ns/1ps

module count_ones_tb;
    reg [7:0] binary_in;
    wire [3:0] ones_count;

    // Instantiate the count_ones module
    count_ones uut (
        .binary_in(binary_in),
        .ones_count(ones_count)
    );

    initial begin
        // Initialize the dump file for GTKWave
        $dumpfile("count_ones_tb.vcd");
        $dumpvars(0, count_ones_tb);

        // Monitor the inputs and outputs
        $monitor("Input: %b, Number of 1s: %d", binary_in, ones_count);

        // Test cases with expected outputs
        binary_in = 8'b00000000; #10; // Expected output: 0
        binary_in = 8'b11111111; #10; // Expected output: 8
        binary_in = 8'b10101010; #10; // Expected output: 4
        binary_in = 8'b11001100; #10; // Expected output: 4
        binary_in = 8'b11100110; #10; // Expected output: 5
        binary_in = 8'b10000001; #10; // Expected output: 2
        binary_in = 8'b00100110; #10; // Expected output: 4
        binary_in = 8'b00001111; #10; // Expected output: 4
        binary_in = 8'b01010101; #10; // Expected output: 4

        // Finish simulation
        $finish;
    end
endmodule
