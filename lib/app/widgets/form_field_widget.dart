import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class FormFieldWidget extends StatelessWidget {
  FormFieldWidget(
      {required this.controllerCampoFormulario,
        required this.nome,
        required this.mensagem});

  TextEditingController controllerCampoFormulario;
  int vezes = 0;
  String mensagem;
  String nome;

  String? _validarCampoFormulario(value) {
    if (value == "") {
      return "${mensagem}";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280.0,
        height: 60,
        child: TextFormField(
            onEditingComplete: () {},
            autovalidateMode: AutovalidateMode.always,
            autofocus: false,
            maxLength: nome == "nickname" ? 40 : 2,
            validator: _validarCampoFormulario,
            controller: controllerCampoFormulario,
            keyboardType:
            nome == "idade" ? TextInputType.number : TextInputType.text,
            inputFormatters: nome == "idade"
                ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                : <TextInputFormatter>[],
            decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(vertical: 7, horizontal: 25),
                focusColor: Colors.black12,
                hintText: '${nome}',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),
                                                    bottomRight: Radius.circular(10),
                                                    topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black12)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black12))),
            style: GoogleFonts.inter(fontSize: 14)));
  }
}
