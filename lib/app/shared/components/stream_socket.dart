import 'dart:async';

import '../../models/message.dart';
import '../../models/room.dart';

// class StreamSocket{
//   StreamSocket._();
//   static final StreamSocket instance = StreamSocket._();
//   final _socketResponse = StreamController<Room>.broadcast();
//   toStringStream(){
//     _socketResponse.toString();
//   }
//   void Function(Room) get addResponse => _socketResponse.sink.add;
//
//   Stream<Room> get getResponse => _socketResponse.stream;
//
//   void dispose(){
//     _socketResponse.close();
//   }
// }