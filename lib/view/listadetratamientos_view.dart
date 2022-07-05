
import 'package:gestorderecordatorios/model/TratamientoService.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../viewmodel/listadetratamientos_viewmodel.dart';

class ListaTratamientoView extends GetWidget<ListaTratamientosViewModel>{
  @override
  //final controller=Get.put(ListaTratamientosViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
    Text("ola")
    /*FutureBuilder(
      future: controller.getData(),
      builder: (context, AsyncSnapshot snapshot){
        return Text(controller.tratamientos.length.toString());
      },
    )*/
    );

  }
  
}