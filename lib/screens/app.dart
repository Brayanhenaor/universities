import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universities/controllers/home_controller.dart';
import 'package:universities/screens/colleges/detail_screen.dart';
import 'package:universities/screens/colleges/home_screen.dart';
import 'package:universities/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.downToUp,
      title: 'Flutter Demo',
      theme: AppTheme.light,
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
          binding: BindingsBuilder(
            () {
              Get.lazyPut<HomeController>(() => HomeController());
            },
          ),
        ),
        GetPage(
          name: '/detail',
          transition: Transition.downToUp,
          page: () => const DetailScreen(),
        ),
      ],
      initialRoute: '/home',
    );
  }
}
