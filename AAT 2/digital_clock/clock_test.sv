// -----------------------------------------------------------------------------
// File        : clock_test.sv
// Author      : Prajwal Bharadwaj D H (1BM23EC186)
// Created     : 2026-02-24
// Module      : clock_test
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
// Description : Digital clock that tracks time using counters.
// ----------------------------------------------------------------------------- 
program clock_test(clock_interface.TB intf);

    covergroup cg @(posedge intf.clk);

        seconds_cp : coverpoint intf.seconds {
            bins sec_vals[] = {[0:59]};
            bins sec_rollover = (59 => 0);
        }

        minutes_cp : coverpoint intf.minutes {
            bins min_vals[] = {[0:59]};
            bins min_rollover = (59 => 0);
        }

        cross seconds_cp, minutes_cp;

    endgroup

    cg coverage = new();

    property sec_limit;
        @(posedge intf.clk)
        intf.seconds <= 6'd59;
    endproperty

    property min_limit;
        @(posedge intf.clk)
        intf.minutes <= 6'd59;
    endproperty

    assert property(sec_limit)
      else $error("Error : Seconds exceeded 59!");

    assert property(min_limit)
      else $error("Error : Minutes exceeded 59!");

    initial begin

        intf.reset = 1;
        repeat (2) @(posedge intf.clk);
        intf.reset = 0;

        repeat (4000) @(posedge intf.clk);

      $display("Success : Simulation completed.");
        $finish;

    end

endprogram
