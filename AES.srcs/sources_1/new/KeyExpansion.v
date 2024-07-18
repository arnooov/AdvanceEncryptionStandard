module KeyExpansion(
    input [127:0] key,
    output reg [127:0] round_keys [0:10]
);
    reg [31:0] rcon [0:10];
    integer i, j;

    function [31:0] rot_word;
        input [31:0] word;
        begin
            rot_word = {word[23:0], word[31:24]};
        end
    endfunction

    function [31:0] sub_word;
        input [31:0] word;
        reg [7:0] sbox [0:255];
        reg [31:0] sub_word_result;
        begin
            // S-Box values (hexadecimal)
            sbox[8'h00] = 8'h63; sbox[8'h01] = 8'h7c; sbox[8'h02] = 8'h77; sbox[8'h03] = 8'h7b; // etc.
            // Fill in the rest of the S-Box values
            sbox[8'hfc] = 8'h2a; sbox[8'hfd] = 8'h90; sbox[8'hfe] = 8'h88; sbox[8'hff] = 8'h16;
            
            sub_word_result = {sbox[word[31:24]], sbox[word[23:16]], sbox[word[15:8]], sbox[word[7:0]]};
            sub_word = sub_word_result;
        end
    endfunction

    initial begin
        // Rcon values
        rcon[0] = 32'h00000000; rcon[1] = 32'h01000000; rcon[2] = 32'h02000000; rcon[3] = 32'h04000000;
        rcon[4] = 32'h08000000; rcon[5] = 32'h10000000; rcon[6] = 32'h20000000; rcon[7] = 32'h40000000;
        rcon[8] = 32'h80000000; rcon[9] = 32'h1b000000; rcon[10] = 32'h36000000;
        
        // Initial round key is the original key
        round_keys[0] = key;
        
        // Key expansion algorithm
        for (i = 1; i < 11; i = i + 1) begin
            round_keys[i][127:96] = round_keys[i-1][127:96] ^ sub_word(rot_word(round_keys[i-1][31:0])) ^ rcon[i];
            round_keys[i][95:64]  = round_keys[i-1][95:64]  ^ round_keys[i][127:96];
            round_keys[i][63:32]  = round_keys[i-1][63:32]  ^ round_keys[i][95:64];
            round_keys[i][31:0]   = round_keys[i-1][31:0]   ^ round_keys[i][63:32];
        end
    end
endmodule
