#
# da completare meglio
#

from threading import Thread, Lock, Condition
from time import sleep

global tabellone
global ticketChiamato 

def aggiornaTabellone(ticket):
    global tabellone
    for i in range(4):
        tabellone[i] = tabellone[i+1]
    tabellone[4] = ticket
    
def stampaTabellone():
    for i in range(5):
        print(tabellone[i])

class Sede:
    def __init__(self, n):
        self.n = n
        self.uffici = []
        for i in range(self.n):
            self.uffici.append(Ufficio(i))
            
        self.lockClienti = Lock()
        self.conditionAttesa = Condition(self.lockClienti)
        
        global tabellone
        global ticketChiamato
        tabellone = [None] * 5
        for _ in range(5):
            tabellone.append("____")
        ticketChiamato = " "
    
    def prendiTicket(self, uff):
        return self.uffici[uff].rilasciaTicket()
    
    def chiamaTicket(self, uff):
        self.uffici[uff].chiamaProssimo()  
        with self.lockClienti:
            self.conditionAttesa.notifyAll()
                
    def waitForTicket(self, ticket):
        with self.lockClienti:
            while(ticketChiamato != ticket):
                self.conditionAttesa.wait()
    
    def printAttese(self):
        pass

        
class Ufficio:
    def __init__(self, n):
        self.n = n
        
        self.coda = [None] * 10
        self.ins = 0
        self.out = 0
        
        self.utentiInAttesa = 0
        self.ticket = -1
        
        self.lock = Lock()
        self.fullcond = Condition(self.lock)
        self.emptycond = Condition(self.lock)

        
    def rilasciaTicket(self):
        with self.lock:
            self.ticket += 1
        
            while(self.utentiInAttesa == 10):
                self.fullcond.wait()
        
            self.coda[self.ins] = (str(self.n) + str(" - ") + str(self.ticket))
            aggiornaTabellone(self.coda[self.ins])
            
            self.ins = (self.ins + 1) % 10
            
            if(self.utentiInAttesa == 0):
                self.emptycond.notifyAll()
        
            self.utentiInAttesa += 1
        
            return (str(self.n) + str(" - ") + str(self.ticket))
    
    def chiamaProssimo(self):
        with self.lock:
            while(self.utentiInAttesa == 0):
                self.emptycond.wait()
            
            stampaTabellone()
            global ticketChiamato
            ticketChiamato = self.coda[self.out]
        
            self.coda[self.out] = "___"
            
            self.out = (self.out + 1) % 10
        
            if(self.utentiInAttesa == 10):
                self.fullcond.notifyAll()
        
            self.utentiInAttesa -= 1
    
class Cittadino(Thread):
    def __init__(self, sede, uff):
        Thread.__init__(self)
        self.sede = sede
        self.uff = uff
    
    def run(self):
        ticket = self.sede.prendiTicket(self.uff)
        print("un cittadino ha preso il ticket " + ticket)
        self.sede.waitForTicket(ticket)
        print("il cittadino con ticket " + ticket + " e stato chiamato")
    
class Lavoratore(Thread):
    def __init__(self, sede, uff):
        Thread.__init__(self)
        self.sede = sede
        self.uff = uff
        
    def run(self):
        while(True):
            print("il lavoratore dell'ufficio " + str(self.uff) + " chiama il prossimo ticket")
            self.sede.chiamaTicket(self.uff)
            print("il lavoratore dell'ufficio " + str(self.uff) + " sta servendo il ticket")
            sleep(5)
            

sede = Sede(1)

cittadino = Cittadino(sede,0)
cittadino.start()

cittadino2 = Cittadino(sede,0)
cittadino2.start()

cittadino3 = Cittadino(sede,0)
cittadino3.start()

cittadino4 = Cittadino(sede,0)
cittadino4.start()

lavoratore = Lavoratore(sede,0)
lavoratore.start()

    

    
    
    
    
    
    
    
    
    