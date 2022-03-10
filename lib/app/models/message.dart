
class Message {
  late int _idMessage;
  late String _createdAt;
  late String _textMessage;
  late String _user;


  Message.withoutParameters(); //GETTERS
  get getUser => _user;
  get getCreatedAt => _createdAt;
  get getTextMessage => _textMessage;
  get getIdMessage => _idMessage;


//SETTERS

  setUser(String user) => _user = user;
  setIdMessage(int idMessage) => _idMessage = idMessage;
  setCreatedAt(String createdAt) => _createdAt = createdAt;
  setTextMessage(String textMessage) => _textMessage = textMessage;

  Map<String, dynamic> toMap() {
    return {
      'idMessage': this._idMessage,
      'createdAt': this._createdAt,
      'textMessage': this._textMessage,
      'user': this._user
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      idMessage: map['idMessage'],
      createdAt: map['createdAt'],
      textMessage: map['textMessage'],
      user: map['user']
    );
  }

  Message({
    required idMessage,
    required createdAt,
    required textMessage,
    required user,
  })  : _idMessage = idMessage,
        _createdAt = createdAt,
        _textMessage = textMessage,
        _user = user;
}