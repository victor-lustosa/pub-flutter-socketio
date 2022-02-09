import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/repositories/establishment_repository.dart';
import 'package:dio/dio.dart';
abstract class IEstablishmentViewModel{
  Future<List<Establishment>> getListEstablishments(String latitude, String longitude);
}

class EstablishmentViewModel implements IEstablishmentViewModel{
  EstablishmentViewModel._(this.repository, this.establishmentList);
  static final EstablishmentViewModel instance = EstablishmentViewModel._(DioEstablishmentRepository(Dio()),[]);
  final IEstablishmentRepository repository;
  List establishmentList;

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

