from threading import Lock, Condition

class Vettore:
	def __init__(self, n):
		self.vettore = [int] * n     # in teoria int -> generico
		self.blocchi = [Lock() for _ in range(n)]
		self.elementiBloccati = 0
		self.lock = Lock()
		self.sbloccatoUno = Condition(self.lock)

	def lock(self, i : int):
		with self.lock:
			self.blocchi[i].acquire()
			self.elementiBloccati += 1

	def lock(self, lista : list):
		with self.lock:
			for indice in lista:
				self.blocchi[indice].acquire()
				self.elementiBloccati += 1

	def unlock(self, i : int):
		with self.lock:
			self.blocchi[i].release()
			self.elementiBloccati -= 1
			self.sbloccatoUno.notifyAll()

	def waitForLock(self):
		with self.lock:
			while(self.elementiBloccati > 0):
				self.sbloccatoUno.wait()
			print("vettore completamente libero\n")







