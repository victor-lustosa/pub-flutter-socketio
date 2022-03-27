import 'package:dio/dio.dart';
import '../models/dto/establishment_repository_dto.dart';
import '../shared/config/app_routes.dart';
import 'repository.dart';

 abstract class IEstablishmentRepository implements Repository{

  Future<List> fetchEstablishments(EstablishmentRepositoryDTO establishment){
    throw UnimplementedError();
  }
}

class DioEstablishmentRepository  implements IEstablishmentRepository{

  DioEstablishmentRepository(this.dio);

  final Dio dio;

  @override
  Future create(Object T) {
    throw UnimplementedError();
  }

  @override
  Future<List> fetchEstablishments(EstablishmentRepositoryDTO establishment) async {
    try {
      final params = <String, String>{
        'latitude': establishment.getLatitude,
        'longitude':establishment.getLongitude
      };
      dio.options.headers['content-Type'] = 'application/json, charset=utf-8';
      var response = await dio.get('$urlEstablishments',queryParameters: params);
      return response.data;
    } catch(e){
      return throw Exception("Erro ao receber dados de Estabelecimentos: $e");
    }
  }

}