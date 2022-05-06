`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2022 08:57:28 AM
// Design Name: 
// Module Name: combine
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


module combine(led1, led2, led3, led4, l_red, l_blue, sw0, sw1, btn, clk);
    input sw0, sw1;
    input [3:0] btn;
    input clk;
    output [6:0] led1, led2;
    output [6:0] led3, led4;
    output l_red, l_blue;

    wire enb;
    wire al_on;
//    wire m;
//    wire h;

//    wire mm;
//    wire dd;

    wire [3:0] h1, h2, m1, m2, dd1, dd2, mm1, mm2;
    
    reg [3:0] led1_reg, led2_reg, led3_reg, led4_reg;
    
    wire [5:0] hr, min, sec;
    wire [5:0] a_hr , a_min;
    wire [5:0] dd, mm;
    
    get1hz get(clk, enb);
    

    buttons but(clk, enb, sw0, sw1, btn, a_hr, a_min);
    digital_clock dc(clk, enb, sw0, sw1, btn, hr, min, sec);
    alarmClk alarm(clk, btn, sw0, hr, min, sec, a_hr, a_min, m1,m2,h1,h2, al_on);
    mmdd monthDate ( clk, enb, sw1, btn, hr, min, sec, mm1,mm2,dd1,dd2);
    policeSiren alert(al_on, clk, l_red, l_blue);

    display dis1(led1, led1_reg);
    display dis2(led2, led2_reg);
    display dis3(led3, led3_reg);
    display dis4(led4, led4_reg);

    //display on led whether it is mm/dd or hh/mm
    always @(sw1) begin
        if (sw1 == 1) begin
            led1_reg <= h1;
            led2_reg <= h2;
            led3_reg <= m1;
            led4_reg <= m2;
        end
        else begin
            led1_reg <= mm1;
            led2_reg <= mm2;
            led3_reg <= dd1;
            led4_reg <= dd2;
        end
    end

endmodule
