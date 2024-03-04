import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:http/http.dart' as http;

// Enumeración para representar los distintos estados
enum DocumentoState { Loading, Loaded, Empty, Error }

class DocumentosProvider extends ChangeNotifier {
  final pb = PocketBase('https://ccstudy.pockethost.io');
  // Variables para el manejo de estado
  DocumentoState _estado = DocumentoState.Empty;
  String _errorMensaje = '';

  DocumentoState get estado => _estado;
  String get errorMensaje => _errorMensaje;

  Future<void> crearUsuario(
    String nombre,
    String apellidos,
    String correo,
    String contrasenia,
    String confirmContrasenia,
    String cedula,
  ) async {
    // Cambiar el estado a Loading al comenzar la operación
    _cambiarEstado(DocumentoState.Loading);

    try {
      final body = <String, dynamic>{
        "username": cedula,
        "email": correo,
        "password": contrasenia,
        "passwordConfirm": confirmContrasenia,
        "cedula": cedula,
        "nombres": nombre,
        "apellidos": apellidos,
        "celular": "3216620954",
      };

// (optional) send an email verification request
      await pb.collection('users').requestVerification(correo);

      // Cambiar el estado a Loaded cuando la operación es exitosa
      _cambiarEstado(DocumentoState.Loaded);
    } catch (error) {
      // Capturar errores y cambiar el estado a Error
      _cambiarEstado(DocumentoState.Error, error.toString());
      print(error);
    }
  }

  // Método privado para cambiar el estado y notificar a los oyentes
  void _cambiarEstado(DocumentoState nuevoEstado, [String mensaje = '']) {
    _estado = nuevoEstado;
    _errorMensaje = mensaje;
    notifyListeners();
  }
}
