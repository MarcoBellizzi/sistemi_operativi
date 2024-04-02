from threading import Lock, Thread, Condition
from time import sleep

class T1(Thread):
    def __init__(self, l):
        Thread.__init__(self)
        self.lock = l
        
    def run(self):
        print("t1 prova ad acquisire il lock")
        lock.acquire()
        print("lock acquisito e rilasciato da t1")
        lock.release()
        
    
class T2(Thread):
    def __init__(self, l, cond):
        Thread.__init__(self)
        self.lock = l
        self.condition = cond
        
    def run(self):
        sleep(3)   # perche il main addormenta la condition
        
        lock.acquire()
        print("sveglio la condition")
        self.condition.notifyAll()
        lock.release()
    
    
        
lock = Lock()
condition = Condition(lock)

lock.acquire()
print("lock acquisito dal main")

sleep(2)

t1 = T1(lock)
t1.start()

sleep(2)

t2 = T2(lock,condition)
t2.start()

print("metto in wait la condition")
condition.wait()    # t1 puo acquisire il lock

print("condition svegliata")

lock.release()
print("lock rilasciato")





















