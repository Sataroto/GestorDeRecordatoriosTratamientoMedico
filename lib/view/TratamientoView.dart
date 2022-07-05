

import 'package:flutter/cupertino.dart';
import 'package:gestorderecordatorios/view/listadetratamientos_view.dart';
import 'package:gestorderecordatorios/viewmodel/TratamientosViewModel.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TratamientoView extends GetView<TratamientosViewModel> {
  final tratamiento = Get.find<TratamientosViewModel>().getTratamiento(Get.arguments[0]);
  String Primeradosis= "-- de -- del -- ";

  @override
  TratamientosViewModel controller = Get.find<TratamientosViewModel>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tratamiento: "+tratamiento.nombre),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: Wrap(
            runSpacing: 20,
            children: [buildCard(),
            Divider(),]// wCategories(), wItemList(context)],
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
  Widget buildCard() {
    return Container(
      margin: EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color:  Color.fromARGB(8, 33, 33, 33),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(10, 0, 0, 0),
            blurRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 12.0),
            child: Column(
              children: [
                Text(
                  "Fecha de la primera dosis",
                  style: TextStyle(
                    //fontWeight: FontWeight.w500,
                    color: Color.fromARGB(100, 0, 0, 0),
                    letterSpacing: 0.8,
                  ),
                ),
                Text(
                  Primeradosis,
                    style:
                    TextStyle(
                        color: Colors.black,
                        fontSize: 30.0
                    )
                )
              ],
            )

          ),
        ],
      ),
    );
  }
}
