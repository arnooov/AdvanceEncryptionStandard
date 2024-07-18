module SubBytes(
    input [127:0] state,
    output [127:0] new_state
);
    reg [7:0] sbox [0:255];

    initial begin
        // S-Box values (hexadecimal)
        sbox[8'h00] = 8'h63; sbox[8'h01] = 8'h7c; sbox[8'h02] = 8'h77; sbox[8'h03] = 8'h7b; // etc.
        // Fill in the rest of the S-Box values
        sbox[8'hfc] = 8'h2a; sbox[8'hfd] = 8'h90; sbox[8'hfe] = 8'h88; sbox[8'hff] = 8'h16;
    end

    function [7:0] sbox_lookup;
        input [7:0] byte_in;
        begin
            sbox_lookup = sbox[byte_in];
        end
    endfunction

    assign new_state = {sbox_lookup(state[127:120]), sbox_lookup(state[119:112]), sbox_lookup(state[111:104]), sbox_lookup(state[103:96]),
                        sbox_lookup(state[95:88]), sbox_lookup(state[87:80]), sbox_lookup(state[79:72]), sbox_lookup(state[71:64]),
                        sbox_lookup(state[63:56]), sbox_lookup(state[55:48]), sbox_lookup(state[47:40]), sbox_lookup(state[39:32]),
                        sbox_lookup(state[31:24]), sbox_lookup(state[23:16]), sbox_lookup(state[15:8]), sbox_lookup(state[7:0])};

endmodule
