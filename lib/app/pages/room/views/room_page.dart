
import 'package:flutter/material.dart';

import 'package:pub/app/pages/user/models/user.dart';
import 'package:pub/app/pages/room/components/message_box_widget.dart';
import 'package:pub/app/pages/room/components/messages_area_widget.dart';
import '../bloc/message_bloc.dart';
import '../models/room.dart';
import '../../../core/components/interceptor_server.dart';
import '../view_models/room_view_model.dart';
import '../components/room_bar_widget.dart';

class RoomPage extends StatefulWidget {

  final Room room;
  final User user;

  RoomPage(this.room, this.user);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  late final RoomViewModel instanceRoom;

  @override
  void initState() {
    instanceRoom = RoomViewModel(room:this.widget.room,user: this.widget.user,bloc: MessageBloc(RoomViewModel.withoutInstance()));
    super.initState();
  }
  @override
  void dispose() {
    instanceRoom.dispose();
    super.dispose();
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
                      MessagesArea(this.instanceRoom, this.widget.room, this.widget.user),
                      MessageBoxWidget(this.instanceRoom, this.widget.room, this.widget.user),
                    ]
                )
            ),
          ),
        )
    );
  }
}
