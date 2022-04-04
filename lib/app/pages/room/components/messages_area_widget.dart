import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pub/app/core/models/data/send_message_data.dart';
import 'package:pub/app/pages/room/bloc/message_bloc.dart';
import 'package:pub/app/pages/room/view_models/room_view_model.dart';
import 'package:pub/app/pages/user/models/user.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/models/data/data.dart';
import '../models/room.dart';

class MessagesArea extends StatefulWidget {
  MessagesArea(this.instanceMessageArea, this.room, this.user);
  final Room room;
  final User user;
  final RoomViewModel instanceMessageArea;

  @override
  State<MessagesArea> createState() => _MessagesAreaState();
}

class _MessagesAreaState extends State<MessagesArea> {
  final MessageBloc messageBloc = MessageBloc(RoomViewModel.withoutInstance());

  @override
  initState() {
    super.initState();

  }

  @override
  void dispose() {
    messageBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<SendMessageData> messagesList = [];
    return  StreamBuilder<MessageState>(
        stream: messageBloc.stream,
        builder:(context, AsyncSnapshot<MessageState> snapshot){

          if(snapshot.hasData) {
            if(snapshot is ReceiveMessageState) {
              messagesList = snapshot.data?.messages.cast<SendMessageData>() ?? [];
              Timer(Duration(microseconds: 100 ), (){
                widget.instanceMessageArea.scrollController.jumpTo(widget.instanceMessageArea.scrollController.position.maxScrollExtent);
              });
            }}

            return Expanded(
                child: ListView.builder(
                    controller: widget.instanceMessageArea.scrollController,
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
                            child:AnimatedBuilder(
                                animation: widget.instanceMessageArea,
                                builder: (context,child) {
                                  return Text('${messagesList[index].getUser} - ${messagesList[index].getTextMessage}',
                                      style: GoogleFonts.inter(fontSize: 14));
                                }
                            ),
                          ),
                        ),
                      );
                    }
                ));
          });
  }
}
