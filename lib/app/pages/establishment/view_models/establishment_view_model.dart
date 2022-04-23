
import 'package:pub/app/pages/room/models/room.dart';

class EstablishmentViewModel{

  EstablishmentViewModel();

  bool isExist = false;

  List<Room> _roomsList = [];

  get getRoomsList => _roomsList;

  setRoomsList(List<Room> roomsList) => _roomsList = roomsList;

// getRoomsList(EstablishmentRepositoryDTO establishment) async{
  //   try{
  //     List data = await repository.fetchEstablishments(establishment);
  //     return data.map((model) => Room.fromMap(model)).toList();
  //
  //   } catch (e){
  //     return throw Exception("Erro ao listar Estabelecimentos: $e");
  //   }
  // }

  // void verifyParticipantsList(data, user) {
  //
  //   if(user!= null && user.getNickname!= ''){
  //     for(dynamic room in roomList){
  //       if(user.getNickname == room.getUserNickName) {
  //         isExist = true;
  //       }
  //       if(!isExist){
  //         room.addParticipants(user);
  //       }
  //       if(room.getRoomName == data.getRoomName){
  //         room.setParticipantsList(data.getParticipantsList());
  //       }
  //     }
  //   }
  // }
}

