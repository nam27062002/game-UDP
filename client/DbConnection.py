import mysql.connector
from account import account
from Client import Client
from listFriend import  listFriend
class Database:
    def __init__(self):
        # self.dataBase = mysql.connector.connect(
        #     host = "sql6.freesqldatabase.com",
        #     user = "sql6586833",
        #     passwd = "ahytQzLhNk",
        #     database = "sql6586833"
        # )
        self.dataBase = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="",
            database="sql6586833"
        )
        self.client = Client()
        self.listFriend = listFriend()

    def querySelect(self,query):
        self.dataBase = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="",
            database="sql6586833"
        )
        cursorObject = self.dataBase.cursor()
        cursorObject.execute(query)
        if "select" not in query and "SELECT" not in query:
            self.dataBase.commit()
        return cursorObject.fetchall()
    def checkAccount(self,username,password):
        res = self.querySelect("select * from account")
        for i in res:
            if i[1] == username and i[2] == password:
                self.username = username
                return True
        return False
    def createAccount(self,username,password):
        res = self.querySelect(f"select * from account where username = '{username}'")
        if len(res) == 0:
            # table account
            query = f"insert into account (username,password) values ('{username}','{password}')"
            self.querySelect(query)
            # table friend
            id = self.querySelect(f"select id from account where username = '{username}'")[0][0]
            query = f"INSERT INTO `friend`(`idAccount`, `listFriend`, `listFriendRequest`) VALUES ('{id}','','')"
            self.querySelect(query)
            return True
        else:
            return False
    def checkNickname(self,nickname):
        res = self.querySelect(f"select * from account where nickname = '{nickname}'")
        if len(res) == 0:
            return True
        else:
            return False
    def getNickName(self):
        return self.querySelect(f"select nickname from account where username = '{self.username}'")[0][0] != None
    def setNickname(self,nickname):

        res = self.querySelect(f"select * from account where nickname = '{nickname}'")
        if len(res) == 0:
            query = f"UPDATE account SET nickname = '{nickname}' WHERE username = '{self.username}'"
            self.querySelect(query)
            return True
        else:
            return False
    def getInfoUser(self):
        res = self.querySelect(f"select * from account where username = '{self.username}'")
        self.account = account(res[0][0],res[0][1],res[0][2],res[0][3])
        res = list(res[0])
        # gui den server
        self.sendLoginToServer()
        return res
    def sendLoginToServer(self):
        self.client.write([0,self.account.nickname])
    def getNicknameByID(self,id):
        return self.querySelect(f"select nickname from account where id = '{id}'")[0][0]
    def getListFriend(self):
        res = self.querySelect(f"select * from friend where idAccount = '{self.account.id}'")
        listIdFriend = res[0][2]
        listIdFriend = listIdFriend.split("-")
        listNicknameFriend = []
        for i in listIdFriend:
            if i != "":
                listNicknameFriend.append(self.getNicknameByID(i))
        self.listFriend.listFriendOffline = listNicknameFriend
        self.getListOnline()
    def processListFriend(self,arr: map):
        for i in arr:
            if self.listFriend.listFriendOffline.count(arr[i]) != 0:
                self.listFriend.listFriendOffline.remove(arr[i])
                self.listFriend.listFriendOnline.append((arr[i]))
        return self.sendNewListFriend()
    def sendNewListFriend(self):
        res = []
        for i in self.listFriend.listFriendOnline:
            res.append([i, True])
        for i in self.listFriend.listFriendOffline:
            res.append(([i, False]))
        return res
    def getListOnline(self):
        self.client.write([2,self.account.nickname])
    def closeClient(self):
        try:
            self.client.write([1,self.account.nickname])
        except:
            self.client.write([1])
    def updateListFriendOnline(self,nickname):
        for i in self.listFriend.listFriendOffline:
            if i == nickname:
                self.listFriend.listFriendOffline.remove(i)
                self.listFriend.listFriendOnline.append(i)
                return True
        return False
    def getIdUserByNickname(self,nickname):
        return self.querySelect(f"select id from account where nickname = '{nickname}'")[0][0]
    def getFriendByID(self,id):
        return self.querySelect(f"select * from friend where idAccount = '{id}'")
    def addFriend(self,nickname):
        if nickname == self.account.nickname:
            return -1
        elif self.listFriend.listFriendOffline.count(nickname) != 0 or self.listFriend.listFriendOnline.count(nickname) != 0:
            return -2
        elif self.getListFriendRequest().count(nickname) != 0:
            return -3
        else:
            check = self.checkNickname(nickname)
            if check:
                return 0
            else:
                id = self.getIdUserByNickname(nickname)
                friend = self.getFriendByID(id)[0][3]
                s = ""
                if friend == "":
                    s += str(self.account.id)
                    query = f"UPDATE `friend` SET `listFriendRequest`='{s}' WHERE idAccount = '{id}'"
                    self.querySelect(query)
                else:
                    if str(self.account.id) not in friend:
                        s += friend
                        s += "-" + str(self.account.id)
                        query = f"UPDATE `friend` SET `listFriendRequest`='{s}' WHERE idAccount = '{id}'"
                        self.querySelect(query)

                self.client.write([3,nickname,self.account.nickname])
                return 1
    def getListFriendRequest(self):
        query = f"select * from friend where idAccount = '{self.account.id}'"
        res = self.querySelect(query)[0][3]
        res = res.split("-")
        listFriend = []
        if res[0] != "":
            for i in res:
                listFriend.append(self.getNicknameByID(i))
        return listFriend
    def unFriendRequest(self,nickname):
        query = f"select * from friend where idAccount = '{self.account.id}'"
        id = self.getIdUserByNickname(nickname)
        res = self.querySelect(query)[0][3]
        res = res.split("-")
        for i in res:
            if int(i) == id:
                res.remove(i)
                break
        s = ""
        for i in range(len(res)):
            if i == 0:
                s += str(res[i])
            else:
                s += "-" + str(res[i])
        query = f"UPDATE `friend` SET `listFriendRequest`='{s}' WHERE idAccount = '{self.account.id}'"
        self.querySelect(query)
        return id
    def updateListFriend(self,id,data):
        query = f"UPDATE `friend` SET `listFriend`='{data}' WHERE idAccount = '{id}'"
        self.querySelect(query)
    def getListFriendById(self,id):
        query = f"select listFriend from friend where idAccount = '{id}'"
        return self.querySelect(query)[0][0]
    def addFriendHandel(self,strs,id):
        if strs == "":
            return str(id)
        else:
            return strs + "-" + str(id)
    def acceptAddFriend(self,nickname):
        id = self.unFriendRequest(nickname)
        s1 = self.getListFriendById(self.account.id)
        s1 = self.addFriendHandel(s1,id)
        self.updateListFriend(self.account.id,s1)
        s2 = self.getListFriendById(id)
        s2 = self.addFriendHandel(s2,self.account.id)
        self.updateListFriend(id,s2)
        self.client.write([4,nickname])

    def sendMessage(self,nickname):
        pass
