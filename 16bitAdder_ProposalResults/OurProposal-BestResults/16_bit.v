module main(input [15:0] a,b, output reg [15:0] out, output reg cout);

    wire [3:0] S1,S20,S21,S30,S31,S40,S41;
    wire c1,c20,c21,c30,c31,c40,c41;

    adder A1(a[3:0],b[3:0],0,S1,c1);
    adder A20(a[7:4],b[7:4],0,S20,c20);
    adder A21(a[7:4],b[7:4],1,S21,c21);
    adder A30(a[11:8],b[11:8],0,S30,c30);
    adder A31(a[11:8],b[11:8],1,S31,c31);
    adder A40(a[15:12],b[15:12],0,S40,c40);
    adder A41(a[15:12],b[15:12],1,S41,c41);
    
    always@*
    begin
        out[3:0] = S1;
        if(c1==0)
        begin
            out[7:4] = S20;
            if(c20==0)
            begin
                out[11:8] = S30;
                if(c30==0)
                begin
                    out[15:12] = S40;
                end
                else
                begin
                    out[15:12] = S41;
                end
            end
            else
            begin
                out[11:8] = S31;
                if(c30==0)
                begin
                    out[15:12] = S40;
                end
                else
                begin
                    out[15:12] = S41;
                end
            end
        end
        else
        begin
            out[7:4] = S21;
            if(c20==0)
            begin
                out[11:8] = S30;
                if(c30==0)
                begin
                    out[15:12] = S40;
                end
                else
                begin
                    out[15:12] = S41;
                end
            end
            else
            begin
                out[11:8] = S31;
                if(c30==0)
                begin
                    out[15:12] = S40;
                end
                else
                begin
                    out[15:12] = S41;
                end
            end
        end
    end

endmodule
