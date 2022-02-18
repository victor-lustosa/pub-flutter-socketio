import 'package:pub/app/models/user.dart';

class Message {
  late int _idMessage;
  late DateTime _sendDate;
  late String _textMessage;
  late User _user;
  late String _room;

  Message();
  Message.with_parameters(this._user);

  //GETTERS
  get getUser => _user;
  get getSendDate => _sendDate;
  get getTextMessage => _textMessage;
  get getIdMessage => _idMessage;
  get getRoom => _room;

//SETTERS
  setRoom(String room) => _room = room;
  setUser(User user) => _user = user;
  setIdMessage(int idMessage) => _idMessage = idMessage;
  setSendDate(DateTime sendDate) => _sendDate = sendDate;
  setTextMessage(String textMessage) => _textMessage = textMessage;
}