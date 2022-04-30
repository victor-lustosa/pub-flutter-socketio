
class Room {
  String _idRoom = '';
  String _roomName = '';
  // String _userNickName = '';
  String _icon = '';
  bool _isPublic = false;
  List<dynamic> _usersList = [];
  List<dynamic> _participantsList = [];
  List<dynamic> _messagesList = [];
  late double _latitude;
  late double _longitude;
  late double _distance;

  Room.withoutParameters();

  addMessages(dynamic data) {
    _messagesList.add(data);
  }
  addParticipants(dynamic data) {
    _participantsList.add(data);
  }
  //GETTERS
  // get getUserNickName => _userNickName;
  get getDistance => _distance;
  get getRoomName => _roomName;
  get getUsersList => _usersList;
  get getParticipantsList => _participantsList;
  get getMessagesList => _messagesList;
  get getIdRoom => _idRoom;
  get getLatitude => _latitude;
  get getLongitude => _longitude;
  // get getIcon => _icon;
  // get getIsPublic => _isPublic;

  Room.fromMinimalMap(json)
      : this._idRoom = json['idRoom'],
        this._roomName = json['roomName'],
        this._latitude = json['latitude'],
        this._longitude = json['longitude'],
        this._participantsList = json['participantsList'];

//SETTERS

  setDistance(double value) => _distance = value;
  setParticipantsList(List<dynamic> participantsList) => _participantsList = participantsList;
//   setUserNickName(String userNickName) => _userNickName = userNickName;
//   setRoomName(String roomName) => _roomName = roomName;
//   setIcon(String icon) => _icon = icon;
//   setIdRoom(int idRoom) => _idRoom = idRoom;
//   setLatitude(double latitude) => _latitude = latitude;
//   setLongitude(double longitude) => _longitude = longitude;
//   setIsPublic(bool isPublic) => _isPublic = isPublic;
//   setUsersList(List<dynamic> usersList) => _usersList = usersList;


  // Room({
  //   required idRoom,
  //   required roomName,
  //   required userNickName,
  //   required isPublic,
  //   required latitude,
  //   required longitude,
  //   required usersList,
  //   required messagesList,
  // })  : _idRoom = idRoom,
  //       _roomName = roomName,
  //       _latitude = latitude,
  //       _longitude = longitude,
  //       _userNickName = userNickName,
  //       _isPublic = isPublic,
  //       _usersList = usersList,
  //       _messagesList = messagesList;

  // Map<String, dynamic> toMap() {
  //   return {
  //     'idRoom': this._idRoom,
  //     'roomName': this._roomName,
  //     'latitude': this._latitude,
  //     'longitude': this._longitude,
  //     'userNickName': this._userNickName,
  //     'isPublic': this._isPublic,
  //     'usersList': this._usersList,
  //     'messagesList': this._messagesList
  //   };
  // }

  // Room.fromMap(json)
  //     : this._idRoom = json['idRoom'],
  //       this._roomName = json['roomName'],
  //       this._latitude = json['latitude'],
  //       this._longitude = json['longitude'],
  //       this._userNickName = json['userNickName'],
  //       this._isPublic = json['isPublic'],
  //       this._usersList = json['usersList'],
  //       this._messagesList = json['messagesList'];
}

