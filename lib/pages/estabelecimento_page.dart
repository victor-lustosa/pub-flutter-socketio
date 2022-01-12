import 'package:pub/config/app_colors.dart';
import 'package:pub/config/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pub/models/usuario_model.dart';
import 'package:pub/pages/sala_page.dart';
import 'package:pub/services/estabelecimento_service.dart';
import 'package:pub/view_models/estabelecimento_view_model.dart';
import '../widgets/bar_widgets/estabelecimento_bar_widget.dart';

class EstabelecimentoPage extends StatefulWidget {
  Usuario usuario;
  String latitude;
  String longitude;

  EstabelecimentoPage({required this.usuario, required this.latitude, required this.longitude });
  @override
  _EstabelecimentoPageState createState() => _EstabelecimentoPageState();

}

class _EstabelecimentoPageState extends State<EstabelecimentoPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  EstabelecimentoViewModel estabelecimentoViewModel = EstabelecimentoViewModel();
  late List<dynamic> estabelecimentos;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2,
        vsync: this
    );
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
        appBar: HomeEstabelecimentosBarWidget(
            this.widget.usuario.getNickname,
            this._tabController
        ),
        body: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.white
                ),
                child: Column(
                    children: [
                      SizedBox(
                          child: FutureBuilder<List<dynamic>>(
                              future: estabelecimentoViewModel.listaEstabelecimentos(
                                  EstabelecimentoService(),'-10.257615194551102','-48.325213882543736'),
                              initialData: [],
                              builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
                                switch(snapshot.connectionState) {
                                  case ConnectionState.none:
                                    break;
                                  case ConnectionState.waiting:
                                    return Padding(
                                        padding: EdgeInsets.only(top: 30),
                                        child: Container(
                                            child: Center(
                                                child: CircularProgressIndicator(
                                                    valueColor: new AlwaysStoppedAnimation<Color>(
                                                        AppColors.marromEscuro)
                                                )
                                            )
                                        )
                                    );
                                  case ConnectionState.active:
                                    break;
                                  case ConnectionState.done:
                                    if (!snapshot.hasData) {
                                      return Padding(
                                          padding: EdgeInsets.only(top: 30),
                                          child: Container(
                                              child: Center(
                                                  child: CircularProgressIndicator(
                                                      valueColor: new AlwaysStoppedAnimation<Color>(
                                                          AppColors.marromEscuro)
                                                  )
                                              )
                                          )
                                      );
                                    }
                                    estabelecimentos = snapshot.data!;
                                    return   ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.length ,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                              leading: Padding(
                                                  padding: EdgeInsets.only(left: 25) ,
                                                  child: Icon(
                                                      Icons.location_on,size: 29,
                                                      color: AppColors.corIconeEstabelecimento)
                                              ),
                                              title: Padding(
                                                  padding: EdgeInsets.only(left: 5,) ,
                                                  child: Text(
                                                      estabelecimentos[index].getNome,
                                                      style: AppTextStyles.fonteLista)
                                              ),
                                              onTap: () {

                                                Navigator.push( context,
                                                    MaterialPageRoute( builder:
                                                        (context) => SalaPage(
                                                        estabelecimento: estabelecimentos[index],
                                                        usuario: this.widget.usuario)
                                                    )
                                                );
                                              }
                                          );
                                        }
                                    );
                                }
                                return Text('Unkown error');
                              }
                          )
                      )
                    ]
                )
            )
        ),
        floatingActionButton: SizedBox(
            height: 32,
            width: 136,
            child: FloatingActionButton.extended(
                onPressed: () {},
                label: Text("Visão em mapa",
                    style:GoogleFonts.inter(
                        fontSize: 10.5,color: Colors.white)
                ),
                backgroundColor: AppColors.marromClaro,
                icon: Icon(
                    Icons.map,size: 15,
                    color: Colors.white)
            )
        )
    );
  }
}