import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/AppsBinding/appbinding.dart';
import 'core/cachhelper/cash_helper.dart';
import 'approutes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FakeAPI using Getx&DIO',
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.posts,
      getPages: AppBindings.AppBinding,
      debugShowCheckedModeBanner: false,
    );
  }
}