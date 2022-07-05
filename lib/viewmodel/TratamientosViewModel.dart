import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/TratamientoService.dart';
import '../repository/TratamientoRepo.dart';

class TratamientosViewModel extends GetxController{
  var tratamientos = List<Tratamiento>.empty().obs;
  var loading = true.obs;

  @override
  void onInit(){
    super.onInit();
    fetchTratamientos();

  }

  Future<void> fetchTratamientos() async{
    loading.value = true;
    tratamientos.clear();
    var getTratamientos = await TratamientoSqlite().get_tratamientos();
    var muestra = Tratamiento(tratamiento_id: 1, nombre: "Diarrea", estado: 2);
    tratamientos.add(muestra);
    loading.value = false;
    getTratamientos.forEach((item) {
      tratamientos.add(item);
    });
  }

  Tratamiento getTratamiento(int index){
    return tratamientos[index];
  }

}