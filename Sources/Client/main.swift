import PerfectMosquitto
#if os(Linux)
    import SwiftGlibc
#else
    import Darwin
#endif

//let app = Mosquitto()
var name: String!
var serverAddr: String!
var app: Mosquitto!
let topic = "publish/test"
//let senderTopic = "publish/sender"
//let receiverTopic = "publish/receiver"


/// setup based on parameters from caller
///
/// - Returns: success or not
func setup() -> Bool {
    if !Panagram.singleton.readParam() {
        return false
    }
    name = Panagram.singleton.getName()
    if (name == nil) {
        print("name is nil")
        return false
    }
    serverAddr = Panagram.singleton.getServerAddr()
    if (serverAddr == nil) {
        print("server address is nil")
        return false
    }
    app = Mosquitto(id: name, cleanSession: false)
    return true
}

Mosquitto.OpenLibrary()
print("---------      Program Started.     ----------")

// MARK: main
if setup() {
    print("\(name!) is running with server \(serverAddr!)")
    do {
        try app.connect(host: serverAddr)
        // MARK: setup to receive
        app.OnMessage = { msg in
            guard let text = msg.string else {
                print("message fault")
                return
            }
//            print("received: \(text)")
            let message = text.toMessage()
            if message != nil {
                if message!.from != name {
                    print("Message from \(message!.from!): \(message!.content!)")
                }
            }
        }
        try app.subscribe(topic: topic)
        try app.start() // run with thread mode
        // MARK: setup to send
        app.setMessageRetry(max: 3)
        var sendMsg = Mosquitto.Message()
        sendMsg.topic = topic
        while true {
//            sendMsg.string = readLine()
//            let _ = try app.publish(message: sendMsg)
            
            let content = readLine()
            if content != nil {
                sendMsg.string = Message(from: name!, content: content!).toJsonString()
                let _ = try app.publish(message: sendMsg)
            } else {
                print("Build message error")
            }
        }
        //    try app.disconnect()
    }catch(let err) {
        print("Got an error: \(err)")
    }
} else {
    print("setup is error")
}

print("---------      Program Completed.     ----------")
Mosquitto.CloseLibrary()

