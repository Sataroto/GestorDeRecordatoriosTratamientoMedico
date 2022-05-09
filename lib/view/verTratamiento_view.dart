import 'package:gestorderecordatorios/viewmodel/TratamientosViewModel.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TratamientosView extends GetView<TratamientosViewModel>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Tratamientos"),
      ),
      body: Container(
        child: const Center(
          child: Text(
            "Ver tratamientos",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}