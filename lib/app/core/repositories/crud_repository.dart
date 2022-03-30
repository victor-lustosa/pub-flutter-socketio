


import 'package:pub/app/core/repositories/repository.dart';

abstract class  CrudRepository<T> implements Repository{

  @override
  Future create(Object T) {
    throw UnimplementedError();
  }

  Future<List> getAll(Object T) async {

    throw UnimplementedError();
  }

  // @override
  // Future<List<Object T>> getAll(dynamic obj) async {
  //   dio.options.headers['content-Type'] = 'application/json, charset=utf-8';
  //   return response = await dio.get(baseUrl + obj);
  // }
}