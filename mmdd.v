`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2022 04:42:27 PM
// Design Name: 
// Module Name: mmdd
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


module mmdd(
    input clk,
    input enb,
    input sw1,
    input [3:0] btn,
    input [5:0] hr, min,sec,
    output [3:0] mm1,mm2,dd1,dd2
);
    reg [5:0] mm, dd;

    wire p0, p1, p2, p3;
    wire [3:0] p;
    edgeDetector e0(btn[0], clk, p0);
    edgeDetector e1(btn[1], clk, p1);
    edgeDetector e2(btn[2], clk, p2);
    edgeDetector e3(btn[3], clk, p3);

    assign p = {p3, p2, p1, p0};

    always @ (posedge clk)
    begin
        if (|p) begin
            case (p)
                4'b0001: begin
                    if (sw1 == 0) begin 
                    dd <= dd+1; 
           if (mm == 6'd1 || mm==6'd3 || mm==6'd5 || mm==6'd7 || mm == 6'd8 || mm == 6'd10) begin //tháng 1
                if (dd >= 6'd31) begin
                    dd <= 1;
                    mm <= mm + 1;
                end

            end
            else if (mm == 6'd2) begin //tháng 2
                if (dd >= 6'd28) begin
                    dd <= 1;
                    mm <= mm + 1;
                end

            end
            else if (mm == 6'd4 || mm == 6'd6 || mm == 6'd9 || mm == 6'd11) begin //tháng 4
                if (dd >= 6'd30) begin
                    dd <= 1;
                    mm <= mm + 1;
                end

            end
            else if (mm == 6'd12) begin //tháng 12
                if (dd >= 6'd31) begin
                    dd <= 1;
                    mm <= 1;
                end

            end
        end
end

                4'b0010: begin
                    if (sw1 == 0) begin
                        if (mm == 6'd12) mm <= 1;
                        else mm <= mm+6'd1;
                    end

                end
            endcase
            end
        else if (mm == 0) begin
         mm <= 1;
         dd <= 1;
         end
         end
//        else if (hr >= 6'd23 & min >= 6'd59 & sec >= 6'd59) dd <= dd+1;
        //        else if (enb) begin if (hr >= 6'd23 & min >= 6'd59 & sec >= 6'd59) dd <= dd+1; end

    assign mm2 = mm % 6'd10;
    assign mm1 = mm/ 6'd10;
    //    assign mm2 = mm%10;
    assign dd1 = dd/6'd10;
    assign dd2 = dd%6'd10;

endmodule
