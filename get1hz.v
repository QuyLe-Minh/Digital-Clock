`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2022 08:49:25 AM
// Design Name: 
// Module Name: get1hz
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


module get1hz(clk, enb);
    input clk;
    output reg enb;
    parameter div = 125000000;
    reg [27:0] cnt = 28'd0;
    always @(posedge clk) begin
        if (cnt >= (div-1)) cnt <= 0;
        else cnt <= cnt+1;
        enb <= (cnt == 0) ? 1:0;
    end


endmodule
