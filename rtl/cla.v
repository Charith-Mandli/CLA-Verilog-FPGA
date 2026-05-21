`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: M.V.S.Charith
//
// Create Date: 07.05.2026
// Design Name: Carry Lookahead Adder (CLA)
// Module Name: top_module
// Project Name: Parameterized Carry Lookahead Adder using Verilog HDL
// Target Devices: Xilinx Zynq-7000 FPGA (xc7z010clg225-1)
// Tool Versions: Vivado
//
// Description:
// This project implements a parameterized Carry Lookahead Adder (CLA)
// architecture using Verilog HDL. The design is modularized into:
//
// 1. Generation_Propagation Module
//    - Generates Generate (G) and Propagate (P) signals
//
// 2. Carry Module
//    - Computes carry signals in parallel using carry-lookahead logic
//
// 3. Sum Module
//    - Computes final sum outputs using generated carry signals
//
// 4. top_module
//    - Performs functional verification using directed and randomized
//      test vectors
//
// Features:
// - Parameterized bit-width design
// - Modular RTL architecture
// - Randomized verification
// - Functional simulation
// - FPGA synthesis and implementation flow
//
// Dependencies:
// Vivado Simulator / Verilog HDL
//
// Revision:
// Revision 0.01 - Initial Version
//
//////////////////////////////////////////////////////////////////////////////////

// -------------------------------------------------------------
// Generation and Propagation Logic
//
// G[i] = A[i] & B[i]  -> Generate signal
// P[i] = A[i] | B[i]  -> Propagate signal
//
// These signals are used for fast carry computation.
// -------------------------------------------------------------
module Generation_Propagation #(parameter N=4)(
    input [N-1:0] A,B,
    output reg [N-1:0] G,P
    );
    integer i;
    always @(*) begin
        for(i=0; i<N; i=i+1) begin
            G[i] = A[i]&B[i];
            P[i] = A[i]|B[i];
        end
    end
endmodule

// -------------------------------------------------------------
// Carry Lookahead Logic
//
// Computes carry outputs in parallel using Generate and Propagate signals.
//
// This avoids ripple carry delay and improves speed.
//
// Carry Equation:
//
// C[i] = G[i] +
//        P[i]G[i-1] +
//        P[i]P[i-1]G[i-2] + ...
//
// The module uses nested loops to implement generalized carry-lookahead computation for parameterized width N.
// -------------------------------------------------------------
module Carry #(parameter N=8)(
    input [N-1:0] G,P,
    input C_1,
    output [N-1:0] C
    );
    integer i,j,k;
    reg [N-1:0] temp_C;
    reg term;
    
    always @(*) begin
        for(i=0; i<N; i=i+1) begin
            temp_C[i] = G[i];
            for(j =i-1;j>=0;j= j-1) begin
                term = G[j];
                for(k=i; k>j-1; k=k-1) begin
                    term = term&P[k];
                end
            temp_C[i] = temp_C[i]|term;
            end
            
            term = C_1;
            for(j=i; j>=0; j=j-1) begin
                term = term&P[j];
            end
            temp_C[i] = temp_C[i]|term;
        end
    end
    
    assign C = temp_C;
endmodule

// -------------------------------------------------------------
// Sum Computation Logic
//
// Final sum bits are computed using:
//
// Sum[i] = A[i] XOR B[i] XOR Carry_in
//
// Carry input for each stage is obtained from carry lookahead logic.
// -------------------------------------------------------------
module Sum #(parameter N=8)(
    input [N-1:0] A,B,
    input C_1,
    output Cout,
    output reg [N-1:0] sum
    );
    wire [N-1:0] G,P,C;
    Generation_Propagation#(.N(N)) gen_pro( .A(A), .B(B), .G(G), .P(P));
    Carry#(.N(N)) carry(.G(G), .P(P), .C_1(C_1), .C(C));
    assign Cout = C[N-1];
    integer i;
    always @(*) begin
        for(i=0; i<N; i=i+1) begin
            if(i==0)
               sum[0] = (A[0]^B[0])^C_1;
            else
               sum[i] = (A[i]^B[i])^C[i-1];
        end
    end
endmodule

// -------------------------------------------------------------
// Top Module
//
// Performs:
//
// 1. Top level integration
// 2. Submodule Instantiation
//
// -------------------------------------------------------------
module top_module #(parameter N=8)(
    input C_1,
    input [N-1:0] A,B,
    output Cout,
    output [N-1:0] sum
    ); 
    
    Sum#(.N(N)) cla(.A(A), .B(B), .C_1(C_1), .sum(sum), .Cout(Cout));
    
endmodule