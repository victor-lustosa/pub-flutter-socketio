import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownWidget extends StatefulWidget{

  DropdownWidget({required this.lista, required this.callback, required this.nome});
  final Function(String) callback;
  List<String> lista;
  String nome;
  _DropdownWidgetState createState() => _DropdownWidgetState();
}
  class _DropdownWidgetState extends State<DropdownWidget> {
    String _selectedLista = '';
    bool selected =  false;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: this.widget.lista.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem<String>(
            value: val,
            child:Container(
                width:257,
                child: Padding(padding: EdgeInsets.only(),
                    child:Text(
                        val,
                        style:GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black54)
                    )
                )
            )
        );
      }
      ).toList(),
      hint: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 12),
                child:Text("${this.widget.nome}")),
          ]
      ),
      style:GoogleFonts.inter(fontSize: 14),
      onChanged: (newValue) {
        _dropDownItemSelected(newValue!);
        this.setState(() {
          print(newValue.toString());
          this._selectedLista = newValue;
        }
        );
      },
      value:selected ? _selectedLista : null,
    );
  }

  void _dropDownItemSelected(String novoItem){
    setState(() {
      this._selectedLista = novoItem;
      this.selected = true;
      this.widget.callback(this._selectedLista);
    });
  }
}
