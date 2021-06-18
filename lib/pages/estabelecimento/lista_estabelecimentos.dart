import 'dart:convert';

import 'package:pub/models/estabelecimento.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ListaEstabelecimentos extends StatefulWidget {
  List<Estabelecimento> listaEstabelecimento;

  ListaEstabelecimentos({required this.listaEstabelecimento});


  @override
  _ListaEstabelecimentosState createState() => _ListaEstabelecimentosState();
}

class _ListaEstabelecimentosState extends State<ListaEstabelecimentos> {
  List<Estabelecimento>? get returno => null;
  
  void buscaLista() async{
    http.Response response =
    await http.get(Uri.parse('http://127.0.0.1:8000/pubapi/estabelecimentos/-10.181149910630188/-48.3375692306857'));

    print(response.statusCode);
    List<String>? retorno = json.decode(response.body);
    setState(() {
      widget.listaEstabelecimento = this.returno!;
    });
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
                            child:Text("Aeroportos"))],
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
                                        itemCount: widget.listaEstabelecimento.length , itemBuilder: (context,index) {
                                      return ListTile(
                                          title: widget.listaEstabelecimento[index].getNome,
                                          onTap: () {
                                            avancar(context,index);
                                          });})))]))
                ]
            )
        )
    );
  }
}