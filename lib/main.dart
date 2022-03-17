
import 'package:covid_19_tracker/services/auth_controller.dart';
import 'package:covid_19_tracker/views/authscreens/screens/check.dart';
import 'package:covid_19_tracker/views/authscreens/screens/splash.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';



void main()async{
  
 WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Get.put(AuthController());





  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Covid-19-tracker',
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
 
      home: Splash()
    );
  }
}
