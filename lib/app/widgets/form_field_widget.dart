import 'package:flutter/material.dart';
import 'package:pub/app/config/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FormFieldWidget extends StatelessWidget{

  FormFieldWidget({required this.controllerCampoFormulario, required this.nome, required this.mensagem});

  TextEditingController controllerCampoFormulario;

  String mensagem;
  String nome;
  String? _validarCampoFormulario(value) {
    if (value.length == 0) {
      return "${mensagem}";
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280.0,
        height: 60,
        child:TextFormField(
            autovalidateMode: AutovalidateMode.always,
            autofocus: true,
            maxLength: 40,
            validator : _validarCampoFormulario,
            controller: controllerCampoFormulario,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: '${nome}',
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.marromEscuro)
                )
            ),
            style: GoogleFonts.inter(fontSize: 14)

    ))
    ;
  }
}
