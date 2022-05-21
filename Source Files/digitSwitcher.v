`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2022 14:54:59
// Design Name: 
// Module Name: digitSwitcher
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


module digitSwitcher(rst,clk,digit0,digit1,digit2,digit3,out,en);
    input rst, clk;
    input [7:0] digit0, digit1, digit2, digit3;
    output reg [7:0] out;
    output reg [3:0] en;
    wire [7:0] digits[3:0];
    assign digits[0] = digit0; assign digits[1] = digit1; assign digits[2] = digit2; assign digits[3] = digit3;
    wire clk_1000HZ;
    reg [1:0] cnt;
    clockDivider #(50000) div (clk,rst,clk_1000HZ);
    always @(posedge clk_1000HZ, posedge rst) begin
        if (rst) begin
            out <= 4'b1111;
            cnt <= 0;
        end
        else cnt <= cnt + 1;
        out <= digits[cnt];
        en <= 4'b1111 - (1 << cnt);
    end
endmodule
