import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestorderecordatorios/view/verTratamiento_view.dart';
import 'package:get/get.dart';
import '../viewmodel/Dashboard_viewmodel.dart';
import 'CalendarioView.dart';
import 'DosisView.dart';

class DashboardView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  GetBuilder<DashboardViewModel>(
      builder: (controller) {
        return Scaffold(
          body:SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  TratamientosView(),
                  CalendarioView(),
                  DosisView()
                ],
              ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            //unselectedItemColor: Colors.white,
            //selectedItemColor: Colors.green,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            //backgroundColor: Colors.white,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.rectangle_on_rectangle_angled),
                label: 'Tratamientos',
                tooltip: "Ver los tratamientos guardados"
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.calendar_today),
                  label: 'Calendario',
                  tooltip: "Ver las dosis del dia"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.alarm_on_sharp),
                  label: 'Dosis',
                  tooltip: "Ver dosis asignadas"
              ),
            ],
          )
        );
      },
    );
  }
}