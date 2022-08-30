import 'dart:async';

import 'package:ecomers_app/screens/all_product_screen.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Timer(Duration(seconds: 2), () =>Navigator.push(context, MaterialPageRoute(builder: (context) => AllProductScreen(),)) );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    TextStyle shoptitleStyle = Theme.of(context)
              .textTheme.
              bodyText1!
              .copyWith(fontSize: 30);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.green,
            ),
            RichText(text:  TextSpan(
              text: 'E-',style:shoptitleStyle,
              children: [
                 TextSpan(text: 'Shop',style:shoptitleStyle.copyWith(color: Colors.green) ,)
              ]
            ))
          ]),
      ),
    );
  }
}