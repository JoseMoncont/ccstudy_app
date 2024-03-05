import 'package:ccstudy_app/widgets/generales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 105, 215, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            texto,
            style: const TextStyle(
                color: colorBG, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ));
  }
}

class BotonPrimarioCargando extends StatelessWidget {
  const BotonPrimarioCargando({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff040346),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const CircularProgressIndicator()));
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
                style: const TextStyle(
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

class BotonSecundario extends StatelessWidget {
  const BotonSecundario(
      {super.key, required this.texto, required this.onPressed});
  final String texto;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              // side: const BorderSide(color: Colors.white),
              backgroundColor: colorBG,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            texto,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ));
  }
}

class BotonOpcion extends StatelessWidget {
  const BotonOpcion(
      {super.key,
      required this.texto,
      required this.onPressed,
      required this.icono});
  final String texto;
  final VoidCallback onPressed;
  final IconData icono;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 72, 9, 160),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            icono,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          texto,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 37, 10, 107),
            )
          ],
        ));
  }
}

class BotonOpcionRed extends StatelessWidget {
  const BotonOpcionRed(
      {super.key, required this.texto, required this.onPressed});
  final String texto;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        texto,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: Color.fromARGB(255, 37, 10, 107),
            )
          ],
        ));
  }
}
