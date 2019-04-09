module full_adder(input [3:0] a,b, input cin, output [3:0]  S,output cout);
 wire [3:0]C;
 assign C[0] = (a[0]&b[0]) | (a[0]^b[0])&cin;
 assign C[1] = (a[1]&b[1]) | ((a[1]^b[1])&(a[0]&b[0])) | ((a[1]^b[1])&(a[0]^b[0]))&cin;
 assign C[2] = (a[2]&b[2]) | ((a[2]^b[2])&(a[1]&b[1])) |((a[2]^b[2])&(a[1]^b[1])&(a[0]&b[0])) | ((a[2]^b[2])&(a[1]^b[1])&(a[0]^b[0]))&cin;
 assign C[3] = (a[3]&b[3]) | ((a[3]^b[3])&(a[2]&b[2])) |((a[3]^b[3])&(a[2]^b[2])&(a[1]&b[1])) |((a[3]^b[3])&(a[2]^b[2])&(a[1]^b[1])&(a[0]&b[0])) |((a[3]^b[3])&(a[2]^b[2])&(a[1]^b[1])&(a[0]^b[0]))&cin;
 assign S[0] = a[0]^b[0]^cin;
 assign S[1] = a[1]^b[1]^C[0];
 assign S[2] = a[2]^b[2]^C[1];
 assign S[3] = a[3]^b[3]^C[2];
 assign cout = C[3];
endmodule
