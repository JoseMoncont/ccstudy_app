import 'package:ccstudy_app/pages/tipos_resultados.dart';
import 'package:ccstudy_app/widgets/botones.dart';
import 'package:ccstudy_app/widgets/generales.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: const Color(0xff271789),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 25.0),
          alignment: Alignment.bottomLeft,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bienvenido",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
              ),
              Text(
                "Braizon",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              //height: 200,
              margin:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 25.0),
              child: Lottie.asset('assets/animations/tomademuestra.json'),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 25.0),
              child: const Text(
                "En los siguientes resultados podrá encontar información detallada acerca de su estado de salud",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 13.0, horizontal: 25.0),
                child: BotonPrimario(
                    texto: 'Consultar resultados',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Updatedata()));
                    }))
          ],
        ),
        SizedBox(
          height: 30,
        )
      ]),
    );
  }
}
