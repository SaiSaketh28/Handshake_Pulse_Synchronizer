`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2024 23:00:47
// Design Name: 
// Module Name: hpc
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


module hpc (
    input sinput,
    input src_clkA,
    input src_clkB,
    input rstA,
    input rstB,
    output syncout,
    output busy
);

    reg w1, w2, w3, w4, w5, w6;
    always @(posedge src_clkA or negedge rstA) begin
        if (!rstA)
            begin
                w1 <= 0;
            end
        else
            begin
                if(sinput)
                    begin
                        w1<=1;
                    end
                else
                    begin
                        if(w6)
                            begin
                                w1 <= 0;
                            end
                        else
                            begin
                                w1 <=w1;
                            end
                    end
            end
    end

    always @(posedge src_clkB or negedge rstB) begin
        if(!rstB)
            begin
                w2 <= 0;
                w3 <= 0;
                w4 <= 0;
            end
        w2 <= w1;
        w3 <= w2;
        w4 <= w3;
    end
    assign syncout = w3 & ~w4;
    always @(posedge src_clkA or negedge rstA)begin
        if(!rstA)
            begin
                w5 <= 0;
                w6 <= 0;
            end
        else 
            begin
                w5 <= w3;
                w6 <= w5;
            end
    end
    assign busy = w1|w6;
    
endmodule