module main(input [15:0] a,b, output[15:0] out,output cout);

    wire c1,c2,c3;
    adder A1(a[3:0],b[3:0],0,out[3:0],c1);
    adder A2(a[7:4],b[7:4],c1,out[7:4],c2);
    adder A3(a[11:8],b[11:8],c2,out[11:8],c3);
    adder A4(a[15:12],b[15:12],c3,out[15:12],cout);


endmodule

