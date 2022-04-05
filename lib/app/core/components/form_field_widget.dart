import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class FormFieldWidget extends StatelessWidget {
  FormFieldWidget(this.formFieldController, this.name);

  final TextEditingController formFieldController;
  final String name;

  String? validateAgeFormField(value) {
    int valor = 0;
    if(value != '')
      valor = int.tryParse(value)!;

    if (value == "") {
      return "digite sua idade";
    } else if( valor < 18){
      return "Precisa ser maior de 18 anos";
    }
    return null;
  }

  String? valideNickNameFormField(value) {
    if (value == "") {
      return "digite seu nickname";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350.0,
        height: 100,
        child: TextFormField(
            onEditingComplete: () {},
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autofocus: false,
            maxLength: name == "nickname" ? 40 : 2,
            validator: name == "idade" ? validateAgeFormField : valideNickNameFormField ,
            controller: formFieldController,
            keyboardType: name == "idade" ? TextInputType.number : TextInputType.text,
            inputFormatters: name == "idade"
                ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                : <TextInputFormatter>[],
            decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                focusColor: Colors.black12,
                hintText: '$name',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black12)
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black12)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black12)
                )
            ),
            style: GoogleFonts.inter(fontSize: 15)
        )
    );
  }
}
