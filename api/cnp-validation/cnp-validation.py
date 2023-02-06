def ID_check(CNP):
    if CNP.isdigit()==0:
        return False
    if len(CNP)!=13:
        return False
    if int(CNP[0]) < 1 or int(CNP[0]) > 8:
        return False
    if int(CNP[3:5]) < 1 or int(CNP[3:5]) > 12:
        return False
    if int(CNP[5:7]) < 1 or int(CNP[5:7]) > 31:
        return False
    if int(CNP[7:9]) < 1 or int(CNP[7:9]) > 48:
        return False
    if int(CNP[9:12]) == 0:
        return False
    if compute_CN(CNP) != int(CNP[12]):
        return False
    return 'CNP Valid'