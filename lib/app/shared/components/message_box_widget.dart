import 'package:flutter/material.dart';

import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/models/message.dart';
import 'package:pub/app/models/user.dart';
import 'package:pub/app/view_models/room_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/app_colors.dart';

class MessageBoxWidget extends StatefulWidget {
  Establishment establishment;
  User user;

  MessageBoxWidget(this.establishment, this.user);

  @override
  _MessageBoxWidgetState createState() => _MessageBoxWidgetState();
}

class _MessageBoxWidgetState extends State<MessageBoxWidget> {
  TextEditingController _messageController = TextEditingController();


  String _enteredText = '';
  List<String> listaMensagens = [
    'ola, tudo bem?',
    'tudo otimo, e contigo?',
    'Estou bem, queria ver uma coisa contigo, voce vai na corrida?',
    'nao sei ainda, cara',
    'porque se voce fosse, eu poderia te da um carona',
    'ahh sim, blz',
    'te aviso depois',
    'blz'
  ];

  @override
  initState() {
    super.initState();
  }

  _sizeBoxMessage(String value){
    if(value.length < 30) {
      return 1;
    } else if(value.length < 60){
      return 2;
    } else if(value.length < 100){
      return 3;
    } else{
      return 5;
    }
  }
  // ScrollController _scrollController = ScrollController();
  // QuerySnapshot querySnapshot = snapshot.data;
  // final _controller = StreamController<QuerySnapshot>.broadcast();

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
  //         }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: listaMensagens.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(14),
                      decoration: const BoxDecoration(
                          color: Color(0xffdcd9d9),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Text(
                        listaMensagens[index],
                        style: GoogleFonts.inter(fontSize: 14),
                      ),
                    ),
                  ),
                );
              }),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: TextField(
                  onEditingComplete: () {},
                  onChanged: (String value) {
                    setState(() {
                      _enteredText = value;
                    });
                  },
                  controller: _messageController,
                  autofocus: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: _sizeBoxMessage(_enteredText) ,
                  style: GoogleFonts.inter(fontSize: 15),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 6, 20, 6),
                      hintText: "Digite uma mensagem...",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: SizedBox(
                height: 48.0,
                width: 48.0,
                child: FloatingActionButton(
                  backgroundColor: AppColors.brown,
                  child: Icon(
                    Icons.near_me_outlined,
                    size: 29,
                    color: Colors.white,
                  ),
                  mini: true,
                  onPressed: RoomViewModel.instance.sendMessage(this.widget.establishment,
                      _messageController.text, Message(), this.widget.user),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
