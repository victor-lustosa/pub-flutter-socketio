import 'package:pub/app/core/models/data/data.dart';

class SendMessageData extends Data{
  late int _idMessage;
  late String _createdAt;
  late String _textMessage;
  late String _user;
  late int _code;

  SendMessageData.withoutParameters():super(type: '');

  get getUser => _user;
  get getCreatedAt => _createdAt;
  get getTextMessage => _textMessage;
  get getIdMessage => _idMessage;
  get getCode => _code;
  get getType => super.type;

//SETTERS
  setUser(String user) => _user = user;
  setCode(int code) => _code = code;
  setType(String type) => super.type = type;
  setIdMessage(int idMessage) => _idMessage = idMessage;
  setCreatedAt(String createdAt) => _createdAt = createdAt;
  setTextMessage(String textMessage) => _textMessage = textMessage;

  Map<String, dynamic> toMap() {
    return {
      'idMessage': this._idMessage,
      'createdAt': this._createdAt,
      'textMessage': this._textMessage,
      'type': super.type,
      'code': this._code,
      'user': this._user
    };
  }

  factory SendMessageData.fromMap(Map<String,dynamic> map) {
    return SendMessageData(
        idMessage: map['idMessage'],
        createdAt: map['createdAt'],
        textMessage: map['textMessage'],
        user: map['user'],
        code: map['code'],
        type: map['type']
    );
  }

  SendMessageData({
    required idMessage,
    required createdAt,
    required textMessage,
    required user,
    required code,
    required type,
  })
      : _idMessage = idMessage,
        _createdAt = createdAt,
        _textMessage = textMessage,
        _code = code,
        _user = user,
        super.withoutRequired(type);
}