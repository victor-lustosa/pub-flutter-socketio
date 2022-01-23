
import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/repositories/establishment_repository.dart';


abstract class IEstablishmentViewModel{
  Future<List<Establishment>> getListEstablishments(String latitude, String longitude);
}

class EstablishmentViewModel implements IEstablishmentViewModel{
  final IEstablishmentRepository repository;
  EstablishmentViewModel(this.repository, this._establishmentList);
   List<dynamic> _establishmentList;

  List<dynamic> get establishmentList => _establishmentList;

  set establishmentList(List<dynamic> value) {
    _establishmentList = value;
  }

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

