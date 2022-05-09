import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../viewmodel/listadetratamientos_viewmodel.dart';

class ListaTratamiento extends StatelessWidget{

  Widget build(BuildContext context) {
    return GetBuilder<ListaTratamientosViewModel>(
      init: ListaTratamientosViewModel(), // INIT IT ONLY THE FIRST TIME
      builder: (_) => ListView.builder(
        itemCount: _.tratamientos.length,
        itemBuilder: (context, index) {
          final tratamiento = _.tratamientos[index];
          return ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Text(tratamiento.nombre),
          );
        },

      )
    );
  }
}