import 'package:flutter/material.dart';
import 'package:pub/config/app_text_styles.dart';
class HomeEstabelecimentosBarWidget extends PreferredSize {

  HomeEstabelecimentosBarWidget(String nome)
      : super(
    preferredSize: Size.fromHeight(200),
      child:Container(
      height: 120,
      width: double.maxFinite,
      child: Stack(
        children: <Widget> [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 120,
              width: double.maxFinite,
              decoration: BoxDecoration(color:  Color(0xFF422600), ),
              child:Column(
                  children: <Widget> [
                    Padding(padding: EdgeInsets.only(right: 240,top: 40),
                        child: Text("PUB", style: AppTextStyles.titleHomeEstabelecimentoBar,)),
                    Padding(padding: EdgeInsets.only(right: 240,),
                        child: Text(nome, style: AppTextStyles.titleUsuarioEstabelecimento,)),
                  ])),

        ],)

      ),
    );
}
