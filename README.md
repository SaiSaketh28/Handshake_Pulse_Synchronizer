# Handshake_Pulse_Synchronizer
- Overview
- The Handshake Pulse Synchronizer (HPC) is a Verilog module designed to synchronize pulses between two asynchronous clock domains. It ensures safe and reliable communication by generating a synchronized pulse (syncout) and managing a busy signal to prevent new pulses from being sent while the system is processing the current one.
Features
- Asynchronous Clock Domain Crossing: Safely transfers pulses between two different clock domains.
- Busy Signal Management: Ensures that new pulses are not input while the system is busy processing the current pulse.
- Reset Functionality: Provides reset capabilities for both clock domains.
- Module Description
- Ports
* sinput: Input pulse signal.
* src_clkA: Source clock for the input domain.
* src_clkB: Source clock for the output domain.
* rstA: Reset signal for the input domain.
* rstB: Reset signal for the output domain.
* syncout: Synchronized output pulse signal.
* busy: Busy signal indicating the system is processing a pulse.
- Internal Signals
* w1 to w6: Internal registers used to manage the synchronization process.
- Functionality
* Pulse Detection: The module detects an input pulse (sinput) and sets the busy signal to high.
* Pulse Synchronization: The pulse is transferred and synchronized between the two clock domains.
* Output Pulse Generation: The synchronized pulse is output on syncout.
* Busy Signal Management: The busy signal is set to low once the pulse has been processed, allowing for new pulses to be input.