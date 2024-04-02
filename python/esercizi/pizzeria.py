from threading import Thread, Lock, Condition
from time import sleep

class Pizzeria:
    def __init__(self, dim_ordini, dim_pizze):
        self.dim_ordini = dim_ordini
        self.buffer_ordini = [None] * self.dim_ordini
        self.lock_ordini = Lock()
        self.ordini_pieni = Condition(self.lock_ordini)
        self.ordini_vuoti = Condition(self.lock_ordini)
        self.ins_ordini = 0
        self.out_ordini = 0
        self.n_ordini = 0
        
        self.cont_ordine = 0
        
        self.dim_pizze = dim_pizze
        self.buffer_pizze = [None] * self.dim_pizze
        self.lock_pizze = Lock()
        self.pizze_piene = Condition(self.lock_pizze)
        self.pizza_arrivata = Condition(self.lock_pizze)
        self.n_pizze = 0
        
    def put_ordine(self, tipo, quantita):
        with self.lock_ordini:
            while(self.n_ordini == self.dim_ordini):
                self.ordini_pieni.wait()
            self.buffer_ordini[self.ins_ordini] = Ordine(tipo, quantita, self.cont_ordine)
            self.ins_ordini = (self.ins_ordini + 1) % self.dim_ordini
            if(self.n_ordini == 0):
                self.ordini_vuoti.notifyAll()
            self.n_ordini += 1
            self.cont_ordine += 1
            return self.cont_ordine - 1
    
    def get_ordine(self):
        with self.lock_ordini:
            while(self.n_ordini == 0):
                self.ordini_vuoti.wait()
            ordine = self.buffer_ordini[self.out_ordini]
            self.buffer_ordini[self.out_ordini] = None
            self.out_ordini = (self.out_ordini + 1) % self.dim_ordini
            if(self.n_ordini == self.dim_ordini):
                self.ordini_pieni.notifyAll()
            self.n_ordini -= 1
            return ordine
            
            
    def put_pizze(self, codice):
        with self.lock_pizze:
            while(self.n_pizze == self.dim_pizze):
                self.pizze_piene.wait()
            
            posizionate = False
            for i in range(self.dim_pizze):
                if(not posizionate):
                    if(self.buffer_pizze[i] == None):
                        self.buffer_pizze[i] = codice
                        posizionate = True
                        
            self.pizza_arrivata.notifyAll()
            self.n_pizze += 1
    
    def get_pizze(self, codice):
        with self.lock_pizze:
            trovate = False
            while(not trovate):
                for i in range(self.dim_pizze):
                    if(self.buffer_pizze[i] == codice):
                        trovate = True
                        self.buffer_pizze[i] = None
                if(not trovate):
                    self.pizza_arrivata.wait()
        self.n_pizze -= 1
        
    def stampa(self):
        for ordine in self.buffer_ordini:
            if(ordine == None):
                print("_", end=' ')
            else:
                print(ordine.codice, end=' ')
                    
        print("  ---   ", end='')
                    
        for pizza in self.buffer_pizze:
            if(pizza == None):
                print("_ ", end='')
            else:
                print(pizza, end=' ')
                    
        print(" ")
        sleep(1)
    
class Ordine:
    def __init__(self, tipo, quantita, codice):
        self.tipo = tipo
        self.quantita = quantita
        self.codice = codice

class Cliente(Thread):
    def __init__(self, pizzeria, tipo, quantita):
        Thread.__init__(self)
        self.pizzeria = pizzeria
        self.tipo = tipo
        self.quantita = quantita
        
    def run(self):
        codice = self.pizzeria.put_ordine(self.tipo, self.quantita)
        print("un cliente ha lasciato un ordine %d " % codice)
        self.pizzeria.stampa()
        sleep(self.quantita - 1)
        print("un cliente cerca l'ordine %d " % codice)
        self.pizzeria.get_pizze(codice)
        print("un cliente ha preso le pizze con ordine %d" % codice)
        self.pizzeria.stampa()
        
class Pizzaiolo(Thread):
    def __init__(self, pizzeria):
        Thread.__init__(self)
        self.pizzeria = pizzeria
        
    def run(self):
        while(True):
            ordine = self.pizzeria.get_ordine()
            print("un pizzaiolo ha preso l'ordine %d " % ordine.codice)
            self.pizzeria.stampa()
            sleep(ordine.quantita)
            self.pizzeria.put_pizze(ordine.codice)
            print("un pizzaiolo ha preparato le pizze dell'ordine %d " % ordine.codice)
            self.pizzeria.stampa()
    
class Display(Thread):
    def __init__(self, pizzeria):
        Thread.__init__(self)
        self.pizzeria = pizzeria
        
    def run(self):
        while(True):
            self.pizzeria.stampa()
            
            
#
# Main
#
pizzeria = Pizzeria(5,5)

display = Display(pizzeria)
display.start()

sleep(2)

pizzaiolo = Pizzaiolo(pizzeria)
pizzaiolo.start()

cliente = Cliente(pizzeria,1,4)
cliente.start()

sleep(2)

cliente2 = Cliente(pizzeria,1,3)
cliente2.start()

cliente3 = Cliente(pizzeria,1,5)
cliente3.start()

cliente4 = Cliente(pizzeria,1,4)
cliente4.start()

cliente5 = Cliente(pizzeria,1,6)
cliente5.start()

cliente6 = Cliente(pizzeria,1,3)
cliente6.start()

cliente7 = Cliente(pizzeria,1,3)
cliente7.start()

cliente8 = Cliente(pizzeria,1,3)
cliente8.start()

cliente9 = Cliente(pizzeria,1,3)
cliente9.start()

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    