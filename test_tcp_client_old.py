import time
import socket
import sys


retry_count = 5
server_address = ('localhost', 11111)


print('connecting to {} port {}'.format(*server_address))
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
connected = False

for i in range(retry_count):
    try:
        sock.connect(server_address)
        connected = True
    except RuntimeError:
        print(RuntimeError)
        print("Failed to connect to server. Retrying [{} of {} attempts]".format(i,retry_count))
        time.sleep(1)

if connected:
    try:

        # Send data
        message = bytearray('02038|11|00000218640153634799|04|')
        print('sending {!r}'.format(message))
        sock.sendall(message)

        # Look for the response
        amount_received = 0
        amount_expected = len(message)

        while amount_received < amount_expected:
            data = sock.recv(16)
            amount_received += len(data)
            print('received {!r}'.format(data))

    finally:
        print('closing socket')
        sock.close()
else: 
    print("Failed to connect after {} attempts".format(retry_count))