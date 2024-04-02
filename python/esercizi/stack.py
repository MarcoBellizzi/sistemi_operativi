#
# molto facile
#

from threading import Lock, Condition

class Stack:
    def __init__(self, n):
        self.n = n
        self.stack = [None] * self.n
        self.lock = Lock()
        self.condPieno = Condition(self.lock)
        self.condVuoto = Condition(self.lock)
        self.condInserito = Condition(self.lock)
        
        self.ins = 0
    
    def put(self, oggetto): # aggiunge in cima
        with self.lock:
            while(self.ins == self.n):
                self.condPieno.wait()
            self.stack[self.ins] = oggetto
            if(self.ins == 0):
                self.condVuoto.notifyAll()
            self.ins += 1
            self.condInserito.notifyAll()
    
    def take(self): # preleva dalla cima
        with self.lock:
            while(self.ins == 0):
                self.condVuoto.wait()
            if(self.ins == self.n):
                self.condPieno.notifyAll()
            self.ins -= 1
            return self.stack[self.ins]
    
    def takeOgg(self, oggetto): # cerca l'oggetto e lo preleva
        with self.lock:
            i = 0
            trovato = False
            while(not trovato):
                for j in range(self.ins):
                    if(self.stack[j] == oggetto):
                        i = j
                        trovato = True
                if(not trovato):
                    self.condInserito.wait()
            oggetto2 = self.stack[i]
            for j in range(i,self.ins - 1):
                self.stack[j] = self.stack[j+1]
            self.ins -= 1
            return oggetto2    
    
    
    
    