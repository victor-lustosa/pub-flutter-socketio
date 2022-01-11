import 'package:flutter/material.dart';
import 'package:pub/config/app_colors.dart';
import 'package:pub/config/app_text_styles.dart';
import 'package:pub/models/usuario_model.dart';
import 'package:pub/pages/usuario_page.dart';

class HomeApp extends StatelessWidget {

  void avancar(BuildContext context){
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => HomeUsuario()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration( color: AppColors.marromEscuro),
                child: Column(
                    children: <Widget> [
                      Padding(
                          padding: EdgeInsets.only(top: 150),
                          child: Text("Logo", style: AppTextStyles.titleHomeApp,)),
                      Padding(
                          padding: EdgeInsets.only(top: 200),
                          child: Text("Bem vindo!", style: AppTextStyles.fonte,)),
                      Padding(
                        padding: EdgeInsets.only(top: 285),
                        child: Row(
                          children: <Widget> [
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
                                ))],
                          mainAxisAlignment: MainAxisAlignment.center, ),
                      )]))));
  }
}