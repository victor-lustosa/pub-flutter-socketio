import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pub/app/core/models/data/send_message_data.dart';
import 'package:pub/app/pages/room/bloc/message_bloc.dart';
import 'package:pub/app/pages/room/view_models/room_view_model.dart';
import 'package:pub/app/pages/user/models/user.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/room.dart';

class MessagesAreaWidget extends StatefulWidget {
  MessagesAreaWidget(this.instanceMessageArea, this.room, this.user);
  final Room room;
  final User user;
  final RoomViewModel instanceMessageArea;

  @override
  State<MessagesAreaWidget> createState() => _MessagesAreaWidgetState();
}

class _MessagesAreaWidgetState extends State<MessagesAreaWidget> {
  List<SendMessageData> messagesList = [];
  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageBloc,MessageState>(
        buildWhen: (previous, current) => previous != current && current is ReceiveMessageState,
        builder:(context, snapshot){
          if(snapshot is InitialMessageState) {
            return Expanded( child: Container());
          } else if(snapshot is ReceiveMessageState) {
            messagesList =  snapshot.messages;
            Timer(Duration(microseconds: 100), (){
              this.widget.instanceMessageArea.scrollController.jumpTo(
                  this.widget.instanceMessageArea.scrollController.position.maxScrollExtent
              );
            });
            return Expanded(
                child: ListView.builder(
                    controller: this.widget.instanceMessageArea.scrollController,
                    itemCount:messagesList.length,
                    itemBuilder: (context, index) {
                      // if (snapshot.data!.getType == 'enter_room') {
                      //   return ListTile(title: Text('${instance.room.getUserNickName} entrou na sala'));
                      // }
                      // else if(snapshot.data!.getType == 'leave_room'){
                      //   return ListTile(title: Text('${userAux.getNickname} saiu da sala'));
                      // }
                      return Align(
                        alignment: messagesList[index].getUser != widget.user.getNickname ? Alignment.centerLeft : Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                  color: messagesList[index].getUser != widget.user.getNickname ? Colors.white : Color(0xffdcd9d9),
                                  borderRadius: BorderRadius.all(Radius.circular(8))),
                              child: Text('${messagesList[index].getUser} - ${messagesList[index].getTextMessage}',
                                  style: GoogleFonts.inter(fontSize: 14))
                          ),
                        ),
                      );
                    }
                ));
          }else  {
            return Expanded( child: Container(child: Text("Errro!!")));
          }}
    );
  }
}
