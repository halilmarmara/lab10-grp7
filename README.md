# Sequential Circuits: Latches

In this lab, you’ve learned about edge sensitive circuits and explored some of the power therein.

## Rubric

|Item|Description|Value|
|-|-|-|
|Summary Answers|Your writings about what you learned in this lab.|25%|
|Question 1|Your answers to the question|25%|
|Question 2|Your answers to the question|25%|
|Question 3|Your answers to the question|25%|

## Names

## Summary
In this lab, we designed, simulated, and implemented D, JK, and T flip-flops in Verilog on the Basys3 FPGA board. We first implemented a positive-edge-triggered D flip-flop (d_ff) behaviorally with an initial state of 0, and then used hierarchical design to construct the JK flip-flop (jk_ff) with combinational feedback logic (D=JQ'+K'Q)and the T flip-flop (t_ff) by tying the J and K inputs together. After verifying all state transitions in simulation with our testbench, we deployed the design onto the Basys3 board—using sw[0:3] for inputs, btnC as a manual clock source, and led[0:5] to observe both Q and Q'​ —confirming that our practical results matched both the lab requirements and the theoretical concepts covered in class.
## Lab Questions

### What is difference between edge and level sensitive circuits?
Level-sensitive circuits (such as latches) are transparent for the entire duration that the clock or enable signal remains at an active logic level (high or low), allowing any input changes to immediately propagate to the output while enabled. In contrast, edge-sensitive circuits (such as flip-flops) sample their inputs and update their output state only at a discrete transition of the clock signal—such as the rising edge (posedge clk) used in our d_ff module—ignoring input changes at all other times and preventing unintended transparency or race conditions.

### Why is it important to declare initial state?
Sequential circuits depend on feedback from their current state to determine their next state; for example, our jk_ff computes D=(J*K')+(K'*Q) and t_ff toggles based on existing Q and Q' values. Without declaring a known initial state (such as initial q <= 1'b0; in d_ff), the outputs start as unknown (X) in simulation (or an unpredictable power-up state on hardware), causing the feedback loop to evaluate to X and remain stuck in an unresolvable state.

### What do edge sensitive circuits let us build?
Because edge-sensitive flip-flops prevent continuous signal transparency and update synchronously on a shared clock edge, they allow us to safely feed outputs back into combinational logic to build complex synchronous sequential circuits, including:
-Counters and Frequency Dividers (by chaining T or JK flip-flops in toggle mode)
-Registers and Shift Registers (for storing multi-bit values and shifting data serially or in parallel)
-Finite State Machines (FSMs) (such as sequence detectors, control units, and protocol controllers)
-CPU Datapath and Memory Components (such as program counters, instruction registers, and pipeline stages)
