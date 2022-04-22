// import 'package:pub/app/pages/establishment/models/establishment.dart';
// import 'package:pub/app/pages/establishment/repositories/establishment_repository.dart';
// import 'package:pub/app/pages/room/models/room.dart';
// import 'package:pub/app/pages/user/models/user.dart';
// import '../models/dto/establishment_repository_dto.dart';
//
// abstract class IEstablishmentViewModel{
//   Future<List<Room>> getRoomsList(EstablishmentRepositoryDTO establishment);
// }
//
// class EstablishmentViewModel implements IEstablishmentViewModel{
//
//   EstablishmentViewModel(this.repository, this.roomList);
//   bool isExist = false;
//   final DioEstablishmentRepository repository;
//   List<Room> roomList;
//
//   Future<List<Room>> getRoomsList(EstablishmentRepositoryDTO establishment) async{
//     try{
//       List data = await repository.fetchEstablishments(establishment);
//       return data.map((model) => Room.fromMap(model)).toList();
//
//     } catch (e){
//       return throw Exception("Erro ao listar Estabelecimentos: $e");
//     }
//   }
//
//   void verifyParticipantsList(data, user) {
//
//     if(user!= null && user.getNickname!= ''){
//       for(dynamic room in roomList){
//         if(user.getNickname == room.getUserNickName) {
//           isExist = true;
//         }
//         if(!isExist){
//           room.addParticipants(user);
//         }
//         if(room.getRoomName == data.getRoomName){
//           room.setParticipantsList(data.getParticipantsList());
//         }
//       }
//     }
//   }
// }
//
