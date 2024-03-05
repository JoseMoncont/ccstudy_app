import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

// Enumeración para representar los distintos estados
enum UsuarioState { Loading, Loaded, Empty, Error }

class GestionUsuarioProvider extends ChangeNotifier {
  final pb = PocketBase('https://ccstudy.pockethost.io');
  // Variables para el manejo de estado
  UsuarioState _estado = UsuarioState.Empty;
  String _errorMensaje = '';

  UsuarioState get estado => _estado;
  String get errorMensaje => _errorMensaje;

  Future<void> crearUsuario(
      String nombre,
      String apellidos,
      String correo,
      String contrasenia,
      String confirmContrasenia,
      String cedula,
      String celular) async {
    // Cambiar el estado a Loading al comenzar la operación
    _cambiarEstado(UsuarioState.Loading);

    try {
      final body = <String, dynamic>{
        "username": cedula,
        "email": correo,
        "password": contrasenia,
        "passwordConfirm": confirmContrasenia,
        "cedula": cedula,
        "nombres": nombre,
        "apellidos": apellidos,
        "celular": celular,
      };

      final record = await pb.collection('users').create(body: body);
      //  final resp = await http.post(_url, body: body);

      //  print(resp);

// (optional) send an email verification request
      await pb.collection('users').requestVerification(correo);

      // Cambiar el estado a Loaded cuando la operación es exitosa
      _cambiarEstado(UsuarioState.Loaded);
    } catch (error) {
      if (error is ClientException) {
        _cambiarEstado(UsuarioState.Error, error.response['message']);
      }
      // Capturar errores y cambiar el estado a Error
      _cambiarEstado(UsuarioState.Error, error.toString());
      print(error);
    }
  }

  // Método privado para cambiar el estado y notificar a los oyentes
  void _cambiarEstado(UsuarioState nuevoEstado, [String mensaje = '']) {
    _estado = nuevoEstado;
    _errorMensaje = mensaje;
    notifyListeners();
  }
}
