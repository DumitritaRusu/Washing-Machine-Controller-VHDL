# Washing Machine Controller (VHDL)

This is a project I worked on with a classmate for our Digital Systems Design course. We used VHDL to build the control logic for a washing machine, with manual settings and a few preset washing programs.

The goal was to practice designing a digital system from smaller components and connecting a control unit with a datapath.

## What it does

- Supports manual settings for temperature, spin speed, prewash and extra rinse.
- Includes five preset programs: Quick Wash, Shirts, Dark Clothes, Dirty Clothes and Anti-Allergy.
- Calculates the washing time based on the selected settings.
- Uses counters to track the program duration and a one-minute delay after the washing cycle.
- Uses status LEDs for the machine and door lock, and a 7-segment display for the timer.
- Includes a VHDL testbench for a basic simulation scenario.

## Tools and technologies

- VHDL
- Xilinx Vivado (the original project was created using Vivado 2024.2)
- Finite-state machines, counters, ROM modules and multiplexers

## Project structure

- `src/` – VHDL source files, including the top-level `main` module, control unit (`UC`), datapath (`UE`) and supporting components.
- `sim/simulare.vhd` – simulation testbench (`masina_spalat_tb`).
- `create_project.tcl` – optional Vivado script to create a project and import the sources.

## How to open it

1. Open Vivado.
2. Create a new RTL project and add the `.vhd` files from `src/` as design sources.
3. Set `main` as the top module.
4. Add `sim/simulare.vhd` as a simulation source, then set `masina_spalat_tb` as the simulation top.
5. Run Behavioral Simulation to inspect the signals.

You can also run `source create_project.tcl` in the Vivado Tcl Console to create the project with the sources already added. The script uses the FPGA part (`xc7a100tcsg324-1`) from the original project.

**Note:** The original project referenced a board constraints file (`nexys7.xdc`) that was not included in the archive. To implement this on an FPGA board, you need a matching `.xdc` file with the correct pin assignments and should check the clock/timing settings. The VHDL sources are shared here as coursework and have not been re-verified on hardware in this cleaned repository.

## About this project

Working on this project helped me understand how a finite-state machine controls a datapath, how to split a larger design into VHDL modules, and how to use a testbench to observe a digital system's behavior.
