module trevor_yager_lab1 (Out, InA, InB, InC);
output Out;
input InA, InB, InC;

wire YBC, NotInB;

not (NotInB, InB);
and (YBC, NotInB, InC);
or (Out, InA, YBC);

endmodule
