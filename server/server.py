import socket,pickle,threading
class server:
    def __init__(self):
        self.port = 5000
        self.IP = socket.gethostbyname(socket.gethostname())
        self.bufferSize = 1024
        self.UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
        self.UDPServerSocket.bind((self.IP, self.port))
        self.mapUser = {} # address + nickname

    def run(self): # loop 
        while True:
            data,address = self.UDPServerSocket.recvfrom(self.bufferSize)
            process = newThreadProcess(self,data,address)
            threading.Thread(target=process.run).start()

# 0 gui list user online 
# 1 gui nickname vua login den toan bo client
# 2 gui thong bao co nguoi yeu cau ket ban
# 3 gui thong bao dc ket ban
class newThreadProcess:
    def __init__(self,server: server , data, address): #server + tin nhan + dia chi vua gui
        self.server = server
        self.data = pickle.loads(data)
        self.address = address
    def run(self):
        arr = self.data
        if arr[0] == 0: # login      
            self.server.mapUser[self.address] = arr[1]
            self.sendToAllClientExceptAddress([1,arr[1]])
        elif arr[0] == 1: # logout
            try:
                if len(arr[1]) != 0:
                    for i in self.server.mapUser:
                        if self.server.mapUser[i] == arr[1]:
                            self.server.mapUser.pop(i)
                            self.sendDataToAddress([-1,"OK"])
                            break
            except:
                self.sendDataToAddress([-1,"OK"])
        elif arr[0] == 2: # get list online
            self.sendDataToAddress([0,self.server.mapUser])
        elif arr[0] == 3: # gui yeu cau ket ban
            # kiem tra xem nguoi do co online khong
            for i in self.server.mapUser:
                if self.server.mapUser[i] == arr[1]: # nguoi do online
                    self.sendDataByAddress([2,arr[2]],i)
                    break
        elif arr[0] == 4: # add friend
            for i in self.server.mapUser:
                if self.server.mapUser[i] == arr[1]: # nguoi do online
                    self.sendDataByAddress([3],i)
                    break
    def sendToAllClientExceptAddress(self,data):
        for i in self.server.mapUser:
            if i != self.address:
                self.server.UDPServerSocket.sendto(pickle.dumps(data),i)

    def sendDataByAddress(self,data,address):
        self.server.UDPServerSocket.sendto(pickle.dumps(data), address)
    def sendDataToAddress(self,data):
        self.server.UDPServerSocket.sendto(pickle.dumps(data), self.address)
server().run()