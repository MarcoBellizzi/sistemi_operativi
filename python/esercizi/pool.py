from threading import Lock, Condition

class Pool:
	def __init__(self, n, m):
		self.n = n
		self.code = [Coda(m)] * self.n
		self.lock = Lock()
		self.ins = 0
		self.out = 0
		
	def put(self, t):
		self.code[self.ins].put(t)

	def take(self):
		self.code[self.out].take()

	def nextPut(self):
		with self.lock:
			self.ins = (self.ins + 1) % self.n

	def nextTake(self):
		with self.lock:
			self.out = (self.out + 1) % self.n


class Coda:
	def __init__(self, m):
		self.m = m
		self.buffer = [int] * self.m
		self.ins = 0
		self.out = 0
		self.elementiPieni = 0
		self.lock = Lock()
		self.conditionPieno = Condition(self.lock)
		self.conditionVuoto = Condition(self.lock)

	def take(self):
		with self.lock:
			while(self.elementiPieni == 0):
				self.conditionVuoto.wait()
			elemento = self.buffer[self.out]
			self.out = (self.out + 1) % self.m
			if(self.elementiPieni == self.m):
				self.conditionPieno.notifyAll()
			self.elementiPieni -= 1			
			return elemento	

	def put(self, t):
		with self.lock:
			while(self.elementiPieni == self.m):
				self.conditionVuoto.wait()
			self.buffer[self.ins] = t
			self.ins = (self.ins + 1) % self.m
			if(self.elementiPieni == 0):
				self.conditionVuoto.notifyAll()
			self.elementiPieni += 1











