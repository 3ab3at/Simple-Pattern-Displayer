`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2022 15:34:32
// Design Name: 
// Module Name: new_top_module
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


module new_top_module(clk,en,rst,pause,cathodes, anodes);
    input clk, en,rst,pause;
    output [7:0] cathodes;
    output [3:0] anodes;
    reg [7:0] digits [3:0];
    wire [7:0] up = 8'b00111001, down = 8'b11000101, OFF = 8'b11111111;
    reg[1:0] cnt_hor;
    reg cnt_ver;
    wire clk_1HZ;
    clockDivider div(clk,rst,clk_1HZ);
    integer i;
    always @(posedge clk_1HZ) begin
        if (rst) begin
            for(i = 0; i < 4; i = i + 1) digits[i] <= 8'b11111111;
            cnt_ver <= 0; cnt_hor <= 0;
        end
        else begin
            if (pause) begin
                cnt_hor <= cnt_hor;
                cnt_ver <= cnt_ver;
            end
            else begin
                if (cnt_ver == 0) begin
                    if (cnt_hor == 3) cnt_ver <= 1;
                    else cnt_hor <= cnt_hor + 1;
                end
                else if (cnt_ver == 1) begin
                    if (cnt_hor == 0) cnt_ver <= 0;
                    else cnt_hor <= cnt_hor + 3;
                end
            end
        end
        for (i = 0; i < 4; i = i + 1) if (i == cnt_hor) digits[i] <= cnt_ver ? down : up; else digits[i] <= OFF;
    end
    digitSwitcher switch(rst,clk,digits[en ? 0 : 3],digits[en ? 1 : 2],digits[en ? 2 : 1],digits[en ? 3 : 0],cathodes,anodes);
endmodule
