📌 Project Description
In this assignment, I designed and verified a Digital Clock module using SystemVerilog. The system consists of two synchronized 6-bit counters that represent seconds and minutes, each counting from 0 to 59.
The objective of this project was not only to implement the RTL design but also to develop a structured verification environment using advanced SystemVerilog constructs such as interfaces, program blocks, functional coverage, and assertions.

🎯 Design Objectives
The primary goal of this project was to:
Design a synchronous digital clock module.
Implement correct rollover behavior for seconds and minutes.
Ensure proper synchronization within a single clock domain.
Verify the functionality using a comprehensive testbench.
Achieve 100% functional coverage.

🏗️ RTL Design Implementation
I implemented the digital clock with the following functional behavior:

1️⃣ Seconds Counter
A 6-bit synchronous counter.
Increments on every positive edge of the clock.
Counts from 0 to 59.
Rolls over to 0 after reaching 59.

2️⃣ Minutes Counter

A 6-bit synchronous counter.
Increments only when the seconds counter rolls over from 59 to 0.
Counts from 0 to 59.
When both seconds and minutes reach 59, both reset to 0 in the next clock cycle (simulating hour transition).

3️⃣ Reset Behavior
An active-high synchronous reset.
Initializes both counters to 0 on the next positive clock edge.

4️⃣ Design Specifications

The clock frequency is assumed to be 1 Hz (adjustable for faster simulation).
Both counters operate within the same clock domain.
No asynchronous logic is used except optional power-on reset.

🧪 Verification Methodology
To ensure correctness and robustness of the design, I developed a structured verification environment using SystemVerilog.

1️⃣ Interface (clock_interface.sv)
I created an interface that includes:
Clock signal
Reset signal
6-bit seconds output
6-bit minutes output
Separate modports were defined for the DUT and Testbench to ensure clean connectivity.

2️⃣ Program Block (clock_test.sv)
I implemented stimulus generation and checking inside a program block to avoid race conditions between the DUT and testbench.

3️⃣ Functional Coverage
I defined functional coverage models to verify:
All seconds values from 0 to 59.
All minutes values from 0 to 59.
Transition coverage for 59 → 0 in both counters.
Cross coverage between seconds and minutes.
The goal was to achieve 100% functional coverage, which confirms that all functional scenarios were exercised.

4️⃣ Assertions
I implemented assertions to ensure:
Counters never exceed the value 59.
Rollover behavior occurs correctly.
No illegal states are reached during simulation.

📂 Repository Contents
The repository includes:
digital_clock.sv – RTL implementation
clock_interface.sv – Interface definition
clock_tb.sv – Top-level testbench
clock_test.sv – Program block with stimulus and checking
Simulation log file
Functional coverage report
Waveform snapshot showing rollover events

▶️ Simulation Environment
The project was simulated using Cadence Xcelium with SystemVerilog enabled.
