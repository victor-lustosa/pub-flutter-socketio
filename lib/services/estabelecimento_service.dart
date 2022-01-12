
import 'package:dio/dio.dart';
import 'package:pub/config/app_routes.dart';
import 'interface_service.dart';

class EstabelecimentoService implements InterfaceService{

  @override
  Future create(Object T) {
    // TODO: implement create
    throw UnimplementedError();
  }

  Future<List<dynamic>> getAllEstabelecimentos(Dio dio, String latitude, String longitude) async {
    try {

      dio.options.headers['content-Type'] = 'application/json, charset=utf-8';
      var response = await dio.get('${urlEstabelecimentos}/${latitude}/${longitude}');
      return response.data;
    }catch(e){

      return throw Future.error("Erro ao receber dados de Estabelecimentos: $e");
    }
  }
}