`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: M.V.S.Charith
//
// Create Date: 07.05.2026
// Design Name: Carry Lookahead Adder (CLA)
// Module Name: tb_top_module
// Project Name: Parameterized Carry Lookahead Adder using Verilog HDL
// Target Devices: Xilinx Zynq-7000 FPGA (xc7z010clg225-1)
// Tool Versions: Vivado
//
// Description:
// This file implements the testbench for the parameterized
// Carry Lookahead Adder (CLA) design.
//
// The testbench performs:
//
// 1. Directed functional testing
// 2. Overflow verification
// 3. Carry propagation verification
// 4. Randomized verification testing
// 5. Output monitoring and correctness checking
//
// The DUT outputs are continuously compared against expected
// arithmetic results using:
//
// Expected = A + B + Cin
//
// Features:
// - Parameterized verification
// - Randomized test generation
// - Functional waveform generation
// - Automated mismatch detection
//
// Dependencies:
// LCA_Code.v
// Vivado Simulator
//
// Revision:
// Revision 0.01 - Initial Version
//
//////////////////////////////////////////////////////////////////////////////////
module tb_top_module #(parameter N=4);
    reg C_1;
    reg [N-1:0] A,B;
 
    wire Cout;
    wire [N-1:0] sum;
    reg [N:0] expected;
    
    top_module #(.N(N)) dut ( .A(A), .B(B), .C_1(C_1), .sum(sum), .Cout(Cout));
    
    initial begin
        $dumpfile("LCA_variables.vcd");
        $dumpvars(0, tb_top_module); 
    end
    
    initial begin
        $monitor( " Time = %t, A = %b, B= %b, C_in = %b, Sum = %b, Cout = %b, Match=%d", $time, A, B, C_1, sum, Cout, (A+B+C_1=={Cout,sum}));
        
        A= {N{1'b0}};  B = {N{1'b0}}; C_1 = 0;
       
        #5 A= {N{1'b1}};  B = 1; C_1 = 0;
        #5 A= {N{1'b1}};  B = {N{1'b0}}; C_1 = 1;
        #5 A= {N{1'b1}};  B = {N{1'b1}}; C_1 = 0;
        #5 A= 1;  B = 1; C_1 = 1;
        
        #300 $finish;
    end
    
    initial begin
        #50
        repeat(50) begin
    
        A = $random;
        B = $random;
        C_1 = $random;
        expected = A + B + C_1;
        
        #1;
        if({Cout,sum} !== expected)
            $display("Mismatch"); 
        #4;
        end
    end
endmodule
