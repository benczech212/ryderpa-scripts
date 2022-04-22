from email import message
import socket, time


# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind the socket to the port
server_address = ('localhost', 11111)
print('starting up on {} port {}'.format(*server_address))
sock.bind(server_address)

# Listen for incoming connections
sock.listen(1)

while True:
    # Wait for a connection
    print('waiting for a connection')
    connection, client_address = sock.accept()
    try:
        #print('connection from', client_address)
        data_buffer = ""    
        message_ended = False
        # Receive the data in small chunks and retransmit it
        while not message_ended:
            data = connection.recv(16)
            data_str = data.decode('utf-8')
            data_str.find("\x02")
            if '\x02' in data_str: #if <STX> found, clear the data buffer and remove <STX> character
                data_buffer = ""
                pos = data_str.find("\x02")
                data_str = data_str[pos+len("\x02"):]
            if '\x03' in data_str: #if <ETX> found, strip anything after <ETX> and end loop
                pos = data_str.find("\x03")
                data_str = data_str[:pos]
                message_ended = True
            print(data_str) 
            data_buffer += data_str            
            if data: connection.sendall(data)
            if message_ended: 
                print(data_buffer)
                connection.close()

    finally:
        # Clean up the connection
        connection.close()