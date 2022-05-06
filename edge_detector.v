`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2022 07:48:38 AM
// Design Name: 
// Module Name: ex3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module edgeDetector(input sig, input clk, output p);
    reg [1:0] sig_ly;
    
    always @(posedge clk) begin
        sig_ly[0] <= sig;
        sig_ly[1] <= sig_ly[0];
    end
    
    assign p = sig_ly[0] & ~sig_ly[1];

endmodule