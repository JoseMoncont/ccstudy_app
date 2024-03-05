import 'package:animate_do/animate_do.dart';
import 'package:ccstudy_app/widgets/generales.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OlvidoSuContrasena extends StatelessWidget {
  const OlvidoSuContrasena({super.key});

  @override
  Widget build(BuildContext context) {
    // final TextEditingController _correoController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff040346),
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInUp(
            delay: const Duration(milliseconds: 100),
            child: Container(
              width: MediaQuery.of(context).size.width,
              //height: 200,
              margin:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 25.0),
              child: Lottie.asset('assets/animations/forgot.json',
                  height: MediaQuery.of(context).size.height / 4),
            ),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text:
                                'Para recuperar tu contraseña, por favor contacta a ',
                            style: TextStyle(color: Colors.white)),
                        TextSpan(
                          text: 'cares.resultados@innovatid.org',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 119, 230,
                                255), // Color azul para el enlace
                          ),
                        ),
                        TextSpan(
                          text:
                              ', quienes te asignarán un acceso temporal para que luego puedas asignar una nueva contraseña.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  // InputForm(
                  //     hintText: 'Correo electrónico',
                  //     controlador: _correoController,
                  //     obscureText: false,
                  //     inputType: TextInputType.emailAddress,
                  //     icono: Icons.mail),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
