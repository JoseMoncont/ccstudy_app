import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
//import 'package:http/http.dart' as http;

// Enumeración para representar los distintos estados
enum LoginState { Loading, Loaded, Empty, Error }

class LoginProvider extends ChangeNotifier {
  final pb = PocketBase('https://ccstudy.pockethost.io');
  // Variables para el manejo de estado
  LoginState _estado = LoginState.Empty;
  String _errorMensaje = '';
  RecordAuth datosUsuario = RecordAuth();
  String? usuarioId = '';

  LoginState get estado => _estado;
  String get errorMensaje => _errorMensaje;

  Future<void> login(
    String cedula,
    String password,
  ) async {
    // Cambiar el estado a Loading al comenzar la operación
    _cambiarEstado(LoginState.Loading);

    try {
      final authData = await pb.collection('users').authWithPassword(
            cedula,
            password,
          );

      datosUsuario = authData;
      usuarioId = datosUsuario.record?.id;

      // pb.authStore.isValid
      //     ? _cambiarEstado(LoginState.Loaded)
      //     : _cambiarEstado(LoginState.Empty);

      print(authData);
      print(pb.authStore.isValid);
      print(pb.authStore.token);
      print(pb.authStore.model.id);

      // Cambiar el estado a Loaded cuando la operación es exitosa
      _cambiarEstado(LoginState.Loaded);
    } catch (error) {
      if (error is ClientException) {
        _cambiarEstado(LoginState.Error, error.response['message']);
      } else {
        _cambiarEstado(LoginState.Error,
            'Ocurrió un error desconocido, por favor contáctese con soporte');
        print(error);
      }
      // Capturar errores y cambiar el estado a Error
    }
  }

  // Método privado para cambiar el estado y notificar a los oyentes
  void _cambiarEstado(LoginState nuevoEstado, [String mensaje = '']) {
    _estado = nuevoEstado;
    _errorMensaje = mensaje;
    notifyListeners();
  }
}
