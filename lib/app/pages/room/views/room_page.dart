import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pub/app/pages/user/models/user.dart';
import '../../../core/configs/app_colors.dart';
import '../../../core/models/data/send_message_data.dart';
import '../bloc/message_bloc.dart';
import 'components/room_bar_widget.dart';
import '../models/room.dart';
import '../view_models/room_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
class RoomPage extends StatefulWidget {

  final Room room;
  final User user;

  RoomPage(this.room, this.user);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  List<SendMessageData> messagesList = [];
  late final RoomViewModel instance;

  @override
  void initState() {
    instance = RoomViewModel(room:this.widget.room,user: this.widget.user);
    super.initState();

  }
  @override
  void dispose() {
    instance.dispose();
    context.read<MessageBloc>().close();
    super.dispose();

  }
  @override
  void didUpdateWidget(covariant RoomPage oldWidget) {

    super.didUpdateWidget(oldWidget);
    context.read<MessageBloc>().add(DontBuildEvent());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title:RoomBarWidget(this.widget.room)),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage("imagens/bg.png"), fit: BoxFit.cover)),
        child: SafeArea(
            child: Container(
                padding: EdgeInsets.all(8),
                child:Column(
                  children: <Widget>[
                    BlocBuilder<MessageBloc,MessageState>(
                    buildWhen: (context, current) => context != current  && !(current is DontBuildState),
                    builder:(context, state){
                      if(state is InitialMessageState) {
                        return Expanded( child: Container());
                      }
                      else if(state is ReceiveEnterPublicRoomMessageState){
                        return ListTile(title: Text('${state.message.userNickName} entrou na sala'));
                      }
                      else if(state is ReceiveLeavePublicRoomMessageState ){
                        return ListTile(title: Text('${state.message.userNickName} saiu da sala'));
                      }
                      else if(state is ReceiveSendMessageState) {
                        messagesList.add(state.message);
                        Timer(Duration(microseconds: 100), (){
                          this.instance.scrollController.jumpTo(
                              this.instance.scrollController.position.maxScrollExtent
                          );
                        });
                        return Expanded(
                            child: ListView.builder(
                                controller: this.instance.scrollController,
                                itemCount:messagesList.length,
                                itemBuilder: (context, index) {
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
                ),
                    Row( children:[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 4, right: 8),
                          child: TextField(
                            onEditingComplete: () {},
                            onChanged: (String value) {
                              // if(value.length < 30) {
                              //   instance.lineNumbers = 1;
                              // } else if(value.length < 60){
                              //   instance.lineNumbers = 2;
                              // } else if(value.length < 100){
                              //   instance.lineNumbers = 3;
                              // } else{
                              //   instance.lineNumbers = 5;
                              // }
                            },
                            focusNode: this.instance.focusNode,
                            onSubmitted: (_) {
                              this.instance.sendMessage(context.read<MessageBloc>());
                            },
                            controller: this.instance.textController,
                            autofocus: true,
                            keyboardType: TextInputType.multiline,
                            maxLines: this.instance.lineNumbers,
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
                              onPressed: () {
                                this.instance.sendMessage(context.read<MessageBloc>());
                              }
                          ),
                        ),
                      ),
                    ]
                    )
                  ],
                )
            )
        ),
      ),
    );
  }
}
