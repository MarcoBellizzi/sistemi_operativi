from threading import Lock, Condition

class Dischi:
	def __init__(self, n):
		self.n = n
		self.ins = [0] * self.n
		self.out = [0] * self.n
		self.spostamento = 0
		self.lock = Lock()
		self.condition = Condition(self.lock)

	def shift(self, m):
		with self.lock:
			self.spostamento = m

	def set(self, i, v, d):
		with self.lock:
			if(d == 1):
				self.ins[i] = v
			if(d == 0):
				self.out[(i+self.spostamento)%self.n] = v
			if(self.ins[i] == self.out[i+self.spostamento]):
				self.ins[i] = 0
				self.out[(i+self.spostamento)%self.n] = 0
			self.condition.notifyAll()

	def get(self, i, d):
		with self.lock:
			if(d == 0):
				while(self.ins[i] == 0):
					self.condition.wait()
				return self.ins[i]
			if(d == 1):
				indice = (i+self.spostamento)%self.n
				while(self.out[indice] == 0):
					self.condition.wait()
				return self.out[indice]


















