import 'package:get/get.dart';

import '../view/Dashboardview.dart';
import '../viewmodel/Dashboard_viewmodel.dart';
import 'app_routes.dart';

class AppViews {
static var list = [
GetPage(
name: AppRoutes.DASHBOARD,
page: () => DashboardView(),
binding: DashboardBinding(),
),
];
}