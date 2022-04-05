import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pub/app/pages/room/views/components/messages_area_widget.dart';
import 'package:pub/app/pages/user/models/user.dart';
import '../../../core/configs/app_colors.dart';
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
  late final RoomViewModel instance;

  @override
  void initState() {
    instance = RoomViewModel(room:this.widget.room,user: this.widget.user);
    super.initState();
  }
  @override
  void dispose() {
    instance.dispose();
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
                    MessagesAreaWidget(instance, this.widget.room, this.widget.user),
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
