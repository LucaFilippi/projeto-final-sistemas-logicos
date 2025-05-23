ALU Project (Arithmetic Logic Unit) – Digital Systems
This repository contains the complete ALU project developed by Luca Filippi and Lorena Villagelin as the final assignment for the Digital Systems course (1st semester of 2025).

Objective
To implement an Arithmetic Logic Unit (ALU) capable of executing the following operations on two 4-bit operands (a and b), controlled by a 3-bit operation selector (ALUOp):

Implemented Operations
ALUOp	Operation	Description
000	NOP	Result = 0000
001	AND	a AND b bitwise
010	OR	a OR b bitwise
011	NOT	NOT b (bitwise)
100	ADD	Addition (a + b) using Ripple Carry
101	SUB	Subtraction (a - b) using Ripple Carry
110	MUL	Multiplication of a1a0 × b1b0
111	COMP	Comparison (a == b, a > b, a < b)

Additional Outputs
Zero: Active if Result == 0000

Overflow: Active if overflow occurs in ADD or SUB

CarryOut: Carry out from ADD/SUB operations

Equ, Grt, Lst: Outputs for equality, greater than, or less than

Modular Components
To ensure organization and reusability, the following components were implemented in separate files:

full_adder.vhd: 1-bit full adder

adder_4bit.vhd: 4-bit adder using full adders

mult_2bit.vhd: 2-bit multiplier

comparator.vhd: 4-bit comparator

ula.vhd: Main ALU component

All modules were designed using logic gate level as required.

Simulation
Simulations were conducted in ModelSim, with all tests confirming correct functionality for the proposed operations.

FPGA Implementation
The ALU was successfully implemented and tested on the FPGA board. The input/output mappings are as follows:

Input/Output	Location
a	SW10 to SW7
b	SW6 to SW3
ALUOp	SW2 to SW0
Result	HEX6
a (echo)	HEX4
b (echo)	HEX2
ALUOp (echo)	HEX0
CarryOut	LEDR0
Zero	LEDR1
Overflow	LEDR2
Equ	LEDR3
Grt	LEDR4
Lst	LEDR5

Demonstration
Check out the ALU in action in the board_video.mp4 file.

Authors
Luca Filippi - https://github.com/LucaFilippi

Lorena Villagelin - https://github.com/lorena-villagelin

Notes
This project was developed entirely from scratch, without using code from the internet or AI tools.

All files were submitted according to the course requirements.