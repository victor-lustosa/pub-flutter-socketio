
class Room {
  int _idRoom = 0;
  String _roomName = '';
  String _userNickName = '';
  String _icon = '';
  bool _isPublic = false;
  List<dynamic> _usersList = [];
  List<dynamic> _participantsList = [];
  List<dynamic> _messagesList = [];

  Room.withoutParameters();

  addMessages(dynamic data) {
    _messagesList.add(data);
  }
  addParticipants(dynamic data) {
    _participantsList.add(data);
  }
  //GETTERS
  get getUserNickName => _userNickName;
  get getRoomName => _roomName;
  get getUsersList => _usersList;
  get getParticipantsList => _participantsList;
  get getMessagesList => _messagesList;
  get getIdRoom => _idRoom;
  get getIcon => _icon;
  get getIsPublic => _isPublic;


//SETTERS
  setUserNickName(String userNickName) => _userNickName = userNickName;
  setRoomName(String roomName) => _roomName = roomName;
  setIcon(String icon) => _icon = icon;
  setIdRoom(int idRoom) => _idRoom = idRoom;
  setIsPublic(bool isPublic) => _isPublic = isPublic;
  setUsersList(List<dynamic> usersList) => _usersList = usersList;
  setParticipantsList(List<dynamic> participantsList) => _participantsList = participantsList;

  Room({
    required idRoom,
    required roomName,
    required userNickName,
    required isPublic,
    required usersList,
    required messagesList,
  })  : _idRoom = idRoom,
        _roomName = roomName,
        _userNickName = userNickName,
        _isPublic = isPublic,
        _usersList = usersList,
        _messagesList = messagesList;

  Map<String, dynamic> toMap() {
    return {
      'idRoom': this._idRoom,
      'roomName': this._roomName,
      'userNickName': this._userNickName,
      'isPublic': this._isPublic,
      'usersList': this._usersList,
      'messagesList': this._messagesList
    };
  }

  Room.fromMap(json)
      : this._idRoom = json['idRoom'],
        this._roomName = json['roomName'],
        this._userNickName = json['userNickName'],
        this._isPublic = json['isPublic'],
        this._usersList = json['usersList'],
        this._messagesList = json['messagesList'];
}

