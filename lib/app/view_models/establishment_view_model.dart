
import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/repositories/establishment_repository.dart';


abstract class IEstablishmentViewModel{
  Future<List<Establishment>> listaEstabelecimentos(String latitude, String longitude);
}

class EstablishmentViewModel implements IEstablishmentViewModel{
  IEstablishmentRepository repository;
  EstablishmentViewModel(this.repository);

  Future<List<Establishment>> listaEstabelecimentos(String latitude, String longitude) async{
    try{
      List lista = await repository.getAllEstabelecimentos(latitude, longitude);
      return lista.map((model) => Establishment.with_JSON(model)).toList();
    }
    catch (e){
      return throw Exception("Erro ao listar Estabelecimentos: $e");
    }
  }
}

