    lw 0 1 six
    lw 0 2 neg2
    add 0 1 3
start add 1 2 1
    nand 3 1 3
    beq 0 1 2
    beq 0 0 start
    noop
done halt
six    .fill 6
neg2   .fill -2
stAddr .fill start
