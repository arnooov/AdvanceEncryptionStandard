module ShiftRows(
    input [127:0] state,
    output [127:0] new_state
);
    wire [7:0] s [0:15];
    
    assign {s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7], s[8], s[9], s[10], s[11], s[12], s[13], s[14], s[15]} = state;

    assign new_state = {s[0], s[5], s[10], s[15],  // First row
                        s[4], s[9], s[14], s[3],   // Second row shifted left by 1
                        s[8], s[13], s[2], s[7],   // Third row shifted left by 2
                        s[12], s[1], s[6], s[11]}; // Fourth row shifted left by 3
endmodule
