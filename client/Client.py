import socket,pickle,threading
class Client:
    def __init__(self):
        self.serverAddressPort = (socket.gethostbyname(socket.gethostname()), 5000) # dia chi va port cua server
        self.bufferSize = 1024
        self.UDPClientSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM) # UDP socket client
    def write(self,data): # gui data den server
        self.UDPClientSocket.sendto(pickle.dumps(data),self.serverAddressPort)

