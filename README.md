 Washing Machine Controller (VHDL)

This is a project I worked on with a classmate for our Digital Systems Design course. We used VHDL to build the control logic for a washing machine, with manual settings and a few preset washing programs.

The goal was to practice designing a digital system from smaller components and connecting a control unit with a datapath.

 What it does

- Supports manual settings for temperature, spin speed, prewash and extra rinse.
- Includes five preset programs: Quick Wash, Shirts, Dark Clothes, Dirty Clothes and Anti-Allergy.
- Calculates the washing time based on the selected settings.
- Uses counters to track the program duration and a one-minute delay after the washing cycle.
- Uses status LEDs for the machine and door lock, and a 7-segment display for the timer.
- Includes a VHDL testbench for a basic simulation scenario.

 Tools and technologies

- VHDL
- Xilinx Vivado (the original project was created using Vivado 2024.2)
- Finite-state machines, counters, ROM modules and multiplexers

Working on this project helped me understand how a finite-state machine controls a datapath, how to split a larger design into VHDL modules, and how to use a testbench to observe a digital system's behavior.
