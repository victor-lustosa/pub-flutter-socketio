import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pub/app/pages/room/bloc/message_bloc.dart';
import 'package:pub/app/pages/room/view_models/room_view_model.dart';
import 'package:pub/app/pages/user/models/user.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/room.dart';

class MessagesAreaWidget extends StatefulWidget {
  MessagesAreaWidget(this.instance, this.room, this.user, this.bloc);
  final Room room;
  final User user;
  final MessageBloc bloc;
  final RoomViewModel instance;

  @override
  State<MessagesAreaWidget> createState() => _MessagesAreaWidgetState();
}

class _MessagesAreaWidgetState extends State<MessagesAreaWidget> {

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
    return  BlocBuilder<MessageBloc,MessageState>(
        bloc: widget.bloc,
        buildWhen: (context, current) => context != current && !(current is DontBuildState),
        builder:(context, state){
          if(state is InitialState) {
            return Expanded( child: Container());
          }
          else if(state is ReceiveEnterPublicRoomMessageState){
            return ListTile(title: Text('${state.message.userNickName} entrou na sala'));
          }
          else if(state is ReceiveLeavePublicRoomMessageState ){
            return ListTile(title: Text('${state.message.userNickName} saiu da sala'));
          }
          else if(state is ReceiveMessageState || state is SendMessageState) {
            if(state is ReceiveMessageState)
              this.widget.instance.addMessage(state, widget.bloc);

            return Expanded(
                child: ListView.builder(
                    controller: this.widget.instance.scrollController,
                    itemCount:widget.instance.room.getMessagesList.length,
                    itemBuilder: (context, index) {
                      return Align(
                        alignment: widget.instance.room.getMessagesList[index].getUser != widget.user.getNickname ? Alignment.centerLeft : Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                  color: widget.instance.room.getMessagesList[index].getUser != widget.user.getNickname ? Colors.white : Color(0xffdcd9d9),
                                  borderRadius: BorderRadius.all(Radius.circular(8))),
                              child: Text('${widget.instance.room.getMessagesList[index].getUser} - ${widget.instance.room.getMessagesList[index].getTextMessage}',
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
