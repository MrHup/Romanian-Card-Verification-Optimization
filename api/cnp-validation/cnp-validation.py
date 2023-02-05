def ID_check(CNP,sex,seria):
    if CNP.isdigit()==0:
        print('1')
        return False
    if len(CNP)!=13:
        print('2')
        return False
    if int(CNP[0]) < 1 or int(CNP[0]) > 8:
        print('3')
        return False