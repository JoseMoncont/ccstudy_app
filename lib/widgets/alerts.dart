import 'package:flutter/material.dart';

void mostrarAlertDialog(BuildContext context, String titulo, String contenido) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(titulo),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(contenido),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
  );
}

void mostrarAlertDialogDelete(BuildContext context, String titulo,
    String descripcion, String contenido, VoidCallback aceptar) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceBetween,
        title: Text(titulo),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                contenido,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.red),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(descripcion)
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: aceptar,
            child: const Text('Eliminar'),
          ),
        ],
      );
    },
  );
}

void mostrarAlertaCargando(
    BuildContext context, String descripcion, String contenido) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceBetween,
        content: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(child: CircularProgressIndicator.adaptive()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    contenido,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.red),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(width: 180, child: Text(descripcion))
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
