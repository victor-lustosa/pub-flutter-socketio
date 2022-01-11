import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:pub/models/estabelecimento_model.dart';
import 'crud_interface.dart';

// const url = 'http://127.0.0.1:8000/pubapi/estabelecimentos/-10.181149910630188/-48.3375692306857';
class EstabelecimentoService implements CrudInterface{
  EstabelecimentoService();
  // List<Estabelecimento> listaEstabelecimentos = [];
  late Dio dio = Dio();
  late Response response;
  @override
  Future create(Object T) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<List<dynamic>> getAll() async {
    String latitude = '-10.257615194551102';
    String longitude = ' -48.325213882543736';

    dio.options.headers['content-Type'] = 'application/json, charset=utf-8';
    var response = await dio.get('https://pubapi-django.herokuapp.com/pubapi/estabelecimentos/${latitude}/${longitude}');
    return response.data;

  }
  
}