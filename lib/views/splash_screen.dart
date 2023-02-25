import 'package:dollar_task1/views/upload_screen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: EasySplashScreen(
          backgroundColor: Color(0xffff4572),
          showLoader: false,
          logo: Image(
            image: AssetImage('assets/img_2.png'),
          ),
          logoWidth: 110.w,
          navigator: UploadScreen(),
          durationInSeconds: 5,
        ),
      ),
    );
  }
}
