`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2022 01:05:10
// Design Name: 
// Module Name: demux
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


module demux(
    input d,
    input a0,
    input a1,
    output y0,
    output y1,
    output y2,
    output y3
    );
    
    wire not_a0, not_a1, not_d;
    wire [ 3 : 0 ] tmp;
    wire [ 3 : 0 ] not_tmp;
    
    nor( not_d, d, d );
    
    nor( not_a0, a0, a0 );
    nor( not_a1, a1, a1 );
    
    nor( tmp[ 0 ], a0, a1 );
    nor( tmp[ 1 ], not_a0, a1 );
    nor( tmp[ 2 ], a0, not_a1 );
    nor( tmp[ 3 ], not_a0, not_a1 ); 
   
    nor( not_tmp[ 0 ], tmp[ 0 ], tmp[ 0 ] );
    nor( not_tmp[ 1 ], tmp[ 1 ], tmp[ 1 ] );
    nor( not_tmp[ 2 ], tmp[ 2 ], tmp[ 2 ] );
    nor( not_tmp[ 3 ], tmp[ 3 ], tmp[ 3 ] );
    
    nor( y0, not_tmp[ 0 ], not_d );
    nor( y1, not_tmp[ 1 ], not_d );
    nor( y2, not_tmp[ 2 ], not_d );
    nor( y3, not_tmp[ 3 ], not_d ); 
    
endmodule
