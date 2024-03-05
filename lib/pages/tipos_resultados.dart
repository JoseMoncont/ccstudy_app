import 'package:animate_do/animate_do.dart';
import 'package:ccstudy_app/widgets/botones.dart';
import 'package:ccstudy_app/widgets/generales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../providers/usuario_provider.dart';

class Updatedata extends StatelessWidget {
  const Updatedata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(), backgroundColor: colorBG, body: _build());
  }

  _build() {
    return Consumer<UsuarioProvider>(
      builder: (context, loginProvider, child) {
        // Verifica el estado actual y actualiza la interfaz de usuario en consecuencia
        switch (loginProvider.estado) {
          case UsuarioState.Loading:
            return _buildLoadingUI();
          case UsuarioState.Loaded:
            return _buildLoadedUI(context);
          case UsuarioState.Empty:
            return _buildEmptyUI();
          case UsuarioState.Error:
            return _buildErrorUI(loginProvider.errorMensaje);
          default:
            return Container(); // Maneja cualquier otro caso según tus necesidades
        }
      },
    );
  }

  _buildLoadingUI() {
    return Container(
      color: colorBG,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }

  _buildLoadedUI(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final docEco = usuarioProvider.urlDocEcodopler;
    final docEspiro = usuarioProvider.urlDocEspirometria;
    final docQS = usuarioProvider.urlDocQuimSang;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInUp(
          delay: const Duration(milliseconds: 100),
          child: const Padding(
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
        ),
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Text(
              'Seleccione el tipo de resultado que desea conocer:',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        FadeInUp(
          delay: const Duration(milliseconds: 300),
          child: GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: [
              BotonResultado(
                titulo: 'Quimica Sanguínea',
                icono: SvgPicture.asset(
                  'assets/images/vial-solid.svg',
                  width: 30,
                ),
                alPresionar: () {
                  Navigator.pushNamed(context, 'verPdf', arguments: docQS);
                },
              ),
              BotonResultado(
                titulo: 'Espirometría',
                icono: SvgPicture.asset(
                  'assets/images/lung.svg',
                  width: 40,
                ),
                alPresionar: () {
                  Navigator.pushNamed(context, 'verPdf', arguments: docEspiro);
                },
              ),
              BotonResultado(
                titulo: 'Eco Doppler Carotídeo',
                icono: SvgPicture.asset(
                  'assets/images/vein.svg',
                  width: 40,
                ),
                alPresionar: () {
                  Navigator.pushNamed(context, 'verPdf', arguments: docEco);
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  _buildErrorUI(String errorMensaje) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/error.json', width: 120),
          Text(
            errorMensaje,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  _buildEmptyUI() {
    return Text('Empty');
  }
}
