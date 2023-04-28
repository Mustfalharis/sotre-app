import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/localization/changelocal.dart';
import 'bindings/intial_bindings.dart';
import 'core/constant/color.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main()async{
 WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller=Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'fonts',
        textTheme: const TextTheme(
          headline1:  TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColor.black,
          ),
            headline2:TextStyle(
                fontSize: 22,
                color: AppColor.grey,
                fontWeight: FontWeight.bold),

                bodyText1: TextStyle(
                height: 2,
                fontWeight: FontWeight.bold,
                  color: AppColor.grey,
                  fontSize: 14,
          ),
        ),
      ),
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
