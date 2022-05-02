
import 'package:pub/app/pages/participant/models/participant.dart';

class Room {
  String _idRoom = '';
  String _roomName = '';
  // String _userNickName = '';
  String _icon = '';
  bool _isPublic = false;
  List<dynamic> _users = [];
  List<Participant> _participants = [];
  List<dynamic> _messages = [];
  late double _latitude;
  late double _longitude;
  late double _distance;

  Room.withoutParameters();

  addMessages(dynamic data) {
    _messages.add(data);
  }
  addParticipants(Participant data) {
    _participants.add(data);
  }
  //GETTERS
  // get getUserNickName => _userNickName;
  get getDistance => _distance;
  get getRoomName => _roomName;
  get getUsers => _users;
  get getParticipants => _participants;
  get getMessages => _messages;
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
        this._participants = Participant.convertList(json['participants']);

//SETTERS

  setDistance(double value) => _distance = value;
  setParticipants(List<Participant> participants) => _participants = participants;
//   setUserNickName(String userNickName) => _userNickName = userNickName;
//   setRoomName(String roomName) => _roomName = roomName;
//   setIcon(String icon) => _icon = icon;
//   setIdRoom(int idRoom) => _idRoom = idRoom;
//   setLatitude(double latitude) => _latitude = latitude;
//   setLongitude(double longitude) => _longitude = longitude;
//   setIsPublic(bool isPublic) => _isPublic = isPublic;
//   setUsers(List<dynamic> users) => _users = users;


  // Room({
  //   required idRoom,
  //   required roomName,
  //   required userNickName,
  //   required isPublic,
  //   required latitude,
  //   required longitude,
  //   required users,
  //   required messages,
  // })  : _idRoom = idRoom,
  //       _roomName = roomName,
  //       _latitude = latitude,
  //       _longitude = longitude,
  //       _userNickName = userNickName,
  //       _isPublic = isPublic,
  //       _users = users,
  //       _messages = messages;

  // Map<String, dynamic> toMap() {
  //   return {
  //     'idRoom': this._idRoom,
  //     'roomName': this._roomName,
  //     'latitude': this._latitude,
  //     'longitude': this._longitude,
  //     'userNickName': this._userNickName,
  //     'isPublic': this._isPublic,
  //     'users': this._users,
  //     'messages': this._messages
  //   };
  // }

  // Room.fromMap(json)
  //     : this._idRoom = json['idRoom'],
  //       this._roomName = json['roomName'],
  //       this._latitude = json['latitude'],
  //       this._longitude = json['longitude'],
  //       this._userNickName = json['userNickName'],
  //       this._isPublic = json['isPublic'],
  //       this._users = json['users'],
  //       this._messages = json['messages'];
}

