
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../viewmodel/CalendarioViewModel.dart';

class CalendarioView extends GetView<CalendarioViewModel>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Fecha de Seleccionada"),
      ),
      body: Container(
        child: const Center(
          child: Text(
            "Calendario",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}