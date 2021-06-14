import 'package:flutter/material.dart';
import 'package:pub/config/app_text_styles.dart';
class HomeUsuarioBarWidget extends PreferredSize {

  HomeUsuarioBarWidget()
      : super(
    preferredSize: Size.fromHeight(400),
    child: Container(
      height: 400,
      width: double.maxFinite,
      child: Stack(
        children: <Widget> [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 400,
              width: double.maxFinite,
              decoration: BoxDecoration(color:  Color(0xFF422600), ),
              child:Column(
                  children: <Widget> [
                    Padding(padding: EdgeInsets.only(top: 80),
                        child: Text("Primeiro acesso", style: AppTextStyles.titleHomeUsuarioBar,)),
                    Padding(padding: EdgeInsets.only(top: 90,right: 60),
                        child:Text("Escolha uma imagem", style: AppTextStyles.subtitleHomeUsuarioBar,)),
                    Padding(padding: EdgeInsets.only(top: 80,right: 40),
                        child: Text("Insira seus dados", style: AppTextStyles.subtitleHomeUsuarioBar,)),

                  ])),
        ],

      ),
    ),
  );
}
