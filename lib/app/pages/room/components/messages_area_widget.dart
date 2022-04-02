import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/pages/user/models/user.dart';

import 'package:pub/app/pages/room/view_models/room_view_model.dart';
import '../models/room.dart';
import '../../../core/components/interceptor_server.dart';

import 'package:provider/provider.dart';

import '../states/room_state.dart';
class MessagesArea extends StatefulWidget {
  MessagesArea(this.instance, this.room, this.user);
  final Room room;
  final User user;
  final RoomViewModel instance;
  @override
  State<MessagesArea> createState() => _MessagesAreaState();
}

class _MessagesAreaState extends State<MessagesArea> {

  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final interceptorServer = context.watch<InterceptorServer>();
    final state = interceptorServer.value;

    if (state is ErrorRoomState) {
      return Center(
        child: Text(state.message),
      );
    } else if (state is InicialRoomState) {

      return Expanded(
          child: Container()
       );

    } else if (state is SendMessageState || state is ReceiveMessageState) {

      return  StreamBuilder( stream: widget.instance.interceptor.getResponse,
          initialData: [],
          builder:(_, AsyncSnapshot snapshot){

            widget.instance.interceptor.getData(snapshot);

            return Expanded(
                child: ListView.builder(
                    controller: widget.instance.interceptor.scrollController,
                    itemCount: widget.instance.getMessagesList.length,
                    itemBuilder: (_, index) {
                      // if (snapshot.data!.getType == 'enter_room') {
                      //   return ListTile(title: Text('${instance.room.getUserNickName} entrou na sala'));
                      // }
                      // else if(snapshot.data!.getType == 'leave_room'){
                      //   return ListTile(title: Text('${userAux.getNickname} saiu da sala'));
                      // }
                      return Align(
                        alignment: widget.instance.getMessagesList[index].getUser !=
                            widget.user.getNickname ?
                        Alignment.centerLeft : Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                color: widget.instance.getMessagesList[index].getUser != widget.user.getNickname ?
                                Colors.white : Color(0xffdcd9d9),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    8))),
                            child: AnimatedBuilder(
                                animation: widget.instance.interceptor,
                                builder: (context, child) {
                                  return Text('${widget.instance.getMessagesList[index]
                                      .getUser} - ${widget.instance
                                      .getMessagesList[index].getTextMessage}',
                                      style: GoogleFonts.inter(fontSize: 14));
                                }
                            ),
                          ),
                        ),
                      );
                    }
                ));
          });
         } else {
      return Container(child: Text("Errooo!!!"),);
    }
  }
}
