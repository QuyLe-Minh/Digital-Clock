`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 10:13:06 PM
// Design Name: 
// Module Name: buttons
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


module buttons(
    input clk,
    input enb,
    input sw0, sw1,
    input [3:0] btn,
    output reg [5:0] a_hour, a_min
);

    wire p0, p1, p2, p3;
    wire [3:0] p;
    edgeDetector e0(btn[0], clk, p0);
    edgeDetector e1(btn[1], clk, p1);
    edgeDetector e2(btn[2], clk, p2);
    edgeDetector e3(btn[3], clk, p3);

    assign p = {p3, p2, p1, p0};

    always @(posedge clk)
    begin
        if(|p) begin
            //        if (clk) begin
            case (p)
                4'b0100: begin

                    if (a_min >= 6'd59) begin
                        a_min <= 0;
                        if (a_hour >= 6'd23) a_hour <= 0;
                        else a_hour <= a_hour+1;
                        end
                    else a_min <= a_min + 1;
                end
                4'b1000: begin

                    if (a_hour >= 6'd23) a_hour <= 6'd0;
                    else a_hour <= a_hour+6'd1;
                end
            endcase
        end
    end

endmodule
