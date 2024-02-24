import 'package:ccstudy_app/pages/home.dart';
import 'package:ccstudy_app/widgets/alerts.dart';
import 'package:ccstudy_app/widgets/botones.dart';
import 'package:ccstudy_app/widgets/formulario.dart';
import 'package:ccstudy_app/widgets/generales.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/iniciar_sesion_provider.dart';
import 'crearunacuenta.dart';
import 'olvidosucontrasenia.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginUsuario = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: colorBG,
      body: Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/logo.png',
            width: MediaQuery.of(context).size.width / 2,
          ),
          Form(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    InputForm(
                      hintText: 'Cedula',
                      controlador: _usuarioController,
                      obscureText: false,
                      inputType: TextInputType.number,
                      icono: Icons.person,
                    ),
                    InputForm(
                      hintText: 'Contraseña',
                      controlador: _passwordController,
                      obscureText: true,
                      inputType: TextInputType.text,
                      icono: Icons.key,
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.symmetric(
                          horizontal: 14.0, vertical: 01.0),
                      alignment: Alignment.topLeft,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OlvidoSuContrasena()));
                          },
                          child: const Text(
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  color: Colors.white),
                              "¿Olvidó su contraseña?")),
                    ),
                    BotonPrimario(
                        texto: 'Iniciar Sesión',
                        onPressed: () {
                          if (_usuarioController.text.isEmpty ||
                              _passwordController.text.isEmpty) {
                            mostrarAlertDialog(context, 'Ups!',
                                'Necesitas ingresar los datos para iniciar sesión');
                            null;
                          } else {
                            loginUsuario.login(_usuarioController.text,
                                _passwordController.text);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          }
                        }),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CrearUnaCuenta()));
                  },
                  child: const Text(
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          color: Colors.white),
                      "Crear una cuenta"))
            ],
          ))
        ]),
      ),
    );
  }
}
