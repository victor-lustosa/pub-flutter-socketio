import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/repositories/establishment_repository.dart';
import '../models/dto/establishment_repository_dto.dart';

abstract class IEstablishmentViewModel{
  Future<List<Establishment>> getListEstablishments(EstablishmentRepositoryDTO establishment);
}

class EstablishmentViewModel implements IEstablishmentViewModel{

  EstablishmentViewModel(this.repository, this.establishmentList);

  final DioEstablishmentRepository repository;
  List establishmentList;

  Future<List<Establishment>> getListEstablishments(EstablishmentRepositoryDTO establishment) async{
    try{
      List listEstablishments = await repository.fetchEstablishments(establishment);
      return listEstablishments.map((model) => Establishment.withJson(model)).toList();
    }
    catch (e){
      return throw Exception("Erro ao listar Estabelecimentos: $e");
    }
  }
}

