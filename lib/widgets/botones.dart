import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icon.dart';

class BotonPrimario extends StatelessWidget {
  const BotonPrimario(
      {super.key, required this.texto, required this.onPressed});
  final String texto;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            texto,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff040346),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ));
  }
}

class BotonResultado extends StatelessWidget {
  BotonResultado(
      {Key? key,
      required this.titulo,
      required this.icono,
      required this.alPresionar})
      : super(key: key);

  final String titulo;
  final SvgPicture icono;
  final VoidCallback alPresionar;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: alPresionar,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icono,
            Container(
              //color: Colors.amber,
              alignment: Alignment.center,
              width: 100,
              height: 50,
              child: Text(
                titulo,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.2,
                    fontSize: 15),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
