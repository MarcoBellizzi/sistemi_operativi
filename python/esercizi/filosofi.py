import time, random
from threading import Thread,Lock,Condition


class Bacchetta:
    
    def __init__(self):
        self.occupata = False

    def lasciaBacchetta(self):
        self.occupata = False
        
    def prendiBacchetta(self):
        self.occupata = True

class Tavolo:

    def __init__(self):
        self.lock = Lock();
        self.cond = Condition(self.lock)
        self.bacchetta = []
        for _ in range(0,5):
            self.bacchetta.append(Bacchetta())

    def mollaLockSimultaneo(self,posizione):
        self.lock.acquire()
        self.bacchetta[posizione].occupata = False
        self.bacchetta[(posizione + 1) % 5].occupata = False
        self.cond.notifyAll()
        self.lock.release()
    

    def prendiLockSimultaneo(self,posizione): 
        self.lock.acquire()
        while(self.bacchetta[posizione].occupata or self.bacchetta[(posizione + 1) % 5].occupata):
            self.cond.wait()
            
        self.bacchetta[posizione].occupata = True
        self.bacchetta[(posizione + 1) % 5].occupata = True
        self.lock.release()



class Filosofo(Thread):
    
    def __init__(self,tavolo,pos):
        Thread.__init__(self)
        self.posizione = pos
        self.t = tavolo
        self.name = "Philip %s" % pos


    def attesaCasuale(self,msec):
        time.sleep(random.randrange(msec)/1000.0)

    def mangia(self):
        print("Il filosofo %s vuole mangiare." % self.name)
        self.t.prendiLockSimultaneo(self.posizione)
        print("Il filosofo %s comincia a mangiare." % self.name)
        self.attesaCasuale(500)
        print("Il filosofo %s smette di mangiare." % self.name)
        self.t.mollaLockSimultaneo(self.posizione)
        print("Il filosofo %s lascia le bacchette." % self.name)

    def pensa(self):
        print("Il filosofo %s pensa." % self.name)
        self.attesaCasuale(4000)
        print("Il filosofo %s smette di pensare." % self.name)

    def run(self):
        while True:
            self.pensa()
            self.mangia()


tavolo = Tavolo()
filosofi = []
for i in range(0,5):
    f = Filosofo(tavolo,i)
    filosofi.append(f)
    f.start()
