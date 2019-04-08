module sixteen_bit(input [15:0]a,[15:0]b, output [15:0] out, output cout);

wire r1,r2,r3;
    four_bit F1(a[3:0],b[3:0],0,out[3:0],r1);
    four_bit F2(a[7:4],b[7:4],r1,out[7:4],r2);
    four_bit F3(a[11:8],b[11:8],r2,out[11:8],r3);
    four_bit F4(a[15:12],b[15:12],r3,out[15:12],cout);

endmodule
