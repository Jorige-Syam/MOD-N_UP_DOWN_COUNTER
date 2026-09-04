`timescale 1ns/1ps
`include "modn_updown_counter.v"

module tb;

    // Parameters
    parameter N     = 10;
    parameter WIDTH = $clog2(N);

    // Testbench signals
    reg clk;
    reg               rst;
    reg               up_down;
    wire [WIDTH-1:0]  count;

    // Instantiate the DUT (Device Under Test)
    modn_updown_counter #(
        .N(N),
        .WIDTH(WIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .count(count)
    );

    // Clock generation: 10ns period (100 MHz)
    always #5 clk = ~clk;

    // Test stimulus sequence
    initial begin
        // Initialize signals
        clk     = 0;
        rst     = 1;
        up_down = 1;

        // Apply reset for 20ns
        #20;
        rst = 0;
        
        $display("[%0tns] Reset released. Testing UP counting...", $time);
        // Let it count up past N-1 (10 cycles up + wrap around)
        up_down = 1;
        #120;

        $display("[%0tns] Switching to DOWN counting...", $time);
        // Test down counting behavior
        up_down = 0;
        #100;

        // Test mid-stream reset pulse
        $display("[%0tns] Asserting synchronous reset mid-stream...", $time);
        rst = 1;
        #15;
        rst = 0;
        #40;

        $display("[%0tns] Testbench finished successfully.", $time);
        $finish;
    end

    // Monitor changes on the console
    initial begin
        $monitor("Time=%0tns | rst=%b | up_down=%b | count=%0d (0x%0h)", 
                 $time, rst, up_down, count, count);
    end

endmodule


