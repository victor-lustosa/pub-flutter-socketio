import 'package:flutter/material.dart';
import 'package:pub/config/app_colors.dart';
import 'package:pub/config/app_text_styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/models/estabelecimento_model.dart';
import 'package:pub/models/mensagem_model.dart';
import 'package:pub/models/usuario_model.dart';
import 'package:pub/view_models/sala_view_model.dart';
class CaixaMensagemWidget extends StatelessWidget{
  Estabelecimento estabelecimento;
  Usuario usuario;

  CaixaMensagemWidget({required this.estabelecimento, required this.usuario });

  TextEditingController _controllerMensagem = TextEditingController();
  SalaViewModel _salaViewModel = SalaViewModel();

  @override
  Widget build(BuildContext context) {
   return Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: TextField(
                    controller:_controllerMensagem,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                        hintText: "Digite uma mensagem...",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))
                    ),
                  ),
                ),
              ),
              FloatingActionButton(
                backgroundColor: AppColors.marrom,
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                mini: true,
                onPressed: _salaViewModel.enviarMensagem(this.estabelecimento,
                    _controllerMensagem.text,
                    Mensagem(),
                    this.usuario),
              )
            ],
          ),
        );

  }
}
