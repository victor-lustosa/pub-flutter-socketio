import 'dart:convert';

import 'package:pub/config/app_routes.dart';
import 'package:pub/models/estabelecimento.dart';
import 'package:pub/services/crud_interface.dart';
import 'package:dio/dio.dart';

class CrudService implements CrudInterface{
  CrudService();
  Dio dio = Dio();
  late Response response;

  @override
  Future create(Object T) {
    throw UnimplementedError();
  }

  @override
  Future getAll(dynamic obj) async {
    dio.options.headers['content-Type'] = 'application/json, charset=utf-8';
    return response = await dio.get(baseUrl + obj);
  }
}