
import time
import socket
import sys

MESSAGE_LENGTH = 16
default_host = "localhost"
default_port = 4213
default_message = "02038|11|00000218640153634799|04"


args = sys.argv[1:]
if len(args) == 3:
    host = args[0]
    port = int(args[1])
    message = args[2]
else:
    host = default_host
    port = default_port
    message = default_message


class MySocket:
    def __init__(self, sock=None):
        if sock is None:self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        else: self.sock = sock

    def connect(self, host, port):
        self.sock.connect((host, port))

    def mysend(self, msg):
        totalsent = 0
        msg = "\x02{}\x03".format(msg).encode()
        while totalsent < MESSAGE_LENGTH:
            sent = self.sock.send(msg[totalsent:])
            if sent == 0:
                raise RuntimeError("socket connection broken")
            totalsent = totalsent + sent

    def myreceive(self):
        chunks = []
        bytes_recd = 0
        while bytes_recd < MESSAGE_LENGTH:
            chunk = self.sock.recv(min(MESSAGE_LENGTH - bytes_recd, 2048))
            if chunk == b'':
                raise RuntimeError("socket connection broken")
            chunks.append(chunk)
            bytes_recd = bytes_recd + len(chunk)
        return b''.join(chunks)

tcpSocket = MySocket()
tcpSocket.connect(host, port)
while True:
    tcpSocket.mysend(message)
    data = tcpSocket.myreceive()
    data_str = data.decode('utf-8')
    if '\x03' in data_str:
        print("Successfully sent {} to {}:{}".format(message,host,port))
        try:
            tcpSocket.sock.close()
        except:
            pass

    