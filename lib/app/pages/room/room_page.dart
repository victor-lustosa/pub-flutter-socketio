import 'package:flutter/material.dart';
import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/models/user.dart';
import 'package:pub/app/shared/components/message_box_widget.dart';
import 'package:pub/app/shared/config/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomPage extends StatefulWidget {
  Establishment establishment;
  User user;

  RoomPage(this.establishment, this.user);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
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
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  widget.establishment.getName,
                  style:
                      GoogleFonts.inter(fontSize: 17, color: AppColors.brown),
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
          child: MessageBoxWidget(this.widget.establishment, this.widget.user),
        )
       ),
      ),
    );
  }
}
