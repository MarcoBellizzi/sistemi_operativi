#
# put(elemento):
#    while(slotPieni == dimenzione):
#        fullCond.wait()
#    buffer[ins] = elemento
#    ins = ins + 1  % dimenzione
#    if(slotPieni == 0)
#        emptyCond.notifyAll()
#    slotPieni += 1
#
# get():
#    while(slotPieni == 0)
#        emptyCond.wait()
#    elemento = buffer[out]
#    out = out + 1  % dimenzione
#    if(slotPieni == dimenzione)
#        fullCond.notifyAll()
#    slotPieni -= 1
#    return elemento