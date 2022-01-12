import 'package:flutter/material.dart';
import 'package:pub/config/app_colors.dart';
import 'package:pub/models/estabelecimento_model.dart';
import 'package:pub/models/mensagem_model.dart';
import 'package:pub/models/sala_model.dart';
import 'package:pub/models/usuario_model.dart';
import 'package:pub/view_models/sala_view_model.dart';
import 'package:pub/widgets/caixa_mensagem_widget.dart';

class SalaPage extends StatefulWidget {
  Estabelecimento estabelecimento;
  Usuario usuario;
  SalaPage({required this.estabelecimento, required this.usuario });
  @override
  _SalaPageState createState() => _SalaPageState();
}
class _SalaPageState extends State<SalaPage>  {


  // ScrollController _scrollController = ScrollController();
  // QuerySnapshot querySnapshot = snapshot.data;
  // final _controller = StreamController<QuerySnapshot>.broadcast();

  @override
  Widget build(BuildContext context) {



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
              child: Text(widget.estabelecimento.getNome,
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
                  CaixaMensagemWidget(estabelecimento: this.widget.estabelecimento, usuario: this.widget.usuario),
                ],
              ),
            )),
      ),
    );
  }
}