// socket_io_service.dart
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../constant/const.dart';

class SocketIOService {
  late io.Socket socket;

  void connect() {
    socket = io.io(BASE_URL, <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.connect();

    socket.on('connect', (_) {
      print('Connected to the server');
    });

    socket.on('message', (data) {
      print('Received message: $data');
      // Handle the received message as needed
    });

    // send message
    // sendMessage('Hello to the world of java!');
  }

  void sendMessage(String message) {
    socket.emit('sendMessage', {'message': message});
    print('Message sent: $message');
  }

  void disconnect() {
    socket.disconnect();
  }
}
