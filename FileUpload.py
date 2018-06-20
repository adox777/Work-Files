'''
Using plink and pscp for uploading
file to website reloading website
adrian.holgate@wsu.edu

V.1.1
 - Uploads all files OR a list of files to website
V.1.0
 - Uploads all files from local machine to website
'''

# os for batch commands, time for performance stats
import os
from time import time, sleep

# making connection with server and running cmds or uploading files
class connection:
    def __init__(self, protocal, domainName, user, keyfile, localFolder=os.getcwd()):
        self.protocal = protocal
        self.domainName = domainName
        self.user = user
        self.keyfile = keyfile
        self.startTime = time()
        self.localFolder = localFolder

    def finish(self):
        aproxTime = (int((time() - self.startTime)*1000))/1000
        return "Connection lasted ~ " + str(aproxTime) + " seconds"

    def uploadCmd(self, fromWhere, toWhere, isFolder):
        if isFolder:
            os.system("pscp -r -i " + self.keyfile + " " + fromWhere + " " + self.user + "@" + self.domainName + ":" + toWhere)
        else:
            os.system("pscp -i " + self.keyfile + " " + fromWhere + " " + self.user + "@" + self.domainName + ":" + toWhere)

    def runCmd(self, c):
        os.system("plink -" + self.protocal + " " + self.domainName + " -l " + self.user + " -i " + self.keyfile + " " + c)


def help():
    print("> Examples of commands <")
    print('>>> all\n\tuploads all files to the server')
    print('>>> myfile.txt\n\tfind the file "myfile.txt" and then upload it to the server')
    print('>>> myfile.txt, myimage.png, website.html\n\tfind these files then upload them to the server\n')

def getFilePath(fileName, directory):
    parts = fileName.split('.')
    newName = parts[0].lower() + "." + parts[1].lower()
    for dirpath, dirnames, files, in os.walk(directory):
        for name in files:
            if (name == newName):
                return [name, os.path.join(dirpath, name)]

def main():
    userInput = (input("Files to upload: ")).lower()
    if userInput == "a":
        con = connection("ssh", "hanfordhistory.com", "ubuntu", "puttykey2.ppk")
        con.runCmd("sudo service apache2 stop;sudo rm -r /tmp/hanford75;sudo mkdir /tmp/hanford75;sudo chmod 777 /tmp/hanford75;")
        con.uploadCmd("C:\\Users\\adrian.holgate\\Desktop\\WebDevelop\\hanford75", "/tmp", True)
        con.runCmd("sudo cp -r /tmp/hanford75 /var/www/html;sudo mv /var/www/html/hanford75/htaccess.txt /var/www/html/hanford75/.htaccess;sudo service apache2 start;")
        print(con.finish())
    elif (userInput != "help"):
        con = connection("ssh", "hanfordhistory.com", "ubuntu", "puttykey2.ppk")
        userInput = userInput.replace(', ', ':')
        userInput = userInput.replace(',', ":")
        userInput = userInput.split(':')
        con.runCmd("sudo service apache2 stop;")
        for i in range(len(userInput)):
            userInput[i] = getFilePath(userInput[i], os.getcwd())
            try:
                x = userInput[i]
                x = userInput[i][0]
                x = userInput[i][1]
            except:
                print("One or more files missing!")
            else:
                print(userInput[i][1] + " being uploaded")
                con.uploadCmd(userInput[i][1], "/tmp", False)
                con.runCmd("sudo mv /tmp/" + userInput[i][0] + " /var/www/html/hanford75;")
        con.runCmd("sudo service apache2 start;")
        print(con.finish())
    elif (userInput == "help"):
        help()
        main()
    else:
        return -1

main()