import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/routes.dart';
import 'bindings/intial_bindings.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}