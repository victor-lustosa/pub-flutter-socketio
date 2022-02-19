import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/models/message.dart';
import 'package:pub/app/models/user.dart';
import 'package:pub/app/shared/components/stream_socket.dart';
import 'package:pub/app/view_models/room_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rx_notifier/rx_notifier.dart';
import '../../../models/room.dart';
import '../../../shared/config/app_colors.dart';

class MessageBoxWidget extends StatefulWidget {
  Room room;
  User user;

  MessageBoxWidget(this.room, this.user);

  @override
  _MessageBoxWidgetState createState() => _MessageBoxWidgetState();
}

class _MessageBoxWidgetState extends State<MessageBoxWidget> {

  late final RoomViewModel instance;
  String _enteredText = '';
  // ScrollController _scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    instance = RoomViewModel(widget.room,widget.user);

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Expanded(
        // child:
        // StreamBuilder(
        //     stream: StreamSocket.instance.getResponse,
        //     builder: (context,AsyncSnapshot<Room> snapshot) {
        //       switch (snapshot.connectionState) {
        //         case ConnectionState.none:
        //         case ConnectionState.waiting:
        //           return Center(
        //             child: CircularProgressIndicator(color:AppColors.brown ),
        //           );
        //           break;
        //         case ConnectionState.active:
        //         case ConnectionState.done:
        //           return
        //             Align(
        RxBuilder(builder:(_){
          return Expanded(
            child: ListView.builder(
                itemCount: instance.listEvents.length,
                itemBuilder: (_,id){
                  final event = instance.listEvents[id];
                  print('evento ${event}');
                  // if (event.getType == 'enter_room') {
                  //   return ListTile(title: Text('${widget.user.getNickname} entrou na sala'));
                  // }else if(event.getType == 'leave_room'){
                  //   return ListTile(title: Text('${widget.user.getNickname} saiu da sala'));
                  // }
                  Color color = Color(0xffdcd9d9);
                  Alignment alignment = Alignment.centerRight;
                  if(event.getMessage.getUser != widget.user.getNickname){
                    color = Colors.white;
                    alignment = Alignment.centerLeft;
                  }
                  return Align(
                    alignment: alignment,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text('${event.getMessage.getUser} - ${event.getMessage.getTextMessage}',
                          style: GoogleFonts.inter(fontSize: 14),
                        ),
                      ),
                    ),
                  );
                }),
          );}),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 4,right: 8),
                child: TextField(
                  onEditingComplete: () {},
                  onChanged: (String value) {
                    setState(() {
                      _enteredText = value;
                    });
                  },
                  onSubmitted: (_) { instance.sendMessage();},
                  controller: instance.textController,
                  autofocus: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: instance.sizeBoxMessage(_enteredText) ,
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
                  onPressed: (){
                    instance.sendMessage();
                  },
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
