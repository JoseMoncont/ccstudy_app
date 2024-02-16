import 'package:ccstudy_app/widgets/botones.dart';
import 'package:ccstudy_app/widgets/generales.dart';
import 'package:flutter/material.dart';

class Resultados extends StatelessWidget {
  const Resultados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          BotonPrimario(texto: 'Descargar Resultados', onPressed: () {})
        ],
      ),
    );
  }
}
