import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
//import 'package:http/http.dart' as http;

// Enumeración para representar los distintos estados
enum UsuarioState { Loading, Loaded, Empty, Error }

class UsuarioProvider extends ChangeNotifier {
  final pb = PocketBase('http://127.0.0.1:8090');
  // Variables para el manejo de estado
  UsuarioState _estado = UsuarioState.Empty;
  String _errorMensaje = '';
  RecordModel datosUsuario = RecordModel();

  UsuarioState get estado => _estado;
  String get errorMensaje => _errorMensaje;

  Future<void> consultarUsuario(
    String id,
  ) async {
    // Cambiar el estado a Loading al comenzar la operación
    _cambiarEstado(UsuarioState.Loading);

    try {
      final record = await pb.collection('users').getOne(id);

      print(record);

      // Cambiar el estado a Loaded cuando la operación es exitosa
      _cambiarEstado(UsuarioState.Loaded);
    } catch (error) {
      if (error is ClientException) {
        _cambiarEstado(UsuarioState.Error,
            error.response['message'] ?? 'Error desconocido');
      } else {
        _cambiarEstado(UsuarioState.Error,
            'Ocurrió un error desconocido, por favor contáctese con soporte');
        print(error);
      }
      // Capturar errores y cambiar el estado a Error
    }
  }

  // Método privado para cambiar el estado y notificar a los oyentes
  void _cambiarEstado(UsuarioState nuevoEstado, [String mensaje = '']) {
    _estado = nuevoEstado;
    _errorMensaje = mensaje;
    notifyListeners();
  }
}
