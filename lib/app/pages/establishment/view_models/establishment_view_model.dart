import 'package:pub/app/pages/establishment/models/establishment.dart';
import 'package:pub/app/pages/establishment/repositories/establishment_repository.dart';
import 'package:pub/app/pages/room/models/room.dart';
import 'package:pub/app/pages/user/models/user.dart';
import '../models/dto/establishment_repository_dto.dart';

abstract class IEstablishmentViewModel{
  Future<List<Establishment>> getListEstablishments(EstablishmentRepositoryDTO establishment);
}

class EstablishmentViewModel implements IEstablishmentViewModel{

  EstablishmentViewModel(this.repository, this.roomList);
  bool isExist = false;
  final DioEstablishmentRepository repository;
  List<Room> roomList;

  Future<List<Establishment>> getListEstablishments(EstablishmentRepositoryDTO establishment) async{
    try{
      List listEstablishments = await repository.fetchEstablishments(establishment);
      return listEstablishments.map((model) => Establishment.withJson(model)).toList();

    } catch (e){
      return throw Exception("Erro ao listar Estabelecimentos: $e");
    }
  }

  void verifyParticipantsList(data, user) {

    if(user!= null && user.getNickname!= ''){
      for(dynamic room in roomList){
        if(user.getNickname == room.getUserNickName) {
          isExist = true;
        }
        if(!isExist){
          room.addParticipants(user);
        }
        if(room.getRoomName == data.getRoomName){
          room.setParticipantsList(data.getParticipantsList());
        }
      }
    }
  }

  void mapEstablishmentToRoom(establishmentList) {
    for(dynamic establishment in establishmentList){
      Room room = Room.withoutParameters();
      room.setRoomName(establishment.getName);
      roomList.add(room);
    }
  }
}

