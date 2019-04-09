module main(input [15:0] a,b, output [15:0] S,output cout);


    wire [15:0] C;
    
    full_adder F1(a[0],b[0],0,S[0],C[0]);
    full_adder F2(a[1],b[1],C[0],S[1],C[1]);
    full_adder F3(a[2],b[2],C[1],S[2],C[2]);
    full_adder F4(a[3],b[3],C[2],S[3],C[3]);
    full_adder F5(a[4],b[4],C[3],S[4],C[4]);
    full_adder F6(a[5],b[5],C[4],S[5],C[5]);
    full_adder F7(a[6],b[6],C[5],S[6],C[6]);
    full_adder F8(a[7],b[7],C[6],S[7],C[7]);
    full_adder F9(a[8],b[8],C[7],S[8],C[8]);
    full_adder F10(a[9],b[9],C[8],S[9],C[9]);
    full_adder F11(a[10],b[10],C[9],S[10],C[10]);
    full_adder F12(a[11],b[11],C[10],S[11],C[11]);
    full_adder F13(a[12],b[12],C[11],S[12],C[12]);
    full_adder F14(a[13],b[13],C[12],S[13],C[13]);
    full_adder F15(a[14],b[14],C[13],S[14],C[14]);
    full_adder F16(a[15],b[15],C[14],S[15],cout);


endmodule			
