`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.07.2024 00:04:06
// Design Name: 
// Module Name: hpc_tb
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

module hpc_tb;
    reg sinput;
    reg src_clkA;
    reg src_clkB;
    reg rstA;
    reg rstB;
    wire syncout;
    wire busy;
    hpc dut (
        .sinput(sinput), 
        .src_clkA(src_clkA), 
        .src_clkB(src_clkB), 
        .rstA(rstA), 
        .rstB(rstB), 
        .syncout(syncout), 
        .busy(busy)
    );
    always #5 src_clkA = ~src_clkA; 
    always #7 src_clkB = ~src_clkB;
    initial begin
        sinput <= 0;
        src_clkA <= 0;
        src_clkB <= 0;
        rstA <= 0;
        rstB <= 0;
        #100;
        rstA <= 1;
        rstB <= 1;
        #10;
        rstA <= 0;
        rstB <= 0;
        #10;
        rstA <= 1;
        rstB <= 1;
        #20;
        sinput = 1;
        #20;
        sinput = 0;
        #200;
        $finish;
    end
endmodule
