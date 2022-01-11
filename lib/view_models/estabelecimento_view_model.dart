
import 'package:flutter/cupertino.dart';
import 'package:pub/models/estabelecimento_model.dart';
import 'package:pub/services/estabelecimento_service.dart';
import 'package:dio/dio.dart';
class EstabelecimentoViewModel {

  EstabelecimentoViewModel();

   EstabelecimentoService service = EstabelecimentoService();

  Future<List<Estabelecimento>> listaEstabelecimentos() async{
    List lista = await service.getAll();
    return lista.map((model) => Estabelecimento.with_JSON(model)).toList();
  }

}

