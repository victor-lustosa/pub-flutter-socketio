import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pub/models/estabelecimento.dart';
import 'package:pub/models/estabelecimento.dart';
import 'package:flutter/material.dart';
import 'package:pub/models/sala.dart';
import 'package:pub/services/crud_interface.dart';
import 'package:pub/services/crud_service.dart';

class ListaEstabelecimentos extends StatefulWidget {

  @override
  _ListaEstabelecimentosState createState() => _ListaEstabelecimentosState();
}

class _ListaEstabelecimentosState extends State<ListaEstabelecimentos> {
 CrudService crud = CrudService();
  List<Estabelecimento> listaEstabelecimentos = [];
  Sala sala = Sala();


  void _getEstabelecimentos() async{
   this.crud.getAll('/pubapi/estabelecimentos/-10.181149910630188/-48.3375692306857').then((response){
        setState(() {
          List lista = response.data;
          listaEstabelecimentos = lista.map((model) => Estabelecimento.with_JSON(model)).toList();
        });});}

  _ListaEstabelecimentosState(){
    _getEstabelecimentos();
  }
  void avancar(BuildContext context, int index) {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => ListaVoos(aeroporto:aeroporto[index]),),);
  }
  @override
  Widget build (BuildContext context) {
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
                                    child: ListView.builder(
                                        itemCount: listaEstabelecimentos.length , itemBuilder: (context,index) {
                                      return ListTile(
                                          title:Text(listaEstabelecimentos[index].getNome),
                                          onTap: () {
                                            avancar(context,index);
                                          });})))]))
                ]
            )
        )
    );
  }
}