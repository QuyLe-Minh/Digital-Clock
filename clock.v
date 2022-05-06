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

module digital_clock(
    input clk,
    input enb,
    input sw0, sw1,
    input [3:0] btn,
    output reg [5:0] hour, min, sec

);
    wire p0, p1, p2, p3;
    wire [3:0] p;
    edgeDetector e0(btn[0], clk, p0);
    edgeDetector e1(btn[1], clk, p1);
    edgeDetector e2(btn[2], clk, p2);
    edgeDetector e3(btn[3], clk, p3);

    assign p = {p3, p2, p1, p0};

    always @ (posedge clk)
    begin
        //        if(sec >= 6'd59)
        //            begin   sec <=0;
        //                if( min >= 6'd59)
        //                    begin   min<=0;
        //                        if( hour >= 6'd23) hour <=0;
        //                        else hour <= hour + 6'd1;
        //                    end
        //                else min <= min + 6'd1;
        //            end
        //        else begin
        //            sec <= sec + 6'd1;
        //        end
        if(|p) begin

            case (p)
                4'b0001: begin
                    if (sw1 == 1'b1) begin
                        if (min >= 6'd59) begin
                            min <= 0;
                            if (hour >= 6'd23) hour <= 6'd0;
                            else hour <= hour+6'd1;
                        end
                        else min <= min+6'd1;
                    end
                end
                4'b0010:begin
                    if (sw1 == 1'b1) begin

                        if (hour >= 6'd23) hour <= 6'd0;
                        else hour <= hour+6'd1;
                    end
                end
            endcase
        end

        else if (enb) begin

            if(sec >= 6'd59)
                begin   
                    sec <=0;
                    if( min >= 6'd59)
                        begin   
                            min<=0;
                            if( hour >= 6'd23) hour <=0;
                            else hour <= hour + 6'd1;
                        end
                    else min <= min + 6'd1;
                end
            else begin
                sec <= sec + 6'd1;
            end
        end

    end

endmodule