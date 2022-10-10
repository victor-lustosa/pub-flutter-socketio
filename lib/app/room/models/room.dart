import 'package:pub/app/participant/models/participant.dart';

class Room {
  String _idRoom = '';
  String _roomName = '';
  // String _userNickName = '';
  // String _icon = '';
  // bool _isPublic = false;
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

  removeParticipants(Participant data) {
    _participants.removeWhere((element) => data.getIdUser == element.getIdUser);
  }

  //GETTERS
  get getDistance => _distance;
  get getRoomName => _roomName;
  get getUsers => _users;
  get getParticipants => _participants;
  get getMessages => _messages;
  get getIdRoom => _idRoom;
  get getLatitude => _latitude;
  get getLongitude => _longitude;

  Room.fromMinimalMap(json)
      : this._idRoom = json['idRoom'],
        this._roomName = json['roomName'],
        this._latitude = json['latitude'],
        this._longitude = json['longitude'],
        this._participants = Participant.convertList(json['participants']);

//SETTERS
  setDistance(double value) => _distance = value;
  setIdRoom(String idRoom) => _idRoom = idRoom;
  setParticipants(List<Participant> participants) =>
      _participants = participants;
}
