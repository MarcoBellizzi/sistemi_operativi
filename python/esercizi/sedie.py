from threading import Thread, Lock
from time import sleep
from random import randint

lock = Lock()
sedie = []

class Display(Thread):
    def __init__(self,sedie):
        Thread.__init__(self)
        self.sedie = sedie
        
    def run(self):
        i = 0
        while i < 100:
            print(sedie)
            sleep(1)
            i += 1

class Partecipante(Thread):
    def __init__(self, sedie, n):
        Thread.__init__(self)
        self.sedie = sedie
        self.n = n

    def run(self):
        trovato = False
        while not trovato:
            lock.acquire()
            r = randint(0,len(sedie)-1)
            if sedie[r] == 0:
                sedie[r] = self.n
                trovato = True
            sleep(1)
            lock.release()
        print ("thread " + str(self.n) + " terminato")
        

if __name__ == '__main__':

    n = input("inserisci un numero\n")

    for _ in range(n):
        sedie.append(0)

    display = Display(sedie)
    display.start()
        
    for i in range(n+1):
        partecipante = Partecipante(sedie,i+1)
        partecipante.start()
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    