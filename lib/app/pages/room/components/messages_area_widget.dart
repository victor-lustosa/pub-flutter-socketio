import 'package:flutter/material.dart';
import 'package:pub/app/pages/room/bloc/message_bloc.dart';
import 'package:pub/app/pages/room/view_models/room_view_model.dart';
import 'package:pub/app/pages/user/models/user.dart';
import 'package:google_fonts/google_fonts.dart';
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

      return  StreamBuilder<Map<String, dynamic>>(
          stream: messageBloc.server,
          builder:(context, AsyncSnapshot<Map<String, dynamic>> snapshot){
            if(snapshot.hasData) {
              widget.instanceMessageArea.getData(snapshot);
            }
            return Expanded(
                child: ListView.builder(
                    controller: widget.instanceMessageArea.scrollController,
                    itemCount: widget.instanceMessageArea.getMessagesList.length,
                    itemBuilder: (_, index) {
                      // if (snapshot.data!.getType == 'enter_room') {
                      //   return ListTile(title: Text('${instance.room.getUserNickName} entrou na sala'));
                      // }
                      // else if(snapshot.data!.getType == 'leave_room'){
                      //   return ListTile(title: Text('${userAux.getNickname} saiu da sala'));
                      // }
                      return Align(
                        alignment: widget.instanceMessageArea.getMessagesList[index].getUser !=
                            widget.user.getNickname ?
                        Alignment.centerLeft : Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                color: widget.instanceMessageArea.getMessagesList[index].getUser != widget.user.getNickname ?
                                Colors.white : Color(0xffdcd9d9),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    8))),
                            child: Text('${widget.instanceMessageArea.getMessagesList[index]
                                      .getUser} - ${widget.instanceMessageArea
                                      .getMessagesList[index].getTextMessage}',
                                      style: GoogleFonts.inter(fontSize: 14))
                            ),
                          ),
                        // ),
                      );
                    }
                ));
          });
    //      } else {
    //   return Container(child: Text("Errooo!!!"),);
    // }
  }
}
