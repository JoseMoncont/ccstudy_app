import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
//import 'package:http/http.dart' as http;

// Enumeración para representar los distintos estados
enum EliminarUsuarioState { Loading, Loaded, Empty, Error }

class EliminarUsuarioProvider extends ChangeNotifier {
  final pb = PocketBase('https://ccstudy.pockethost.io');
  // Variables para el manejo de estado
  EliminarUsuarioState _estado = EliminarUsuarioState.Empty;
  String _errorMensaje = '';

  EliminarUsuarioState get estado => _estado;
  String get errorMensaje => _errorMensaje;

  Future<void> eliminarUsuario(String id, token) async {
    // Cambiar el estado a Loading al comenzar la operación
    _cambiarEstado(EliminarUsuarioState.Loading);

    try {
      await pb.collection('users').delete(id, headers: {
        'Authorization': 'Bearer $token',
      });
      // final record = await pb.collection('users').getOne(id, headers: {
      //   'Authorization': 'Bearer $token',
      // });

      // Cambiar el estado a Loaded cuando la operación es exitosa
      _cambiarEstado(EliminarUsuarioState.Loaded);
    } catch (error) {
      if (error is ClientException) {
        _cambiarEstado(EliminarUsuarioState.Error,
            error.response['message'] ?? 'Error desconocido');
      } else {
        _cambiarEstado(EliminarUsuarioState.Error,
            'Ocurrió un error desconocido, por favor contáctese con soporte');
        print(error);
      }
      // Capturar errores y cambiar el estado a Error
    }
  }

  // Método privado para cambiar el estado y notificar a los oyentes
  void _cambiarEstado(EliminarUsuarioState nuevoEstado, [String mensaje = '']) {
    _estado = nuevoEstado;
    _errorMensaje = mensaje;
    notifyListeners();
  }
}
