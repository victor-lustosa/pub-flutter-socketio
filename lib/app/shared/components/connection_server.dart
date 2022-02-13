import 'package:pub/app/shared/components/stream_socket.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ConnectionServer{
  void connectAndListen(){
    IO.Socket socket = IO.io('http://localhost:3000', IO.OptionBuilder().setTransports(['websocket']).build());

    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });

    //When an event recieved from server, data is added to the stream
    socket.on('event', (data) => StreamSocket.instance.addResponse);
    socket.onDisconnect((_) => print('disconnect'));

  }
}