import 'package:animate_do/animate_do.dart';
import 'package:ccstudy_app/providers/cambiar_contrasenia.dart';
import 'package:ccstudy_app/widgets/alerts.dart';
import 'package:ccstudy_app/widgets/botones.dart';
import 'package:ccstudy_app/widgets/generales.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../providers/iniciar_sesion_provider.dart';
import '../widgets/formulario.dart';

class CambiarContrasenia extends StatefulWidget {
  CambiarContrasenia({Key? key}) : super(key: key);

  @override
  State<CambiarContrasenia> createState() => _CambiarContraseniaState();
}

class _CambiarContraseniaState extends State<CambiarContrasenia> {
  final TextEditingController _contraseniaController = TextEditingController();
  final TextEditingController _confirmcontraseniaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: colorBG, appBar: appBar(), body: _build());
  }

  _build() {
    return Consumer<CambiarContraseniaProvider>(
      builder: (context, provider, child) {
        // Verifica el estado actual y actualiza la interfaz de usuario en consecuencia
        switch (provider.estado) {
          case CambiarContraseniaState.Initial:
            return _buildInitial();
          case CambiarContraseniaState.Loading:
            return _buildLoadingUI();
          case CambiarContraseniaState.Loaded:
            return _buildLoadedUI(context);
          case CambiarContraseniaState.Empty:
            return _buildEmptyUI();
          case CambiarContraseniaState.Error:
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

  _buildInitial() {
    final loginUsuario = Provider.of<LoginProvider>(context);

    final datosUsuario = loginUsuario.datosUsuario.record!.data;
    final contraseniaProvider =
        Provider.of<CambiarContraseniaProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FadeInUp(
          delay: const Duration(milliseconds: 100),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: const Text(
              'Cambiar contraseña',
              style: TextStyle(
                  color: Color.fromARGB(255, 98, 252, 255),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        FadeInUp(
          delay: const Duration(milliseconds: 120),
          child: const Text(
            'Para cambiar tu contraseña, por favor ingresa una nueva:',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: Form(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                InputFormPass(
                  hintText: 'Contraseña nueva',
                  controlador: _contraseniaController,
                  inputType: TextInputType.text,
                  icono: Icons.key,
                ),
                InputFormPass(
                  hintText: 'Confirmar contraseña nueva',
                  controlador: _confirmcontraseniaController,
                  inputType: TextInputType.text,
                  icono: Icons.key,
                ),
                const SizedBox(
                  height: 30,
                ),
                BotonPrimario(
                    texto: 'Cambiar Contraseña',
                    onPressed: () {
                      contraseniaProvider.cambiarContrasenia(
                          loginUsuario.pb.authStore.token,
                          _contraseniaController.text,
                          _confirmcontraseniaController.text);
                      // mostrarAlertaCargando(
                      //     context,
                      //     'Deberás volver a ingresar con tu nueva contraseña',
                      //     'Cerrando Sesión');
                    })
              ],
            ),
          )),
        )
      ]),
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
    final contraseniaProvider =
        Provider.of<CambiarContraseniaProvider>(context);

    return FadeInUp(
      delay: const Duration(milliseconds: 10),
      child: Container(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: BotonPrimario(
                  texto: 'Aceptar',
                  onPressed: () {
                    contraseniaProvider.reiniciarEstado();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
