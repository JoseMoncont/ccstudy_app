import 'package:ccstudy_app/pages/login.dart';
import 'package:ccstudy_app/widgets/generales.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../providers/crear_usuario_provider.dart';

class RespuestaCrearUsuarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Usa un Consumer para escuchar los cambios en el proveedor
    return Consumer<GestionUsuarioProvider>(
      builder: (context, gestionUsuarioProvider, child) {
        // Verifica el estado actual y actualiza la interfaz de usuario en consecuencia
        switch (gestionUsuarioProvider.estado) {
          case UsuarioState.Loading:
            return _buildLoadingUI();
          case UsuarioState.Loaded:
            return _buildLoadedUI(context);
          case UsuarioState.Empty:
            return _buildEmptyUI();
          case UsuarioState.Error:
            return _buildErrorUI(gestionUsuarioProvider.errorMensaje);
          default:
            return Container(); // Maneja cualquier otro caso según tus necesidades
        }
      },
    );
  }

  Widget _buildLoadingUI() {
    // Construye la interfaz de usuario para el estado de carga
    return const Scaffold(
      backgroundColor: Color(0xff271789),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildLoadedUI(BuildContext context) {
    // Construye la interfaz de usuario para el estado cargado
    return Scaffold(
      backgroundColor: const Color(0xff271789),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/success2.json'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Usuario creado exitosamente',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.6,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('Iniciar Sesión')),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyUI() {
    // Construye la interfaz de usuario para el estado vacío
    return Scaffold(
      backgroundColor: const Color(0xff271789),
      body: Center(
        child: Column(
          children: [
            Lottie.asset('assets/animations/error.json'),
            const Text('La respuesta del servidor está vacía'),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorUI(String errorMessage) {
    // Construye la interfaz de usuario para el estado de error
    return Scaffold(
      backgroundColor: colorBG,
      appBar: appBar(),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/error.json', width: 120),
            Text(
              errorMessage,
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
