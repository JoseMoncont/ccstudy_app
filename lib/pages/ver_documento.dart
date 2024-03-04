import 'package:ccstudy_app/widgets/generales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:lottie/lottie.dart';

class VerDocumento extends StatefulWidget {
  VerDocumento({Key? key}) : super(key: key);

  @override
  State<VerDocumento> createState() => _VerDocumentoState();
}

class _VerDocumentoState extends State<VerDocumento> {
  @override
  Widget build(BuildContext context) {
    final urlPdf = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: colorBG,
      appBar: appBar(),
      body: Container(
        child: const PDF().fromUrl(urlPdf,
            placeholder: (double progress) => Center(
                    child: Text(
                  'Cargando $progress %',
                  style: const TextStyle(color: Colors.white),
                )),
            errorWidget: (dynamic error) => Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      margin: const EdgeInsets.symmetric(
                          vertical: 13.0, horizontal: 25.0),
                      child: Lottie.asset('assets/animations/no-data.json',
                          height: MediaQuery.of(context).size.height / 3),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Aún no tienes documentos disponibles para este tipo de resultado.',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }

  _build() {}
}
