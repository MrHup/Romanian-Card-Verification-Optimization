from fastapi import FastAPI

app = FastAPI()
@app.get("/compute_cn/{cnp}")
async def compute_cn(cnp):
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
        return {"success":False, "reason":"The CNP is not numeric."}
    if len(cnp)!=13:
        return {"success":False, "reason":"The CNP does not have an acceptable size."}
    if int(cnp[0]) < 1 or int(cnp[0]) > 8:
        return {"success":False, "reason":"Sex digit not valid."}
    if int(cnp[3:5]) < 1 or int(cnp[3:5]) > 12:
        return {"success":False, "reason":"Birth month digits not valid."}
    if int(cnp[5:7]) < 1 or int(cnp[5:7]) > 31:
        return {"success":False, "reason":"Birth day not valid."}se
    if int(cnp[7:9]) < 1 or int(cnp[7:9]) > 52:
        return {"success":False, "reason":"County code not valid."}
    if int(cnp[9:12]) == 0:
        return {"success":False, "reason":"Sequential number not valid."}
    if compute_cn(cnp) != int(cnp[12]):
        return {"success":False, "reason":"Control number not valid."}
    return {"success":True, "reason":"All good."}