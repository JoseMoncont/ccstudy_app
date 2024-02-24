import 'package:ccstudy_app/widgets/botones.dart';
import 'package:ccstudy_app/widgets/generales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Updatedata extends StatelessWidget {
  const Updatedata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: colorBG,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Resultados',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Text(
              'Seleccione el tipo de resultado que desea conocer:',
              style: TextStyle(color: Colors.white),
            ),
          ),

          GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: [
              BotonResultado(
                titulo: 'Quimica Sanguínea',
                icono: SvgPicture.asset(
                  'assets/images/vial-solid.svg',
                  width: 30,
                ),
                alPresionar: () {},
              ),
              BotonResultado(
                titulo: 'Espirometría',
                icono: SvgPicture.asset(
                  'assets/images/lung.svg',
                  width: 40,
                ),
                alPresionar: () {},
              ),
              BotonResultado(
                titulo: 'Eco Doppler Carotídeo',
                icono: SvgPicture.asset(
                  'assets/images/vein.svg',
                  width: 40,
                ),
                alPresionar: () {},
              )
            ],
          ),

          // Container(
          //   color: Colors.white60,
          //   width: MediaQuery.of(context).size.width,
          //   height: 400.0,
          // ),
          // BotonPrimario(
          //   onPressed: () {},
          //   texto: 'Descargar resultados',
          // ),
        ],
      ),
    );
  }
}
