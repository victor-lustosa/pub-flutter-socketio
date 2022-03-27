import 'package:pub/app/models/data/data.dart';

class EnterPublicRoomData extends Data{

 late String roomName;
 late String userNickName;

 EnterPublicRoomData(this.roomName, this.userNickName, String type) : super(type);

}