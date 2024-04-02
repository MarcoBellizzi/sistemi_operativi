import threading,multiprocessing,time,math

from threading import Lock,Condition,Thread

class Barrier:
    
    def __init__(self,n):
    
        self.soglia = n
        self.threadArrivati = 0
        self.lock = Lock()
        self.condition = Condition(self.lock)

    def wait(self):
        self.lock.acquire()
        self.threadArrivati += 1

        if self.threadArrivati == self.soglia:
            self.condition.notifyAll()

        while self.threadArrivati < self.soglia:
            self.condition.wait()

        self.lock.release()

class Macinatore(Thread):

    def __init__(self,min,max,b):

        Thread.__init__(self)
        self.min = min
        self.max = max
        self.totale = 0
        self.barriera = b

    def eprimo(self,n):
        if n <= 3:
            return True
        if n % 2 == 0:
            return False
        for i in range(3,int(math.sqrt(n)+1),2):
            if n % i == 0:
                return False
        return True

    def contaPrimiSequenziale(self):

        for i in range(self.min,self.max+1):
        
            if (self.eprimo(i)):
                self.totale += 1

    
    def getTotale(self):
        return self.totale
    
    def run(self):
        self.contaPrimiSequenziale()
        self.barriera.wait()



def contaPrimiMultiThread(min,max):

    if max < min:
        return 0
   
    threadReali = multiprocessing.cpu_count()
    fetta = (max - min + 1) // threadReali
    while fetta == 0:
        threadReali -= 1
        fetta = (max - min + 1) // threadReali
    print("Userò {} core".format(threadReali))
    
    b = Barrier(threadReali + 1)

    ciucci = []
    
    for i in range(threadReali - 1):
        minI = min + i * fetta
        maxI = min + fetta - 1
        ciucci.append(Macinatore(minI, maxI, b))
        ciucci[i].start()
    
    ciucci.append(Macinatore(min + (threadReali - 1) * fetta, max, b))
    ciucci[threadReali - 1].start()

    b.wait()

    totale = 0
    for i in range(threadReali):
        totale += ciucci[i].getTotale()
    return totale
    
if __name__ == '__main__':
    start = time.time()
    minimo = 100000
    massimo = 1000000
    print ("Primi tra {} e {}: {}".format(minimo,massimo,contaPrimiMultiThread(minimo, massimo)))
    elapsed = time.time() - start
    print("Tempo trascorso: %f secondi." % elapsed)
