    lw 0 1 one
    lw 0 2 neg1
    add 1 2 3
    beq 0 3 2
    add 1 2 3
    noop
done halt
one    .fill 1
neg1   .fill -1 
