import 'package:pub/app/shared/components/stream_socket.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../config/app_routes.dart';

class ConnectionServer{
  void connectAndListen(){
    // IO.Socket socket = IO.io(urlServer, IO.OptionBuilder().setTransports(['websocket']).build());
    //
    // socket.onConnect((_) {
    //   print('connect');
    //   socket.emit('msg', 'test');
    // });
    //
    // //When an event recieved from server, data is added to the stream
    // socket.on('event', (data) => StreamSocket.instance.addResponse);
    // socket.onDisconnect((_) => print('disconnect'));

  }
}