from threading import Thread, RLock, Condition
from time import sleep

class LockEvoluto:
	def __init__(self):
		self.chiave = "_"
		self.lock = RLock()

	def blocca(self, chiave):
		self.lock.acquire()
		self.chiave = chiave

	def sblocca(self, chiave):
		if(self.chiave == chiave):
			self.lock.release()
			print("le chiavi corrispondono")
		else:
			print("le chiavi non corrspondono")

	def newStepCondition(self):
		return StepCondition(self.lock)

class StepCondition:
	def __init__(self,lock):
		self.lock = lock
		self.condition = Condition(self.lock)
		self.segnali = 0
		self.volte = 0

	def await(self, volte):
		with self.lock:
			self.volte = volte
			self.seganli = 0
			while(self.segnali < self.volte):
				self.condition.wait()
			print("la StepCondition esce dal wait")

	def signal(self, volte):
		with self.lock:
			self.segnali += volte
			print("la StepCondition ha ricevuto un segnale (tot = " + str(self.segnali) + ")")
			self.condition.notifyAll()

class Sbloccatore(Thread):
	def __init__(self, cond):
		Thread.__init__(self)
		self.cond = cond

	def run(self):
		sleep(1)
		self.cond.signal(1)
		sleep(1)
		self.cond.signal(1)
		sleep(1)
		self.cond.signal(1)
		
#
# Main
#
lockEvoluto = LockEvoluto()
lockEvoluto.blocca("ciao")

stepCondition = lockEvoluto.newStepCondition()

sbloccatore = Sbloccatore(stepCondition)
sbloccatore.start()

stepCondition.await(3)

lockEvoluto.sblocca("ciaooo")
lockEvoluto.sblocca("ciao")




