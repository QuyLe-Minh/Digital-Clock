`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 08:49:37 PM
// Design Name: 
// Module Name: policeSiren
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


module policeSiren(enb, clk_in, clk_out_red, clk_out_blue);
    input enb;
    input clk_in;
    output reg clk_out_red, clk_out_blue;
    reg [27:0] counter = 28'd0;
    parameter Div = 125000000;
    always @(posedge clk_in) begin
        if (enb) begin
            counter <= counter+28'd1;
            if (counter >= (Div-1)) counter <= 28'd0;
            clk_out_red <= (counter < Div/2)? 1'b1:1'b0;
            clk_out_blue <= ~clk_out_red;
        end
    end
endmodule
