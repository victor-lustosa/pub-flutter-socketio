import 'package:flutter/material.dart';
import 'package:pub/app/core/configs/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/participant.dart';


class ParticipantBarWidget  extends  StatefulWidget {
  ParticipantBarWidget(this.participant);
  final Participant participant;
  @override
  State<ParticipantBarWidget> createState() => _ParticipantBarWidgetState();
}

class _ParticipantBarWidgetState extends State<ParticipantBarWidget> {
  @override
  Widget build(BuildContext context) {
    return  Row(
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
                widget.participant.getNickname,
                style:
                GoogleFonts.inter(fontSize: 17, color: AppColors.darkBrown),
              )
          )
        ],
      );
  }
}
