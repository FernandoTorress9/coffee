import 'package:coffee/service/binding.dart';
import 'package:coffee/view/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRouter.getPages(),
      initialRoute: RoutesNames.onBoarding,
      initialBinding: GlobalBinding(),
    );
  }
}
