import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyUploadButton extends StatelessWidget {

  final function;


  MyUploadButton({required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      height: 40.h,
      child: MaterialButton(
        color: Color(0xffff4572),
        onPressed:function,
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud_upload_sharp,color: Colors.white,),
            SizedBox(width: 8.w,),
            Text(
              'Upload',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
