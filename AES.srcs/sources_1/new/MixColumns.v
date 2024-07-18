module MixColumns(
    input [127:0] state,
    output [127:0] new_state
);
    function [7:0] gmul;
        input [7:0] a, b;
        integer i;
        begin
            gmul = 0;
            for (i = 0; i < 8; i = i + 1) begin
                if (b[i])
                    gmul = gmul ^ a;
                if (a[7])
                    a = (a << 1) ^ 8'h1b;
                else
                    a = a << 1;
            end
        end
    endfunction

    wire [7:0] s [0:15];
    assign {s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7], s[8], s[9], s[10], s[11], s[12], s[13], s[14], s[15]} = state;

    assign new_state = {gmul(8'h02, s[0]) ^ gmul(8'h03, s[1]) ^ s[2] ^ s[3], // Column 1
                        s[0] ^ gmul(8'h02, s[1]) ^ gmul(8'h03, s[2]) ^ s[3],
                        s[0] ^ s[1] ^ gmul(8'h02, s[2]) ^ gmul(8'h03, s[3]),
                        gmul(8'h03, s[0]) ^ s[1] ^ s[2] ^ gmul(8'h02, s[3]),

                        gmul(8'h02, s[4]) ^ gmul(8'h03, s[5]) ^ s[6] ^ s[7], // Column 2
                        s[4] ^ gmul(8'h02, s[5]) ^ gmul(8'h03, s[6]) ^ s[7],
                        s[4] ^ s[5] ^ gmul(8'h02, s[6]) ^ gmul(8'h03, s[7]),
                        gmul(8'h03, s[4]) ^ s[5] ^ s[6] ^ gmul(8'h02, s[7]),

                        gmul(8'h02, s[8]) ^ gmul(8'h03, s[9]) ^ s[10] ^ s[11], // Column 3
                        s[8] ^ gmul(8'h02, s[9]) ^ gmul(8'h03, s[10]) ^ s[11],
                        s[8] ^ s[9] ^ gmul(8'h02, s[10]) ^ gmul(8'h03, s[11]),
                        gmul(8'h03, s[8]) ^ s[9] ^ s[10] ^ gmul(8'h02, s[11]),

                        gmul(8'h02, s[12]) ^ gmul(8'h03, s[13]) ^ s[14] ^ s[15], // Column 4
                        s[12] ^ gmul(8'h02, s[13]) ^ gmul(8'h03, s[14]) ^ s[15],
                        s[12] ^ s[13] ^ gmul(8'h02, s[14]) ^ gmul(8'h03, s[15]),
                        gmul(8'h03, s[12]) ^ s[13] ^ s[14] ^ gmul(8'h02, s[15])};
endmodule
