module lab1(OutF, InA, InB, InC);
output OutF;
input InA, InB, InC;

wire notB; //wire for not B
wire BC; //output of B * C;

not(notB, InB);

and(BC, InC, notB);
or(OutF, BC, InA);
endmodule
