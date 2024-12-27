import 'package:fakeapi_withdio_getx/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/cachhelper/cash_helper.dart';

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
      initialRoute: AppRoutes.posts,
      getPages: AppRoutes.routes,
    );
  }
}