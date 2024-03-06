import 'package:animate_do/animate_do.dart';
import 'package:ccstudy_app/pages/about.dart';
import 'package:ccstudy_app/pages/cambiar_contrase%C3%B1a.dart';
import 'package:ccstudy_app/pages/eliminacion_cuenta.dart';
import 'package:ccstudy_app/providers/eliminar_usuario.dart';
import 'package:ccstudy_app/widgets/alerts.dart';
import 'package:ccstudy_app/widgets/botones.dart';
import 'package:ccstudy_app/widgets/generales.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/iniciar_sesion_provider.dart';

class PerfilUsuarioScreen extends StatelessWidget {
  const PerfilUsuarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginUsuario = Provider.of<LoginProvider>(context);
    final datosUsuario = loginUsuario.datosUsuario.record!.data;
    final eliminarUser = Provider.of<EliminarUsuarioProvider>(context);
    return Scaffold(
      backgroundColor: colorBG,
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              FadeInUp(
                delay: const Duration(milliseconds: 100),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 72, 9, 160)),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/profile.png',
                              width: 90,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  datosUsuario["nombres"],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                Text(
                                  datosUsuario["apellidos"],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        color: colorBG,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              datosUsuario["email"],
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              datosUsuario["celular"].toString(),
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      BotonOpcion(
                        texto: 'Cambiar contraseña',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CambiarContrasenia()));
                        },
                        icono: Icons.key,
                      ),
                      BotonOpcion(
                        texto: 'Soporte',
                        onPressed: () {},
                        icono: Icons.support,
                      ),
                      BotonOpcion(
                        texto: 'Sobre la app',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => About()));
                        },
                        icono: Icons.info,
                      ),
                      BotonOpcion(
                        texto: 'Eliminar cuenta',
                        onPressed: () {
                          mostrarAlertDialogDelete(
                              context,
                              'Eliminar Cuenta',
                              'Tus datos, incluyendo los resultados de laboratorio serán eliminados de tu cuenta.',
                              '¿Estás seguro que deseas eliminar la cuenta?',
                              () {
                            eliminarUser.eliminarUsuario(
                                loginUsuario.usuarioId.toString(),
                                loginUsuario.pb.authStore.token);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EliminarCuentaPage()));
                          });
                        },
                        icono: Icons.delete,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 300),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  BotonPrimario(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'login', (route) => false);
                    },
                    texto: 'Cerrar Sesión',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
