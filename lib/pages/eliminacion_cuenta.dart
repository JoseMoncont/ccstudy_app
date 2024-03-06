import 'package:ccstudy_app/providers/eliminar_usuario.dart';
import 'package:ccstudy_app/widgets/botones.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../widgets/generales.dart';

class EliminarCuentaPage extends StatelessWidget {
  const EliminarCuentaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBG,
      body: _build(),
    );
  }

  _build() {
    return Consumer<EliminarUsuarioProvider>(
      builder: (context, provider, child) {
        // Verifica el estado actual y actualiza la interfaz de usuario en consecuencia
        switch (provider.estado) {
          case EliminarUsuarioState.Loading:
            return _buildLoadingUI();
          case EliminarUsuarioState.Loaded:
            return _buildLoadedUI(context);
          case EliminarUsuarioState.Empty:
            return _buildEmptyUI();
          case EliminarUsuarioState.Error:
            return _buildErrorUI(provider.errorMensaje);
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset('assets/animations/success.json',
            width: 120, repeat: false),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Usuario eliminado satisfactoriamente',
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 40),
          width: MediaQuery.of(context).size.width / 2,
          child: BotonPrimario(
              texto: 'Aceptar',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'login', (route) => false);
              }),
        )
      ],
    );
  }

  _buildEmptyUI() {
    return Text('Empty');
  }

  _buildErrorUI(errorMensaje) {
    return Scaffold(
      backgroundColor: colorBG,
      body: Container(
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
      ),
    );
  }
}
