from threading import Thread, Lock, Condition
from time import sleep

class Negozio:
    
    def __init__(self):
        self.sedie = [None] * 10
            
        self.i = 0
        self.o = 0
        self.clienti = 0
        
        self.poltrona = "sta dormendo"
        
        self.lock = Lock()
        self.dormendo = Condition(self.lock)
       
       
    def serviCliente(self):
        
        with self.lock:
            
            while(self.clienti == 0):
                self.dormendo.wait()
                
            if self.i == self.o:
                return 
            
            self.poltrona = "taglia i capelli "
            
            tempo = self.sedie[self.o]
            
            self.sedie[self.o] = None
            
            self.o = (self.o + 1) % 10
            
        while(tempo > 0):
            sleep(1)
            tempo -= 1
            
        self.poltrona = "dorme "
        self.clienti -= 1
                
    def entra(self,n):
        
        if self.clienti == 10:
            return
        
        with self.lock:
        
            self.sedie[self.i] = n
        
            self.i = (self.i + 1) % 10
            
            self.clienti += 1
            
            self.dormendo.notifyAll()
            
    def stampa(self):
        
        with self.lock:
            
            print(self.poltrona)
            print(self.sedie)
        
        

class Barbiere(Thread):
    
    def __init__(self,neg):
        Thread.__init__(self)
        self.negozio = neg

    def run(self):
        while True:
            self.negozio.serviCliente()

class Cliente(Thread):
    def __init__(self,neg,n):
        Thread.__init__(self)
        self.negozio = neg
        self.n = n
        
    def run(self):
        self.negozio.entra(self.n)
        
        
class Display(Thread):
    def __init__(self,neg):
        Thread.__init__(self)
        self.negozio = neg
        
    def run(self):
        while(True):
            self.negozio.stampa()
            print(self.negozio.clienti)
            sleep(1)
#
# Main
#       
negozio = Negozio()

display = Display(negozio)
display.start()

barbiere = Barbiere(negozio)
barbiere.start()

cliente1 = Cliente(negozio,5)
cliente2 = Cliente(negozio,7)
cliente3 = Cliente(negozio,5)
cliente4 = Cliente(negozio,4)
cliente5 = Cliente(negozio,8)
cliente6 = Cliente(negozio,5)

cliente1.start()
sleep(7)
cliente2.start()
sleep(2)
cliente3.start()
sleep(2)
cliente4.start()
sleep(4)
cliente5.start()
sleep(2)
cliente6.start()      
        
        
        
        
        
        
        

