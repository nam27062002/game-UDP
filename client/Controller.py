import threading,pickle,sys
from PySide2.QtCore import QObject,Slot,Signal
from DbConnection import Database

class controller(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.db = Database()
        self.read = readClient(self)
        self.running = True
        threading.Thread(target=self.read.run).start()
    statusAccount = Signal(bool)
    createAcc = Signal(bool)
    statusNickname = Signal(bool)
    nickname = Signal(bool)
    getNickname = Signal(bool)
    getInfoUser = Signal(list)
    listNickname = Signal(list)
    statusAddfriend = Signal(int)
    listFriendRequest = Signal(list)
    noticeAddFriend = Signal(str)
    closeProgram = Signal(str)
    @Slot(str,str)
    def checkAccount(self,username,password):
        self.statusAccount.emit(self.db.checkAccount(username,password))
    @Slot(str,str)
    def createAccout(self,username,password):
        check = self.db.createAccount(username,password)
        self.createAcc.emit(check)
    @Slot(str)
    def setNickname(self,nickname):
        self.statusNickname.emit(self.db.checkNickname(nickname))

    @Slot(str)
    def setNickname1(self, nickname):
        self.nickname.emit(self.db.setNickname(nickname))

    @Slot()
    def sendNickname(self):
        self.getNickname.emit(self.db.getNickName())

    @Slot()
    def infoUser(self):
        self.getInfoUser.emit(self.db.getInfoUser())

    @Slot()
    def getListFriend(self):
        self.db.getListFriend()

    @Slot()
    def closeClient(self):
        self.running = False
        self.db.closeClient()
    @Slot(str)
    def addFriend(self,nickname):
        self.statusAddfriend.emit(self.db.addFriend(nickname))
    @Slot()
    def getListFriendRequest(self):
        res = self.db.getListFriendRequest()
        self.listFriendRequest.emit(res)
    @Slot(str)
    def unFriendRequest(self,nickname):
        self.db.unFriendRequest(nickname)
        self.getListFriendRequest()
    @Slot(str)
    def acceptAddFriend(self,nickname):
        self.db.acceptAddFriend(nickname)

    @Slot(str,str)
    def sendMessage(self,message,nickname):
        print(message,nickname)
class readClient:
    def __init__(self,controler: controller):
        self.controller = controler
    def run(self):
        while self.controller.running:
            try:
                data,_ = self.controller.db.client.UDPClientSocket.recvfrom(self.controller.db.client.bufferSize)
                data = pickle.loads(data)
                if data[0] == 0: # get list user online
                    self.controller.listNickname.emit(self.controller.db.processListFriend(data[1]))
                elif data[0] == 1: # gui nickname vua login
                    res = self.controller.db.updateListFriendOnline(data[1])
                    if res:
                        self.controller.listNickname.emit(self.controller.db.sendNewListFriend())
                elif data[0] == 2: # nhan yeu cau ket ban
                    self.controller.noticeAddFriend.emit(data[1])
                    self.controller.getListFriendRequest()
                elif data[0] == 3: # da duoc addfriend
                    self.controller.getListFriend()
                elif data[0] == 4: # out server
                    self.controller.closeProgram.emit('close')
                    break
            except:
                pass