import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownWidget extends StatefulWidget{

  DropdownWidget(this.list, this.callback,this.name);
  final Function(String) callback;
  final List<String> list;
  final String name;
  _DropdownWidgetState createState() => _DropdownWidgetState();
}
class _DropdownWidgetState extends State<DropdownWidget> {
  String _listSelected = '';
  bool isSelected =  false;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      elevation: 16,
      underline:SizedBox() ,iconSize: 32,iconEnabledColor: Colors.white,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)),
      items: this.widget.list.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem<String>(

            value: val,
            child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 22),
                child:  SizedBox(width: 294,height: 44,
                  child: Text(
                      val,
                      style:GoogleFonts.inter( fontSize: 15, color: Colors.black54)
                  ),
                )

            )
        );
      }
      ).toList(),
      hint: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(top:5,left: 25),
                child:Text("${this.widget.name}")),

          ]
      ),
      style:GoogleFonts.inter(fontSize: 15),
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
