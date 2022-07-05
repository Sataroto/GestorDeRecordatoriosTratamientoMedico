import 'package:gestorderecordatorios/view/CalendarioView.dart';
import 'package:gestorderecordatorios/viewmodel/DosisViewModel.dart';
import 'package:gestorderecordatorios/viewmodel/TratamientosViewModel.dart';
import 'package:get/get.dart';

import 'CalendarioViewModel.dart';

class DashboardViewModel extends GetxController{
  var tabIndex=0.obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardViewModel>(() => DashboardViewModel());
    Get.lazyPut<TratamientosViewModel>(() => TratamientosViewModel());
    Get.lazyPut<CalendarioViewModel>(() => CalendarioViewModel());
    Get.lazyPut<DosisViewModel>(() => DosisViewModel());
  }
}