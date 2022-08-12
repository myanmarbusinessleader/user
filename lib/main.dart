import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/utils/router/router.dart';
import 'controller/filter_form_controller.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(FilterFormController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.amber,
        appBarTheme: const AppBarTheme(
          color:  Colors.amber,
        ),
        cardColor: Colors.amber,
        buttonColor: Colors.amber,
        
      ),
      initialRoute: homeScreen,
      getPages: getPages,
    );
  }
}
