
import 'package:flutter/cupertino.dart';
import 'package:pub/models/estabelecimento_model.dart';
import 'package:pub/services/estabelecimento_service.dart';
import 'package:dio/dio.dart';
class EstabelecimentoViewModel {

  Future<List<Estabelecimento>> listaEstabelecimentos(EstabelecimentoService service, String latitude, String longitude) async{
    try{
    List lista = await service.getAllEstabelecimentos(Dio(),latitude,longitude);
    return lista.map((model) => Estabelecimento.with_JSON(model)).toList();
    }
    catch (e){
      return throw Future.error("Erro ao listar Estabelecimentos: $e");
    }
  }
}

