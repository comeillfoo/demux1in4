`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2022 01:17:48
// Design Name: 
// Module Name: demux_tb
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


module demux_tb;
    reg d_in, a0_in, a1_in;
    wire [ 3 : 0 ] y_out;
    
    demux demux_1(
        .d( d_in ),
        .a0( a0_in ),
        .a1( a1_in ),
        .y0( y_out[ 0 ] ),
        .y1( y_out[ 1 ] ),
        .y2( y_out[ 2 ] ),
        .y3( y_out[ 3 ] )
    );
    
    integer i;
    reg [ 2 : 0 ] test_val;
    reg [ 3 : 0 ] expected_val;
    
    initial begin
        
        for ( i = 0; i < 8; i = i + 1 ) begin
        
            test_val = i;
            d_in = test_val[ 0 ];
            a0_in = test_val[ 1 ];
            a1_in = test_val[ 2 ];
            expected_val[ 0 ] = d_in & ( ~a0_in & ~a1_in );
            expected_val[ 1 ] = d_in & ( a0_in & ~a1_in );
            expected_val[ 2 ] = d_in & ( ~a0_in & a1_in );
            expected_val[ 3 ] = d_in & ( a0_in & a1_in );
            
            #10
            
            if ( 
                y_out[ 0 ] == expected_val[ 0 ] && 
                y_out[ 1 ] == expected_val[ 1 ] && 
                y_out[ 2 ] == expected_val[ 2 ] && 
                y_out[ 3 ] == expected_val[ 3 ]
            ) begin
                $display( "The demux output is correct!!! d_in=%b, a0_in = %b, a1_in = %b, y_out = %b", d_in, a0_in, a1_in, y_out );
            end else begin
                $display( "The demux output is incorrect!!! d_in=%b, a0_in = %b, a1_in = %b, y_out = %b, expected = %b", d_in, a0_in, a1_in, y_out, expected_val ); 
            end
        end
        
        #10 $stop;
    end
endmodule
