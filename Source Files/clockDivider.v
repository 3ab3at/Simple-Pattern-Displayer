`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2022 14:58:12
// Design Name: 
// Module Name: clockDivider
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


module clockDivider #(parameter n = 5000000)(clk,rst,clk_out);
    input clk, rst;
    output reg clk_out;
    reg [31:0] cnt;
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            clk_out <= 0;
            cnt <= 0;
        end
        else begin
            if (cnt == n - 1) begin
                clk_out <= ~clk_out;
                cnt <= 0;
            end
            else 
                cnt <= cnt + 1;
        end
    end
endmodule
