import 'package:flutter/material.dart';
import 'package:pub/config/app_text_styles.dart';
import 'package:pub/models/usuario.dart';
import 'package:pub/pages/usuario/home_usuario.dart';

class HomeApp extends StatelessWidget {

  void avancar(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeUsuario()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child:Container(
            decoration: BoxDecoration(color: Color(0xFF422600)),
            child: Column(
                children: <Widget> [
                  Padding(padding: EdgeInsets.only(top: 200),
                  child:Text("Logo", style: AppTextStyles.titleHomeApp,)),
                  // Padding(padding: EdgeInsets.only(bottom: 40)),
                  // Center ( child: Image.asset(AppImages.logo_infraero, width:250,height:250)),
                  Padding(padding: EdgeInsets.only(top: 200),
                  child: Text("Bem vindo!", style: AppTextStyles.fonte,)),
                  Padding(padding: EdgeInsets.only(top: 285, bottom:35),
                    child: Row(children: <Widget> [
                      ElevatedButton(
                          onPressed: (){
                            avancar(context);
                          },
                          child: Text("Vamos lá", style: AppTextStyles.button),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )),
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            padding:MaterialStateProperty.all( EdgeInsets.symmetric(horizontal: 60)),
                          )),],
                      mainAxisAlignment: MainAxisAlignment.center, ),
                  )]
            ),
          ),
        ));
  }
}