import 'package:device_preview/device_preview.dart';
import 'package:ecomers_app/screens/all_product_details_screen.dart';
import 'package:ecomers_app/screens/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

main(){
  runApp(
     DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => 
    MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: SplashView() ,
    )
     )
  );
}