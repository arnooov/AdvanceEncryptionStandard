module AddRoundKey(
    input [127:0] state,
    input [127:0] round_key,
    output [127:0] new_state
);
    assign new_state = state ^ round_key; // XOR operation for AddRoundKey
endmodule
