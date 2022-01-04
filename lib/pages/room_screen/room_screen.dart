import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pub/models/estabelecimento.dart';
import 'package:pub/models/mensagem.dart';
import 'package:pub/models/sala.dart';
import 'package:pub/models/usuario.dart';

class RoomScreen extends StatefulWidget {
  Estabelecimento estabelecimento;
  Usuario usuario;
  RoomScreen({required this.estabelecimento, required this.usuario });
  @override
  _RoomScreenState createState() => _RoomScreenState();
}
class _RoomScreenState extends State<RoomScreen>  {
  Sala sala = Sala();
  TextEditingController _controllerMensagem = TextEditingController();
  ScrollController _scrollController = ScrollController();
  // QuerySnapshot querySnapshot = snapshot.data;

  // final _controller = StreamController<QuerySnapshot>.broadcast();
  _enviarMensagem() {
    String textoMensagem = _controllerMensagem.text;
    if (textoMensagem.isNotEmpty) {
      sala.getMensagem(Mensagem());
      sala.getMensagem().setUsuario(this.widget.usuario.getNickname());
      sala.getMensagem().setTextoMensagem(textoMensagem);
      sala.getMensagem().setDataEnvio(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {

    var caixaMensagem = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: TextField(
                controller: _controllerMensagem,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                    hintText: "Digite uma mensagem...",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32))
                ),
              ),
            ),
          ),
        FloatingActionButton(
            backgroundColor: Color(0xff075E54),
            child: Icon(
              Icons.send,
              color: Colors.white,
            ),
            mini: true,
            onPressed: _enviarMensagem,
          )
        ],
      ),
    );

    // var stream = StreamBuilder(
    //   stream: _controller.stream,
    //   builder: (context, snapshot) {
    //     switch (snapshot.connectionState) {
    //       case ConnectionState.none:
    //       case ConnectionState.waiting:
    //         return Center(
    //           child: Column(
    //             children: <Widget>[
    //               Text("Carregando mensagens"),
    //               CircularProgressIndicator()
    //             ],
    //           ),
    //         );
    //         break;
    //       case ConnectionState.active:
    //       case ConnectionState.done:
    //
    //         // QuerySnapshot querySnapshot = snapshot.data;
    //
    //         if (snapshot.hasError) {
    //           return Text("Erro ao carregar os dados!");
    //         } else {
    //           return Expanded(
    //             child: ListView.builder(
    //                 controller: _scrollController,
    //                 itemCount: querySnapshot.documents.length,
    //                 itemBuilder: (context, indice) {
    //
    //                   // //recupera mensagem
    //                   // List<DocumentSnapshot> mensagens = querySnapshot.documents.toList();
    //                   // DocumentSnapshot item = mensagens[indice];
    //
    //                   double larguraContainer =
    //                       MediaQuery.of(context).size.width * 0.8;
    //
    //                   //Define cores e alinhamentos
    //                   Alignment alinhamento = Alignment.centerRight;
    //                   Color cor = Color(0xffd2ffa5);
    //                   if ( _idUsuarioLogado != item["idUsuario"] ) {
    //                     alinhamento = Alignment.centerLeft;
    //                     cor = Colors.white;
    //                   }
    //
    //                   return Align(
    //                     alignment: alinhamento,
    //                     child: Padding(
    //                       padding: EdgeInsets.all(6),
    //                       child: Container(
    //                         width: larguraContainer,
    //                         padding: EdgeInsets.all(16),
    //                         decoration: BoxDecoration(
    //                             color: cor,
    //                             borderRadius:
    //                             BorderRadius.all(Radius.circular(8))),
    //                         child: Text(item["mensagem"],style: TextStyle(fontSize: 18),)
    //                       ),
    //                     ),
    //                   );
    //                 }),
    //           );
    //         }
    //
    //         break;
    //     }
    //   },
    // );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            // CircleAvatar(
            //     maxRadius: 20,
            //     backgroundColor: Colors.grey,
            //     backgroundImage: widget.contato.urlImagem != null
            //         ? NetworkImage(widget.contato.urlImagem)
            //         : null),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(widget.usuario.getNickname,
            ))
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage("imagens/bg.png"), fit: BoxFit.cover)),
        child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  // stream,
                  caixaMensagem,
                ],
              ),
            )),
      ),
    );
  }
}