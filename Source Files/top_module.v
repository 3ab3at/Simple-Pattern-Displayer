`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2022 14:52:11
// Design Name: 
// Module Name: top_module
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


module top_module(x,y,z,w,u,clk,rst,cathodes,anodes);
    input x,y,z,w,u,clk,rst;
    output [7:0] cathodes;
    output  [3:0] anodes;
    parameter up = 8'b00111001, down = 8'b11000101, OFF = 8'b11111111;
    reg [7:0] digits [3:0];
    integer i;
    always @(posedge clk) begin
        if (rst)
            for (i = 0; i < 4; i = i + 1) digits[i] <= OFF;
        else begin
            if (x) begin
                digits[0] <= (u) ? up : down;
                for (i = 0; i < 4; i = i + 1) if (i != 0) digits[i] <= OFF;
            end
            else if (y) begin
                digits[1] <= (u) ? up : down;
                for (i = 0; i < 4; i = i + 1) if (i != 1) digits[i] <= OFF;
            end
            else if (z) begin
                digits[2] <= (u) ? up : down;
                for (i = 0; i < 4; i = i + 1) if (i != 2) digits[i] <= OFF;
            end
            else if (w) begin
                digits[3] <= (u) ? up : down;
                for (i = 0; i < 4; i = i + 1) if (i != 3) digits[i] <= OFF;
            end
        end
    end
    digitSwitcher switch(rst,clk,digits[0],digits[1],digits[2],digits[3],cathodes,anodes);
endmodule
