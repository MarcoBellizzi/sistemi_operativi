#
# molto facile
#

from threading import Lock, Condition

class Semaforo:
    def __init__(self, permessi : int):
        self.permessi = permessi
        self.limitazione = False
        self.limite = 0
        self.lock = Lock()
        self.condVuoto = Condition(self.lock)
        
        
    def acquire(self):
        with self.lock:
            while(self.permessi == 0):
                self.condVuoto.wait()
            self.permessi -= 1
    
    def release(self):
        with self.lock:
            if(self.limitazione):
                if(self.permessi == self.limite):
                    return
            self.permessi += 1
            self.condVuoto.notifyAll()
    
    def limita(self, n : int):
        with self.lock:
            if(n == 0):
                self.limitazione = False
                self.limite = 0
            else:
                self.limitazione = True
                self.limite = n
    
    def getPermessi(self):
        return self.permessi
    
    def getPermessiMax(self):
        if(self.limitazione):
            return self.limite
        return 0
    
semaforo = Semaforo(3)
print(semaforo.getPermessi())
semaforo.limita(5)
print(semaforo.getPermessi())
semaforo.release()
print(semaforo.getPermessi())
semaforo.release()
print(semaforo.getPermessi())
semaforo.release()
print(semaforo.getPermessi())
semaforo.acquire()
print(semaforo.getPermessi())





    
    