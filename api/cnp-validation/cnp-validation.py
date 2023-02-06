def ID_check(CNP,sex):
    if CNP.isdigit()==0:
        print('1')
        return False
    if len(CNP)!=13:
        print('2')
        return False
    if int(CNP[0]) < 1 or int(CNP[0]) > 8:
        print('3')
        return False
    if sex=='M' and int(CNP[0]) % 2 == 0:
        print('4')
        return False
    if sex=='F' and int(CNP[0]) % 2 == 1:
        print('5')
        return False
    if int(CNP[3:5]) < 1 or int(CNP[3:5]) > 12:
        print('6')
        return False
    if int(CNP[5:7]) < 1 or int(CNP[5:7]) > 31:
        print('7')
        return False
    if seria in Serii == False:
        print('8')
        return False
    if compute_CN(CNP) != int(CNP[12]):
        return False