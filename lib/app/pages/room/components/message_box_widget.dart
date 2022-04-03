import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/pages/user/models/user.dart';
import 'package:pub/app/pages/room/view_models/room_view_model.dart';
import '../bloc/message_bloc.dart';
import '../models/room.dart';
import '../../../core/configs/app_colors.dart';

class MessageBoxWidget extends StatefulWidget {
  final Room room;
  final User user;
  final RoomViewModel instance;

  MessageBoxWidget(this.instance, this.room, this.user);

  @override
  _MessageBoxWidgetState createState() => _MessageBoxWidgetState();
}

class _MessageBoxWidgetState extends State<MessageBoxWidget> {

  // String _enteredText = '';

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

    return Row(
      children: [
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
              focusNode: widget.instance.focusNode,
              onSubmitted: (_) {
                widget.instance.sendMessage();

              },
              controller: widget.instance.textController,
              autofocus: true,
              keyboardType: TextInputType.multiline,
              maxLines: widget.instance.lineNumbers,
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
                widget.instance.sendMessage();
              },
            ),
          ),
        )
      ],
    );
  }
}
