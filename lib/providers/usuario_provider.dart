import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
//import 'package:http/http.dart' as http;

// Enumeración para representar los distintos estados
enum UsuarioState { Loading, Loaded, Empty, Error }

class UsuarioProvider extends ChangeNotifier {
  final pb = PocketBase('https://ccstudy.pockethost.io');
  // Variables para el manejo de estado
  UsuarioState _estado = UsuarioState.Empty;
  String _errorMensaje = '';
  RecordModel datosUsuario = RecordModel();
  String urlDocQuimSang = '';
  String urlDocEcodopler = '';
  String urlDocEspirometria = '';

  UsuarioState get estado => _estado;
  String get errorMensaje => _errorMensaje;

  Future<void> consultarUsuario(String id, token) async {
    // Cambiar el estado a Loading al comenzar la operación
    _cambiarEstado(UsuarioState.Loading);

    try {
      final record = await pb.collection('users').getOne(id, headers: {
        'Authorization': 'Bearer $token',
      });

      //OBTENER DOCUMENTOS

      // QUIMICA SANGUINEA ------------------------------------------------------------

      final urlDocQS = record.getListValue<String>('doc_quimsang')[0];
      final urlDocQSResponse =
          pb.files.getUrl(record, urlDocQS, thumb: '100x250');
      urlDocQuimSang = urlDocQSResponse.toString();

      // ECODOPLER ---------------------------------------------------------------------

      final urlDocEco = record.getListValue<String>('doc_ecodopler')[0];
      final urlDocEcoResponse =
          pb.files.getUrl(record, urlDocEco, thumb: '100x250');
      urlDocEcodopler = urlDocEcoResponse.toString();

      // ESPIROMETRIA -------------------------------------------------------------------

      final urlDocEspiro = record.getListValue<String>('doc_espirom')[0];
      final urlDocEspiroResponse =
          pb.files.getUrl(record, urlDocEspiro, thumb: '100x250');
      urlDocEspirometria = urlDocEspiroResponse.toString();

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
