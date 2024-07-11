// socket_io_service.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketIOService {
  late io.Socket socket;
  String? userToken;

  Future<void> connect() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('userToken');

    try {
      socket = io.io('http://3.144.244.10:3000', <String, dynamic>{
        'transports': ['websocket'],
        'query': {'token': userToken},
      });

      socket.connect();

      socket.on('connect', (_) {
        print('Connected to the server');
      });

      socket.on('privateMessageSent', (data) {
        print('Received message...: $data');
        print('Received message...: $data');
        // Handle the received message as needed
      });

      // send message
      // sendMessage('Hello to the world of java!');
    } catch (e) {
      print(e);
    }
  }

  void sendMessage(String message) {
    socket.emit('sendMessage', {'message': message});
    print('Message sent: $message');
  }

  void disconnect() {
    socket.disconnect();
  }
}
