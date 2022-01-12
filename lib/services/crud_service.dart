
import 'package:pub/services/interface_service.dart';
import 'package:dio/dio.dart';

abstract class  CrudService implements InterfaceService{

  @override
  Future create(Object T) {
    throw UnimplementedError();
  }

  Future<List> getAll(Dio dio) async {

    throw UnimplementedError();
  }

  // @override
  // Future<List<Object T>> getAll(dynamic obj) async {
  //   dio.options.headers['content-Type'] = 'application/json, charset=utf-8';
  //   return response = await dio.get(baseUrl + obj);
  // }
}