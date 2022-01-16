
import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/repositories/establishment_repository.dart';


abstract class IEstablishmentViewModel{
  Future<List<Establishment>> getListEstablishments(String latitude, String longitude);
}

class EstablishmentViewModel implements IEstablishmentViewModel{
  IEstablishmentRepository repository;
  EstablishmentViewModel(this.repository);

  Future<List<Establishment>> getListEstablishments(String latitude, String longitude) async{
    try{
      List listEstablishments = await repository.getAllEstablishments(latitude, longitude);
      return listEstablishments.map((model) => Establishment.with_JSON(model)).toList();
    }
    catch (e){
      return throw Exception("Erro ao listar Estabelecimentos: $e");
    }
  }
}

