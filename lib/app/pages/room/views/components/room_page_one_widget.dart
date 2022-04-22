import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pub/app/pages/room/view_models/room_view_model.dart';
import 'package:pub/app/pages/user/models/user.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/configs/app_colors.dart';
import '../../../../core/room_bloc/room_bloc.dart';
import '../../models/room.dart';

class RoomPageOneWidget extends StatefulWidget {
  RoomPageOneWidget(this.instance, this.room, this.user, this.bloc);
  final RoomBloc bloc;
  final Room room;
  final User user;
  final RoomViewModel instance;

  @override
  State<RoomPageOneWidget> createState() => _RoomPageOneWidgetState();
}

class _RoomPageOneWidgetState extends State<RoomPageOneWidget> {
  // late final StreamSubscription sub;

  @override
  initState() {
    widget.bloc.add(InitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    widget.bloc.add(DisconnectEvent());
    // sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.white),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Column(
            children: <Widget>[
              BlocBuilder<RoomBloc,RoomState>(
                  bloc: widget.bloc,
                  builder:(context, state){
                    if(state is InitialState) {
                      return Expanded( child: Container());
                    } else if(state is ReceiveMessageState ||
                              state is ReceiveBroadEnterPublicRoomMessageState ||
                              state is SendMessageState ||
                              state is ReceiveUserEnterPublicRoomMessageState ||
                              state is ReceiveLeavePublicRoomMessageState) {
                      return Expanded(
                        child: ListView.builder(
                            controller: this.widget.instance.scrollController,
                            itemCount:widget.instance.getRoom.getMessagesList.length,
                            itemBuilder: (context, index) {
                              return Align(
                                  alignment: widget.instance.alignment(index),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.8,
                                      padding: const EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                          color: widget.instance.color(index),
                                          borderRadius: BorderRadius.all(Radius.circular(8))),
                                           child: widget.instance.typeMessage(state, index)

                                      ),
                                    ),
                                  );
                            }
                        ),
                      );
                    }else {
                      return Text('erroo');
                    }
                  }
              ),
              SafeArea(top: false,child:
              Row(children: [
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
                      focusNode: this.widget.instance.focusNode,
                      onSubmitted: (_) {
                        this.widget.instance.sendMessage(widget.bloc);
                      },
                      controller: this.widget.instance.textController,
                      autofocus: true,
                      keyboardType: TextInputType.multiline,
                      maxLines: this.widget.instance.lineNumbers,
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
                          this.widget.instance.sendMessage(widget.bloc);
                        }
                    ),
                  ),
                ),
              ]
              )
              )
            ]
        ));
  }
}
