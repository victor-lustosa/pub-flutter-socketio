import 'package:flutter/material.dart';
import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/models/user.dart';
import 'package:pub/app/shared/components/message_box_widget.dart';

class RoomPage extends StatefulWidget {
  Establishment establishment;
  User user;
  RoomPage(this.establishment, this.user);
  @override
  _RoomPageState createState() => _RoomPageState();
}
class _RoomPageState extends State<RoomPage>  {

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
              child: Text(widget.establishment.getName,
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
                  MessageBoxWidget(this.widget.establishment, this.widget.user),
                ],
              ),
            )),
      ),
    );
  }
}