import 'package:flutter/material.dart';
import 'package:pub/config/app_text_styles.dart';
import 'package:pub/widget/app_bar/home_usuario_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeUsuario extends StatefulWidget  {
  HomeUsuario({Key? key}) : super(key: key);
  _HomeUsuarioState createState() => _HomeUsuarioState();
}

class _HomeUsuarioState extends State<HomeUsuario> {
  List<String> _locations = ['Masculino', 'Feminino',"Não informado"];
  String _selectedLocation = '';

  //instancias das classes
  // Infraero infra = new Infraero();
  // GestorCompanhias gestComp = new GestorCompanhias();
  // Aeroporto aeroporto = new Aeroporto();
  // Voo voo = new Voo();
  // String valorEstado ='';
  // String valorCidade ='';
  void carregaDados(){

    // if( infra.getAeroportosPorCidadeEstado.isEmpty == true){
    //   infra.getAeroportoPorCidadeEEstado("Palmas","Tocantins");
    //   infra.estadoInfra = 'Tocantins';
    //   infra.cidadeInfra = 'Palmas';
    // }
  }

  void avancar(BuildContext context){
    // Navigator.push(context, MaterialPageRoute(builder: (context) => ListaAeroportos(aeroporto: infra.vetAeroportosCidadeEstado)));
  }
  @override
  Widget build (BuildContext context) {
    // if(infra.getAeroportos.isEmpty == true){
    //   carregaDados();
    // }

    return Material(
        child:SingleChildScrollView(
            child:Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(color:  Color(0xFF422600)),
                child: Column(
                    children: [
                      HomeUsuarioBarWidget(),
                      Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight:Radius.circular(15),topLeft:Radius.circular(15))),
                          child: Stack(
                            children: <Widget> [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                height: 600,
                                width: double.maxFinite,
                                child:Column(
                                  children: <Widget> [
                                    Padding(
                                      padding: EdgeInsets.only(top: 40,left:0),
                                      child:  Container(
                                          width: 280.0,
                                          height: 60,
                                          child:TextField(
                                            decoration: InputDecoration(
                                                hintText: 'Nickname'),style:GoogleFonts.quantico(fontSize: 17) ,
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 25,left:0),
                                      child:  Container(
                                        width: 280.0,
                                        height: 60,
                                        child:TextField(
                                          style:GoogleFonts.quantico(fontSize: 17),
                                          decoration: InputDecoration(
                                              hintText: 'Idade'),
                                        ),
                                      ),),
                                    Padding(
                                        padding: EdgeInsets.only(top: 40,left:0),
                                        child: DropdownButton<String>(
                                            items: _locations.map((String val) {
                                              return DropdownMenuItem<String>(
                                                  value: val,
                                                  child:Container(
                                                    width:261,child: Padding(padding: EdgeInsets.only(),
                                                    child:Text(val,style:GoogleFonts.quantico(fontSize: 15,color: Colors.black54)),),
                                                  ));
                                            }).toList(),
                                            hint: Row(
                                                children: [

                                                  Padding(padding: EdgeInsets.only(),child:Text("Gênero")),
                                                ]),
                                            style:GoogleFonts.quantico(fontSize: 16),
                                            onChanged: (newValue) {
                                              _selectedLocation = newValue!.toString();
                                              this.setState(() {});
                                            })),
                                    Padding(padding: EdgeInsets.only(top: 50),
                                      child:
                                      Row(children: <Widget> [
                                        Padding(padding: EdgeInsets.only(bottom: 40),child: ElevatedButton(
                                            onPressed: null,
                                            child: Text("Avançar",style:GoogleFonts.quantico(fontSize: 15,color: Colors.white)),
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(Color(0xFFB87333)),
                                              padding:MaterialStateProperty.all( EdgeInsets.symmetric(horizontal: 50)),
                                            ))),],
                                        mainAxisAlignment: MainAxisAlignment.center, ),),

                                  ],
                                ),
                              ),
                            ],
                          )
                      )]))));

  }
}