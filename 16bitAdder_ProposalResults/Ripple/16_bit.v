module main(input [15:0] a,b, output [15:0] S, output cout);

    wire [15:0]C;
    
    adder F1(a[0],b[0],0,S[0],C[0]);
    adder F2(a[1],b[1],C[0],S[1],C[1]);
    adder F3(a[2],b[2],C[1],S[2],C[2]);
    adder F4(a[3],b[3],C[2],S[3],C[3]);
    adder F5(a[4],b[4],C[3],S[4],C[4]);
    adder F6(a[5],b[5],C[4],S[5],C[5]);
    adder F7(a[6],b[6],C[5],S[6],C[6]);
    adder F8(a[7],b[7],C[6],S[7],C[7]);
    adder F9(a[8],b[8],C[7],S[8],C[8]);
    adder F10(a[9],b[9],C[8],S[9],C[9]);
    adder F11(a[10],b[10],C[9],S[10],C[10]);
    adder F12(a[11],b[11],C[10],S[11],C[11]);
    adder F13(a[12],b[12],C[11],S[12],C[12]);
    adder F14(a[13],b[13],C[12],S[13],C[13]);
    adder F15(a[14],b[14],C[13],S[14],C[14]);
    adder F16(a[15],b[15],C[14],S[15],cout);

endmodule
