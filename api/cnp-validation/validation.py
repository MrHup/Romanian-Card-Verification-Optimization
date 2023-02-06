from fastapi import FastAPI

app = FastAPI()

def compute_CN(cnp):
    fnc='279146358279'
    sc = 0 
    for i in range(12):
        sc = sc + int(cnp[i]) * int(fnc[i])
    if sc % 11 < 10:
        return sc % 11
    elif sc % 11 == 10:
        return 1

@app.get("/validation/{cnp}")
async def validation(cnp):
    if cnp.isdigit()==0:
        return False
    if len(cnp)!=13:
        return False
    if int(cnp[0]) < 1 or int(cnp[0]) > 8:
        return False
    if int(cnp[3:5]) < 1 or int(cnp[3:5]) > 12:
        return False
    if int(cnp[5:7]) < 1 or int(cnp[5:7]) > 31:
        return False
    if int(cnp[7:9]) < 1 or int(cnp[7:9]) > 48:
        return False
    if int(cnp[9:12]) == 0:
        return False
    if compute_CN(cnp) != int(cnp[12]):
        return False
    return True