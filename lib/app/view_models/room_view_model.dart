
import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/models/message.dart';
import 'package:pub/app/models/user.dart';

abstract class IRoomViewModel{
  sendMessage(Establishment establishment, String textMessage, Message message, User user);
}

class RoomViewModel implements IRoomViewModel{
  RoomViewModel._();
  static final RoomViewModel instance = RoomViewModel._();

  sendMessage(Establishment establishment, String textMessage, Message message, User user) {
    if (textMessage.isNotEmpty) {
      message.setUser(user);
      message.setTextMessage(textMessage);
      message.setSendDate(DateTime.now());
    }
  }
}