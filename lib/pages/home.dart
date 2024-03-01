import 'package:ccstudy_app/pages/perfil.dart';
import 'package:ccstudy_app/pages/tipos_resultados.dart';
import 'package:ccstudy_app/providers/iniciar_sesion_provider.dart';
import 'package:ccstudy_app/providers/usuario_provider.dart';
import 'package:ccstudy_app/widgets/botones.dart';
import 'package:ccstudy_app/widgets/generales.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return _build();
  }

  _build() {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) {
        // Verifica el estado actual y actualiza la interfaz de usuario en consecuencia
        switch (loginProvider.estado) {
          case LoginState.Loading:
            return _buildLoadingUI();
          case LoginState.Loaded:
            return _buildLoadedUI(context);
          case LoginState.Empty:
            return _buildEmptyUI();
          case LoginState.Error:
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
    final loginUsuario = Provider.of<LoginProvider>(context);
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final datosUsuario = loginUsuario.datosUsuario.record!.data;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorBG,
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'CCStudy',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            IconButton(
                onPressed: () {
                  usuarioProvider.consultarUsuario('${loginUsuario.usuarioId}');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PerfilUsuarioScreen()));
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      backgroundColor: colorBG,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 13.0, horizontal: 25.0),
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bienvenido(a)",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                Text(
                  datosUsuario["nombres"],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
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
                margin: const EdgeInsets.symmetric(
                    vertical: 13.0, horizontal: 25.0),
                child: Lottie.asset('assets/animations/tomademuestra.json',
                    height: MediaQuery.of(context).size.height / 3),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 13.0, horizontal: 25.0),
                child: const Text(
                  "En los siguientes resultados podrá encontar información detallada acerca de su estado de salud",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 13.0, horizontal: 25.0),
                  child: BotonPrimario(
                      texto: 'Consultar mis resultados',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Updatedata()));
                      }))
            ],
          )
        ]),
      ),
    );
  }

  _buildEmptyUI() {}

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
