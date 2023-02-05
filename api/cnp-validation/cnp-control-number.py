def compute_CN(CNP,FNC='279146358279'):
    SC = 0 
    for i in range(12):
        SC = SC + int(CNP[i]) * int(FNC[i])
    if SC % 11 < 10:
        return SC % 11
    elif SC % 11 == 10:
        return 1