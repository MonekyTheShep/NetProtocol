import sys.net.Socket;
import sys.net.Host;
import sys.net.UdpSocket;

class Main {
    static function main() {
        // Socket declare
        var socket:Socket = new Socket();
        var udp = new UdpSocket();

        // Host
        var host:Host = new Host("127.0.0.1");

        // addr for UDP
        var addr = new sys.net.Address();
        addr.host = host.ip;

        // Connect and bind
        udp.bind(host, 9999); 
        socket.connect(host, 80);

        // sending the data to TCP
        var out = socket.output;
        out.writeString("hello tcp world\n");
        out.flush();


        // sending the data to UDP
        var msg = haxe.io.Bytes.ofString("DISCOVER");
        udp.sendTo(msg, 0, msg.length, addr);

        // close tcp socket, UDP doesnt need this
        socket.close();
    }
}