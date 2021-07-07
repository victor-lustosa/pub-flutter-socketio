import 'package:pub/models/estabelecimento.dart';
import 'package:flutter/material.dart';
import 'package:pub/models/sala.dart';
import 'package:pub/models/usuario.dart';
import 'package:pub/services/crud_service.dart';

import 'package:dio/dio.dart';
class ListaEstabelecimentos extends StatefulWidget {
  Usuario usuario;
  String latitude;
  String longitude;
  ListaEstabelecimentos({required this.usuario, required this.latitude, required this.longitude });
  @override
  _ListaEstabelecimentosState createState() => _ListaEstabelecimentosState();
}

class _ListaEstabelecimentosState extends State<ListaEstabelecimentos> {
  CrudService crud = CrudService();
  List<Estabelecimento> listaEstabelecimentos = [];
  Sala sala = Sala();
  Dio dio = Dio();
  late String latitude;
  late String longitude;
  late Response response;

  Future<List<Estabelecimento>> buscaAllDados() async {
    latitude = this.widget.latitude;
    longitude = this.widget.longitude;
    dio.options.headers['content-Type'] = 'application/json, charset=utf-8';
    var response = await dio.get('/pubapi/estabelecimentos/${latitude}/${longitude}');
    List lista = response.data;
    listaEstabelecimentos = lista.map((model) => Estabelecimento.with_JSON(model)).toList();
    return listaEstabelecimentos;
  }

  @override
  Widget build (BuildContext context) {
   var lista = FutureBuilder<List<Estabelecimento>>(
        future:buscaAllDados(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<Estabelecimento>> snapshot){
          final List<Estabelecimento>? estabelecimentos = snapshot.data;

          switch(snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Container(
                  child: Center(
                    child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF422600)),),
                  ));
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (!snapshot.hasData) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(  valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF422600)),),
                  ),
                );
              }
              return ListView.builder(
                  itemCount:  snapshot.data!.length , itemBuilder: (context,index) {
                return ListTile(
                    title:Text(estabelecimentos![index].getNome),
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Sala(estabelecimento:estabelecimentos![index]),),);
                    });}
              );
              break;
          }
          return Text('Unkown error');
        });

    return Scaffold(
        appBar:
        PreferredSize(
            preferredSize: Size.fromHeight(115),
            child: SafeArea(
                top: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children:<Widget>[
                        Padding(padding: EdgeInsets.only(top: 22),
                            child:Text("Estabelecimentos"))],
                      mainAxisAlignment: MainAxisAlignment.center,)
                    ,],))),
        body: SafeArea(
            child:  PageView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget> [
                  Container(
                      decoration: BoxDecoration(color: Colors.black12),
                      child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 30),),
                            Expanded(
                                child: SizedBox(
                                    child: lista))]))
                ]

    )));

  }
  }
