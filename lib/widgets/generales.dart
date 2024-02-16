import 'package:flutter/material.dart';

espacioH3() {
  return SizedBox(
    height: 30,
  );
}

appBar() {
  return AppBar(
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      title: const Text(
        "CCStudy",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ));
}
