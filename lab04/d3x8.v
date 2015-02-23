module d3x8 (i0,i1,i2,o0,o1,o2,o3,o4,o5,o6,o7);

    output o0,o1,o2,o3,o4,o5,o6,o7;
    input i0,i1,i2;

    wire Noti0,Noti1, Noti2;

    not(Noti0, i0);
    not(Noti1, i1);//make my not wires
    not(Noti2, i2);

    and(o0,Noti0,Noti1,Noti2);
    and(o1, Noti0, Noti1, i2);
    and(o2, Noti0, i1, Noti2);
    and(o3, Noti0, i1, i2);
    and(o4, i0, Noti1, Noti2);
    and(o5, i0, Noti1, i2);
    and(o6, i0, i1, Noti2);
    and(o7, i0, i1, i2);

endmodule
