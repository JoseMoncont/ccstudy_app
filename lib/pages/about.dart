import 'package:animate_do/animate_do.dart';
import 'package:ccstudy_app/widgets/generales.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBG,
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInUp(
            delay: const Duration(milliseconds: 300),
            child: Container(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(30)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/icono.jpg',
                        width: MediaQuery.of(context).size.width / 2,
                      )),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: const Column(
              children: [
                Text(
                  'CCStudy App',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'V 1.0.0',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 500),
            child: const Column(
              children: [
                Text(
                  'Desarrollado por:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Braizon Quintero & Jose Montes',
                  style: TextStyle(
                    color: Color.fromARGB(255, 144, 229, 255),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
