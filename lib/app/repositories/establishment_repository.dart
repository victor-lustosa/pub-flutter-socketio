
import 'package:dio/dio.dart';
import 'package:pub/app/config/app_routes.dart';
import 'repository.dart';

 abstract class IEstablishmentRepository implements Repository{

  Future<List<dynamic>> getAllEstablishments(String latitude, String longitude){
    throw UnimplementedError();
  }
}

class DioEstablishmentRepository  implements IEstablishmentRepository{
  Dio dio;
  DioEstablishmentRepository(this.dio);

  @override
  Future create(Object T) {
    throw UnimplementedError();
  }

  @override
  Future<List<dynamic>> getAllEstablishments(String latitude, String longitude) async {
    try {

      dio.options.headers['content-Type'] = 'application/json, charset=utf-8';
      var response = await dio.get('${urlEstablishments}/${latitude}/${longitude}');
      return response.data;
    } catch(e){
      return throw Exception("Erro ao receber dados de Estabelecimentos: $e");
    }
  }
}