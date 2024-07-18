module AES_Encrypt(
    input [127:0] plaintext,
    input [127:0] key,
    output reg [127:0] ciphertext
);
    reg [127:0] state;
    reg [127:0] round_keys [0:10];
    
    wire [127:0] subbytes_out;
    wire [127:0] shiftrows_out;
    wire [127:0] mixcolumns_out;
    wire [127:0] addroundkey_out;
    
    integer i;
    
    // Instantiate SubBytes, ShiftRows, MixColumns, and AddRoundKey modules
    SubBytes subbytes_inst (.state(state), .new_state(subbytes_out));
    ShiftRows shiftrows_inst (.state(subbytes_out), .new_state(shiftrows_out));
    MixColumns mixcolumns_inst (.state(shiftrows_out), .new_state(mixcolumns_out));
    AddRoundKey addroundkey_inst (.state(mixcolumns_out), .round_key(round_keys[i]), .new_state(addroundkey_out));
    
    // Instantiate Key Expansion module
    KeyExpansion key_expansion_inst (.key(key), .round_keys(round_keys));
    
    // Initial round key assignment
    initial begin
        round_keys[0] = key;
        // Load other round keys using KeyExpansion module
        // Note: Implementation of key expansion not shown here for brevity
    end
    
    // AES encryption process
    always @(plaintext or key) begin
        state = plaintext ^ round_keys[0];
        
        for (i = 1; i < 10; i = i + 1) begin
            state = subbytes_out;
            state = shiftrows_out;
            state = mixcolumns_out;
            state = addroundkey_out;
        end
        
        // Final round (no MixColumns)
        state = subbytes_out;
        state = shiftrows_out;
        state = state ^ round_keys[10];
        
        // Output final ciphertext
        ciphertext = state;
    end

endmodule
