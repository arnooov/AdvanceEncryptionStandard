module AES_Encrypt_tb;

    reg [127:0] plaintext;
    reg [127:0] key;
    wire [127:0] ciphertext;

    // Instantiate the AES encryption module
    AES_Encrypt aes_inst (
        .plaintext(plaintext),
        .key(key),
        .ciphertext(ciphertext)
    );

    initial begin
        // Apply test vectors
        plaintext = 128'h3243f6a8885a308d313198a2e037073;
        key       = 128'h2b7e151628aed2a6abf7158809cf4f3c;
        
        // Wait for the encryption process to complete
        #10;
        
        // Display the results
        $display("Plaintext:  %h", plaintext);
        $display("Key:        %h", key);
        $display("Ciphertext: %h", ciphertext);
        
        // End simulation
        $finish;
    end

endmodule
