import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/models/user.dart';
import 'package:pub/app/view_models/room_view_model.dart';

import '../../../models/message.dart';
import '../../../models/room.dart';
import '../../../shared/config/app_colors.dart';

class MessageBoxWidget extends StatefulWidget {
  Room room;
  User user;

  MessageBoxWidget(this.room, this.user);

  @override
  _MessageBoxWidgetState createState() => _MessageBoxWidgetState();
}

class _MessageBoxWidgetState extends State<MessageBoxWidget> {

  late final RoomViewModel instance;
  String _enteredText = '';


  @override
  initState() {
    super.initState();
    instance = RoomViewModel(widget.room,widget.user);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    instance.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: StreamBuilder<Room>(
                stream: instance.getResponse,
                builder: (context,AsyncSnapshot<Room> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(color:AppColors.brown),
                      );
                      break;
                    case ConnectionState.active:

                    case ConnectionState.done:
                      instance.getData(snapshot);
                      return ListView.builder(
                          controller: instance.scrollController,
                          itemCount: instance.getMessagesList.length,
                          itemBuilder: (_,index){
                            if (snapshot.data!.getType == 'enter_room') {
                              return ListTile(title: Text('${instance.room.getUserNickName} entrou na sala'));
                            }
                            // else if(snapshot.data!.getType == 'leave_room'){
                            //   return ListTile(title: Text('${userAux.getNickname} saiu da sala'));
                            // }
                            return Align(
                              alignment: instance.getMessagesList[index].getUser != widget.user.getNickname ?
                              Alignment.centerLeft : Alignment.centerRight ,
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                      color: instance.getMessagesList[index].getUser != widget.user.getNickname ?
                                      Colors.white : Color(0xffdcd9d9),
                                      borderRadius: BorderRadius.all(Radius.circular(8))),
                                  child:AnimatedBuilder(
                                      animation: instance,
                                      builder: (context,child) {
                                        return Text('${instance.getMessagesList[index].getUser} - ${instance.getMessagesList[index].getTextMessage}',
                                            style: GoogleFonts.inter(fontSize: 14));
                                      }
                                  ),
                                ),
                              ),
                            );
                          }
                      );
                  }
                }
            )
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 4,right: 8),
                child: TextField(
                  onEditingComplete: () {},
                  onChanged: (String value) {
                    setState(() {
                      _enteredText = value;
                    });
                  },
                  focusNode: instance.focusNode,
                  onSubmitted: (_) => instance.sendMessage(),
                  controller: instance.textController,
                  autofocus: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: instance.sizeBoxMessage(_enteredText) ,
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
                  onPressed: (){
                    instance.sendMessage();
                  },
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
