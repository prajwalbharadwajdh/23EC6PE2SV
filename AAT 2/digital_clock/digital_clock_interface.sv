
interface digital_clock_interface (input logic clk);

    logic reset;
    logic [5:0] seconds;
    logic [5:0] minutes;

    // Modport for DUT
    modport DUT (
        input  clk,
        input  reset,
        output seconds,
        output minutes
    );

    // Modport for Testbench
    modport TB (
        input  clk,
        output reset,
        input  seconds,
        input  minutes
    );

endinterface
