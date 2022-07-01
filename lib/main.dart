import 'package:fetch_api_data/constants/app_color.dart';
import 'package:fetch_api_data/constants/app_strings.dart';
import 'package:fetch_api_data/views/email_validation.dart';
import 'package:fetch_api_data/views/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.appName,
      theme: ThemeData(primarySwatch: AppColor.orangeColor),
      debugShowCheckedModeBanner: false,
      home: EmailValidation(),
    );
  }
}
