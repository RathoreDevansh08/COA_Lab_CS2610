module four_bit(input [3:0]a, [3:0]b ,input cin,output [3:0] out, output cout);

wire [2:0] C;

assign C[0]=a[0]&b[0] | (a[0]^b[0])&(cin);
assign C[1]=a[1]&b[1] | (a[1]^b[1])&(a[0]&b[0] | (a[0]^b[0])&(cin));
assign C[2]=a[2]&b[2] | (a[2]^b[2])&(a[1]&b[1] | (a[1]^b[1])&(a[0]&b[0] | (a[0]^b[0])&(cin)));
assign cout=a[3]&b[3] | (a[3]^b[3])&(a[2]&b[2] | (a[2]^b[2])&(a[1]&b[1] | (a[1]^b[1])&(a[0]&b[0] | (a[0]^b[0])&(cin))));

assign out[0]=a[0]^b[0]^(cin);
assign out[1]=a[1]^b[1]^C[0];
assign out[2]=a[2]^b[2]^C[1];
assign out[3]=a[3]^b[3]^C[2];

endmodule
