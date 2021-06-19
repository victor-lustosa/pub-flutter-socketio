import 'dart:io';
import 'package:pub/config/app_routes.dart';
import 'package:pub/services/crud_interface.dart';

 class CrudService implements CrudInterface{
   CrudService();
  @override
  Future create(Object T) {
    throw UnimplementedError();
  }

  @override
 Future getAll(dynamic obj) async {
    return await HttpClient().get(baseUrl, porta, obj);
  }
 }