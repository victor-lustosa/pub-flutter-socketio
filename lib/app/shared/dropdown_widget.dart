import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownWidget extends StatefulWidget{

  DropdownWidget({required this.list, required this.callback, required this.name});
  final Function(String) callback;
  List<String> list;
  String name;
  _DropdownWidgetState createState() => _DropdownWidgetState();
}
  class _DropdownWidgetState extends State<DropdownWidget> {
    String _listSelected = '';
    bool isSelected =  false;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      underline:SizedBox() ,
      items: this.widget.list.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem<String>(
            value: val,
            child:Container(
                 width: 243,
                child: Padding(padding: EdgeInsets.only(bottom: 3, left: 22),
                    child:Text(
                        val,
                        style:GoogleFonts.inter( fontSize: 14, color: Colors.black54)
                    )
                )
            )
        );
      }
      ).toList(),
      hint: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 3, left: 22),
                child:Text("${this.widget.name}")),
          ]
      ),
      style:GoogleFonts.inter(fontSize: 14),
      onChanged: (newValue) {
        _dropDownItemSelected(newValue!);
        this.setState(() {
          print(newValue.toString());
          this._listSelected = newValue;
        }
        );
      },
      value:isSelected ? _listSelected : null,
    );
  }

  void _dropDownItemSelected(String novoItem){
    setState(() {
      this._listSelected = novoItem;
      this.isSelected = true;
      this.widget.callback(this._listSelected);
    });
  }
}
