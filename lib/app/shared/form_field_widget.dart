import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class FormFieldWidget extends StatelessWidget {
  FormFieldWidget(
      {required this.formFieldController,
        required this.name,
        required this.message});

  TextEditingController formFieldController;
  int times = 0;
  String message;
  String name;

  String? _validateFormField(value) {
    if (value == "") {
      return "${message}";
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
            maxLength: name == "nickname" ? 40 : 2,
            validator: _validateFormField,
            controller: formFieldController,
            keyboardType:
            name == "idade" ? TextInputType.number : TextInputType.text,
            inputFormatters: name == "idade"
                ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                : <TextInputFormatter>[],
            decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(vertical: 7, horizontal: 25),
                focusColor: Colors.black12,
                hintText: '${name}',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                    ),
                    borderSide: BorderSide(color: Colors.black12)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                    ),
                    borderSide: BorderSide(color: Colors.black12)
                )
            ),
            style: GoogleFonts.inter(fontSize: 14)
        )
    );
  }
}
