import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

// Enumeración para representar los distintos estados
enum LoginState { Loading, Loaded, Empty, Error }

class LoginProvider extends ChangeNotifier {
  final pb = PocketBase('http://127.0.0.1:8090');
  // Variables para el manejo de estado
  LoginState _estado = LoginState.Empty;
  String _errorMensaje = '';

  LoginState get estado => _estado;
  String get errorMensaje => _errorMensaje;

  Future<void> login(
    String cedula,
    String password,
  ) async {
    // Cambiar el estado a Loading al comenzar la operación
    _cambiarEstado(LoginState.Loading);

    final baseUrl = 'http://127.0.0.1:8090';

    try {
      final authData = await pb.collection('users').authWithPassword(
            cedula,
            password,
          );

      print(authData);
      print(pb.authStore.isValid);
      print(pb.authStore.token);
      print(pb.authStore.model.id);

      // Cambiar el estado a Loaded cuando la operación es exitosa
      _cambiarEstado(LoginState.Loaded);
    } catch (error) {
      // Capturar errores y cambiar el estado a Error
      _cambiarEstado(LoginState.Error, error.toString());
      print(error);
    }
  }

  // Método privado para cambiar el estado y notificar a los oyentes
  void _cambiarEstado(LoginState nuevoEstado, [String mensaje = '']) {
    _estado = nuevoEstado;
    _errorMensaje = mensaje;
    notifyListeners();
  }
}
