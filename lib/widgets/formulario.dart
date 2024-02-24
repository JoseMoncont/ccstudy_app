import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
  const Formulario({
    super.key,
    required this.hintTex,
    required this.controlador,
  });
  final String hintTex;
  final TextEditingController controlador;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      margin: const EdgeInsetsDirectional.symmetric(
          vertical: 1.0, horizontal: 25.0),
      child: TextFormField(
        controller: controlador,
        obscureText: false,
        decoration: InputDecoration(
            filled: true,
            hintText: hintTex,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10.0)))),
      ),
    );
  }
}

class InputForm extends StatelessWidget {
  const InputForm(
      {Key? key,
      required this.hintText,
      required this.controlador,
      required this.obscureText,
      required this.inputType,
      required this.icono})
      : super(key: key);
  final String hintText;
  final TextEditingController controlador;
  final bool obscureText;
  final TextInputType inputType;
  final IconData icono;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      //height: 48,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controlador,
        obscureText: obscureText,
        textAlignVertical: TextAlignVertical.bottom,
        keyboardType: inputType,
        decoration: InputDecoration(
          icon: Icon(icono),
          labelText: hintText,

          isDense: true,
          //filled: true,
          // enabledBorder: const OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.white),
          //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
          // focusedBorder: const OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.white),
          //     borderRadius: BorderRadius.all(Radius.circular(10.0)))
        ),
      ),
    );
  }
}
