import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';
import 'core/cachhelper/cash_helper.dart';
import 'approutes.dart';
import 'domain/initialbinding/initial_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  InitialBinding().dependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FakeAPI using Getx&DIO',
      initialRoute: AppRoutes.posts,
      getPages: AppBindings.AppBinding,
      debugShowCheckedModeBanner: false,
    );
  }
}