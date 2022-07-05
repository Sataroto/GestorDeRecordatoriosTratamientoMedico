import 'package:gestorderecordatorios/view/TratamientoView.dart';
import 'package:gestorderecordatorios/view/listadetratamientos_view.dart';
import 'package:gestorderecordatorios/viewmodel/TratamientosViewModel.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TratamientosView extends GetView<TratamientosViewModel>{
  @override
  TratamientosViewModel controller = Get.find<TratamientosViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Tratamientos"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Wrap(
          runSpacing: 20,
          children: [wTratamientoLista(context)]// wCategories(), wItemList(context)],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Row( children: const [Icon(Icons.add) , Text("TRATAMIENTO")]),
        tooltip: 'Increment',
        autofocus: true,
        onPressed: () { },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  Widget wTratamientoLista(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Obx(() => controller.loading.value
        ? Center(
      child: CircularProgressIndicator(),
    )
        : ListView.builder(
        itemCount: controller.tratamientos.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              padding:
              EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        const Color(0xFFFFFFFF),
                        const Color(0xB0E7E9E7),
                      ],
                      begin: Alignment(0.2, 0.0),
                      end: Alignment(1.0, 0.0),
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.tratamientos[index].nombre),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.tratamientos[index].traducir_estado() +
                                  ".",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xff465bd8),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Get.to(()=>TratamientoView(),arguments: [index]);
            },
          );
        }));
  }
}