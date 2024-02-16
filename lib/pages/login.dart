import 'package:ccstudy_app/widgets/botones.dart';
import 'package:ccstudy_app/widgets/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/iniciar_sesion.dart';
import 'crearunacuenta.dart';
import 'home.dart';
import 'olvidosucontrasenia.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginUsuario = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xff271789),
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
                        hintText: 'Usuario',
                        controlador: _usuarioController,
                        obscureText: false),
                    InputForm(
                        hintText: 'Contraseña',
                        controlador: _passwordController,
                        obscureText: true),
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
                          loginUsuario.login(_usuarioController.text,
                              _passwordController.text);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const Home()));
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
