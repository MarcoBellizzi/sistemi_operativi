from threading import RLock, Condition, Thread
from time import sleep
import random

class ReadWrite:
	def __init__(self, dato):
		self.dato = dato
		self.numLettori = 0
		self.ceScrittore = False
		self.lock = RLock()
		self.condition = Condition(self.lock)
		self.maxLettori = 10
		self.possoScrivere = True

	def takeReadLock(self):
		with self.lock:
			while(self.ceScrittore == True or self.numLettori >= self.maxLettori):
				self.condition.wait()
			self.numLettori += 1

	def leaveReadLock(self):
		with self.lock:
			self.numLettori -= 1
			if(self.numLettori == 0):
				self.condition.notifyAll()

	def takeWriteLock(self):
		with self.lock:
			while(self.numLettori > 0 or self.ceScrittore == True or (not self.possoScrivere)):
				self.condition.wait()
			self.ceScrittore == True

	def leaveWriteLock(self):
		with self.lock:
			self.ceScrittore = False
			self.condition.notifyAll()

	def setReaders(self, mass):
		with self.lock:
			self.maxLettori = mass

	def enableWriters(self, enable):
		with self.lock:
			self.possoScrivere = enable

class Lettore(Thread):
	def __init__(self,s,i):
		Thread.__init__(self)
		self.s = s
		self.nome = i

	def run(self):
		a = 0
		while(a <= 5):
			self.s.takeReadLock()
			print("lettore " + str(self.nome) + " prende il readlock")
			sleep(random.randrange(5))
			self.s.leaveReadLock()
			print("lettore " + str(self.nome) + " lascia il readlock")
			a += 1

class Scrittore(Thread):
	def __init__(self,s,i):
		Thread.__init__(self)
		self.s = s
		self.nome = i

	def run(self):
		a = 0
		while(a <= 5):
			self.s.takeWriteLock()
			print("scrittore " + str(self.nome) + " prende il writelock")
			sleep(random.randrange(5))
			self.s.leaveWriteLock()
			print("scrittore " + str(self.nome) + " lascia il writelock")
			a += 1

#
# Main
#
lock = ReadWrite(0)

lettori = [Lettore(lock,i) for i in range(5)]
for s in lettori:
	s.start()

scrittori = [Scrittore(lock,i) for i in range(3)]
for s in scrittori:
	s.start()






