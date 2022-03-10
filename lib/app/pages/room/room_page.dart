import 'package:flutter/material.dart';

import 'package:pub/app/models/user.dart';
import 'package:pub/app/pages/room/components/message_box_widget.dart';
import 'package:pub/app/shared/config/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/room.dart';

class RoomPage extends StatefulWidget {
 final Room room;
 final User user;

  RoomPage(this.room, this.user);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {

@override
  void initState() {

    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            // CircleAvatar(
            //     maxRadius: 20,
            //     backgroundColor: Colors.grey,
            //     backgroundImage: widget.contato.urlImagem != null
            //         ? NetworkImage(widget.contato.urlImagem)
            //         : null),
            Padding(
                padding: EdgeInsets.only(top: 0, right: 0),
                child: IconButton(
                    iconSize: 30,
                    icon: Icon(
                      Icons.navigate_before_rounded,
                      color: AppColors.darkBrown,
                    ),
                    color: AppColors.darkBrown,
                    onPressed: () {
                      Navigator.pop(context);
                    }
                )
            ),
            Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(

                  widget.room.getRoomName,
                  style:
                      GoogleFonts.inter(fontSize: 17, color: AppColors.darkBrown),
                )
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage("imagens/bg.png"), fit: BoxFit.cover)),
        child: SafeArea(
            child: Container(
          padding: EdgeInsets.all(8),
          child: MessageBoxWidget(this.widget.room, this.widget.user),
        )
       ),
      ),
    );
  }
}
