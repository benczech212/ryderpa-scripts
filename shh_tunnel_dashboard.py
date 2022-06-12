import os, time
import subprocess

# ssh -C -L14443:172.16.242.35:443 -L5601:172.16.242.100:5601 10.240.0.240
prompt_width = 40
config = [{
    "name":
    "Sports Direct",
    "tunnels": [
        {
            "inPort": 14443,
            "ip": "172.16.242.35",
            "outPort": 443
        },
        {
            "inPort": 5601,
            "ip": "172.16.242.100",
            "outPort": 5601
        },
    ],
    "destIp":
    "10.240.0.240"
}, {
    "name":
    "Test",
    "tunnels": [
        {
            "inPort": 1234,
            "ip": "10.20.30.40",
            "outPort": 1234
        },
        {
            "inPort": 1234,
            "ip": "10.20.30.41",
            "outPort": 1234
        },
        {
            "inPort": 1234,
            "ip": "10.20.30.42",
            "outPort": 1234
        },
    ],
    "destIp":
    "10.240.0.240"
}]

def printInstructions(client):
        
        countFrom = 4
        for i in range(countFrom):
            os.system('cls' if os.name == 'nt' else 'clear')
            print("Connecting to {}\n".format(client["name"]))
            print((" * "*20)[20:])
            print("\nWhen prompted, enter your normal windows password\n\n")
            print("To terminate the connection, press [Ctrl] + [C]\n")
            print((" * "*20)[20:])
            print("Continuing in ", end="")
            print("{} ".format(countFrom - i))
            time.sleep(1)

def getClientList():
    client_list = []
    for id, client in enumerate(config):
        client_list.append({"name": client["name"], "id": id})
    return client_list
clientList = getClientList()

def createSshTunnel(clientId):
    client = config[client_id]
    printInstructions(client)
    command = "ssh -C"
    for step in client["tunnels"]:
        command += " -L{}:{}:{}".format(step["inPort"], step["ip"],
                                        step["outPort"])
    command += " {}".format(client["destIp"])
    proc = subprocess.Popen(command,
                            shell=True,
                            stdin=subprocess.PIPE,
                            stdout=subprocess.PIPE)
    return proc.communicate()

def printClientOptions():
    global client_list
    os.system('cls' if os.name == 'nt' else 'clear')
    print("┌{}┐".format("─"*int(prompt_width-2)))
    print("│{: ^38}|".format("Select A Client"))
    print("├{}┤".format("─"*int(prompt_width-2)))
    for client in client_list:
        print("|{: <38}|".format("{:^5}- [{: ^3d}] {: <24}".format("", client["id"],client["name"])))
    print("└{}┘".format("─"*int(prompt_width-2)))
    print("{: ^40}".format(" - Enter a number - "))

def selectClientPrompt():
    global client_list
    valid = False
    valid_inputs = [i for i in range(len(client_list))]
    while not valid:
        printClientOptions()
        user_input = input(" "*int(prompt_width/2))
        valid = True if((int(user_input) in valid_inputs) == True) else False
    client_id = int(user_input)
    return client_id

client_list = getClientList()
client_id = selectClientPrompt()
out, err = createSshTunnel(client_id)
print(out)

# command_to_execute ="ssh -C -L14443:172.16.242.35:443 -L5601:172.16.242.100:5601 10.240.0.240"

# print (out)