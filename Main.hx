import sys.net.Socket;
import sys.net.Host;

class Main {
    static function main() {
        var socket:Socket = new Socket();

        var host:Host = new Host("127.0.0.1"); 
        socket.connect(host, 80);

        var out = socket.output;
        out.writeString("hello tcp world\n");
        out.flush();

        socket.close();
    }
}