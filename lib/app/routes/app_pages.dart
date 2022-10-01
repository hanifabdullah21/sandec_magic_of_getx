import 'package:get/get.dart';

import '../modules/Form/bindings/form_binding.dart';
import '../modules/Form/views/form_view.dart';
import '../modules/Main/bindings/main_binding.dart';
import '../modules/Main/views/main_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.FORM,
      page: () => FormView(),
      binding: FormBinding(),
    ),
  ];
}
