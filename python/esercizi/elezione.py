from threading import Lock, Condition

class Elezione:
    def __init__(self, candidati : list, elettori : int):
        self.candidati = candidati
        self.voti = [0] * len(self.candidati)
        self.elettori = elettori
        self.votato = 0
        self.aperta = False
        self.chiusa = False
        self.lock = Lock()
        self.condAperta = Condition(self.lock)
        self.condChiusa = Condition(self.lock)
        
    def apriElezione(self):
        if(self.aperta):
            print("l'elezione è già stata aperta")
            return
        with self.lock:
            self.aperta = True
            self.condAperta.notifyAll()
            
    def chiudiElezione(self):
        if(not self.aperta):
            print("l'elezione non è stata ancora aperta")
            return 
        if(self.chiusa):
            print("l'elezione è già stata chiusa")
            return 
        with self.lock:
            self.chiusa = True
            self.condChiusa.notifyAll()
    
    def vota(self, candidato):
        if(self.chiusa):
            print("non si può votare, l'elezione è chiusa")
            return 
        with self.lock:
            if(not self.aperta):
                self.condAperta.wait()
            if(self.votato >= self.elettori):
                print("il numero di voti ha superato il numero degli elettori")
                return
            i = 0
            for cand in self.candidati:
                if(cand == candidato):
                    self.voti[i] += 1
                    self.votato += 1
                    return
                i += 1
                    
    def getVoti(self):
        return self.votato
    
    def waitForRisultati(self):
        with self.lock:
            if(not self.chiusa):
                self.condChiusa.wait()
            risultato = [None] * len(self.candidati)
            for i in range(len(self.candidati)):
                max = -1
                cand = 0
                for j in range(len(self.candidati)):
                    if(self.voti[j] >= max):
                        max = self.voti[j]
                        cand = j
                risultato[i] = self.candidati[cand]
                self.voti[cand] = -1
            return risultato
                    
    
    
    
    
    
    
    
    
    
    
    
    