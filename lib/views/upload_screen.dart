import 'dart:async';
import 'package:dollar_task1/blocs/upload_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/my_upload_button.dart';

class UploadScreen extends StatefulWidget {
  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  // @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadCubit(),
      child: BlocConsumer<UploadCubit, UploadState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = UploadCubit.get(context);
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('assets/img.png')),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'Upload\nHistopathological image',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'You can upload the\nHistopathological Image on this\n page to see if there is a breast\ncancer or not. ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600]),
                    ),
                    SizedBox(height: 65.h),
                    MyUploadButton(
                      function: () {
                        cubit.showLoadingDialog(context);
                        Timer(
                          const Duration(seconds: 2),
                          () {
                            Navigator.of(context, rootNavigator: true).pop();
                            cubit.pickImage().then(
                                (value) => cubit.showAlertDialog(context));
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
