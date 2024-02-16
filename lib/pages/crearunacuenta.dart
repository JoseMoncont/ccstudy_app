import 'package:ccstudy_app/pages/respuesta_crearcuenta.dart';
import 'package:ccstudy_app/widgets/botones.dart';
import 'package:ccstudy_app/widgets/formulario.dart';
import 'package:ccstudy_app/widgets/generales.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/crear_usuario_provider.dart';

class CrearUnaCuenta extends StatelessWidget {
  CrearUnaCuenta({super.key});

  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();
  final TextEditingController _confirmcontraseniaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final gestionUsuario =
        Provider.of<GestionUsuarioProvider>(context, listen: false);

    return Scaffold(
      appBar: appBar(),
      backgroundColor: const Color(0xff271789),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Registro',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputForm(
                    hintText: 'Documento de identidad',
                    controlador: _cedulaController,
                    obscureText: false,
                  ),
                  InputForm(
                    hintText: 'Nombres',
                    controlador: _nombreController,
                    obscureText: false,
                  ),
                  InputForm(
                      hintText: 'Apellidos',
                      controlador: _apellidosController,
                      obscureText: false),
                  InputForm(
                      hintText: 'Correo electrónico',
                      controlador: _correoController,
                      obscureText: false),
                  InputForm(
                      hintText: 'Contraseña',
                      controlador: _contraseniaController,
                      obscureText: true),
                  InputForm(
                      hintText: 'Confirmar contraseña',
                      controlador: _confirmcontraseniaController,
                      obscureText: true),
                  const SizedBox(
                    height: 30,
                  ),
                  BotonPrimario(
                    texto: 'Crear cuenta',
                    onPressed: () {
                      // Validar que todos los campos estén llenos
                      if (_cedulaController.text.isEmpty ||
                          _nombreController.text.isEmpty ||
                          _apellidosController.text.isEmpty ||
                          _correoController.text.isEmpty ||
                          _contraseniaController.text.isEmpty ||
                          _confirmcontraseniaController.text.isEmpty) {
                        // Mostrar un mensaje de error o realizar alguna acción
                        mostrarMensajeError(
                            context, 'Todos los campos son obligatorios');
                        return;
                      }

                      // Validar que el correo electrónico tenga un formato válido
                      if (!esCorreoValido(_correoController.text)) {
                        // Mostrar un mensaje de error o realizar alguna acción
                        mostrarMensajeError(
                            context, 'Correo electrónico no válido');
                        return;
                      }

                      // Resto del código para crear la cuenta
                      gestionUsuario.crearUsuario(
                        _nombreController.text,
                        _apellidosController.text,
                        _correoController.text,
                        _contraseniaController.text,
                        _confirmcontraseniaController.text,
                        _cedulaController.text,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RespuestaCrearUsuarioScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mostrarMensajeError(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.error,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(mensaje),
          ],
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  bool esCorreoValido(String correo) {
    final RegExp regex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return regex.hasMatch(correo);
  }
}
