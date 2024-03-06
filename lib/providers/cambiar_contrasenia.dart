import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
//import 'package:http/http.dart' as http;

// Enumeración para representar los distintos estados
enum CambiarContraseniaState { Initial, Loading, Loaded, Empty, Error }

class CambiarContraseniaProvider extends ChangeNotifier {
  final pb = PocketBase('https://ccstudy.pockethost.io');
  // Variables para el manejo de estado
  CambiarContraseniaState _estado = CambiarContraseniaState.Initial;
  String _errorMensaje = '';

  CambiarContraseniaState get estado => _estado;
  String get errorMensaje => _errorMensaje;

  Future<void> cambiarContrasenia(
      token, String contrasenia, String confirmContrasenia) async {
    // Cambiar el estado a Loading al comenzar la operación
    _cambiarEstado(CambiarContraseniaState.Loading);

    try {
      // final oldAuth = pb.authStore.model;

      final response = await pb.collection('users').confirmPasswordReset(
            token,
            contrasenia,
            confirmContrasenia,
          );
// );

      // print(response);
//       final record = await pb.collection('users').getOne(id, headers: {
//         'Authorization': 'Bearer $token',
//       });
      // Cambiar el estado a Loaded cuando la operación es exitosa
      _cambiarEstado(CambiarContraseniaState.Loaded);
    } catch (error) {
      if (error is ClientException) {
        _cambiarEstado(CambiarContraseniaState.Error,
            error.response['message'] ?? 'Error desconocido');
      } else {
        _cambiarEstado(CambiarContraseniaState.Error,
            'Ocurrió un error desconocido, por favor contáctese con soporte');
        print(error);
      }
      // Capturar errores y cambiar el estado a Error
    }
  }

  // Método privado para cambiar el estado y notificar a los oyentes
  void _cambiarEstado(CambiarContraseniaState nuevoEstado,
      [String mensaje = '']) {
    _estado = nuevoEstado;
    _errorMensaje = mensaje;
    notifyListeners();
  }

  reiniciarEstado() {
    _cambiarEstado(CambiarContraseniaState.Initial);
  }
}
