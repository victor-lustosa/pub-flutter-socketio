
import 'package:flutter/material.dart';

import 'package:pub/app/pages/user/models/user.dart';
import 'package:pub/app/pages/room/components/message_box_widget.dart';
import 'package:pub/app/pages/room/components/messages_area_widget.dart';

import 'package:provider/provider.dart';
import 'models/room.dart';
import '../../core/components/interceptor_server.dart';

import 'view_models/room_view_model.dart';
import 'components/room_bar_widget.dart';

class RoomPage extends StatefulWidget {
  final Room room;
  final User user;

  RoomPage(this.room, this.user);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  late final RoomViewModel instance;
  @override
  void initState() {
    super.initState();
    instance = RoomViewModel(this.widget.room, this.widget.user,InterceptorServer());
    final interceptor = context.read<InterceptorServer>();
    interceptor.addListener(() {
      context.read<InterceptorServer>().getResponse;
    });
  }
  @override
  void dispose() {
    super.dispose();
    instance.dispose();
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
                      MessagesArea(instance, this.widget.room, this.widget.user),
                      MessageBoxWidget(instance, this.widget.room, this.widget.user),
                    ]
                )
            ),
          ),
        )
    );
  }


}
