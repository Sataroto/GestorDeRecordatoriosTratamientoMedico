import 'package:flutter/material.dart';
import 'package:gestorderecordatorios/model/TratamientoService.dart';
import 'package:gestorderecordatorios/repository/TratamientoRepo.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ListaTratamientosViewModel extends GetxController{
  List<Tratamiento> tratamientos = List<Tratamiento>.empty();

  getData() async{
      final resultados = await TratamientoSqlite().get_tratamientos();
      tratamientos = resultados;
  }




}