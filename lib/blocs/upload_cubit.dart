import 'dart:io';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../views/loading_screen.dart';

part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(UploadInitial());

  static UploadCubit get(context)=>BlocProvider.of(context);

  File? image;


  Future<dynamic> showLoadingDialog(BuildContext context) {
    emit(showLoadingDialogState());
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const LoadingScreen(),
    );
  }

  Future pickImage() async {
    emit(pickImageState());
    try {
      final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) return;
      final imageTemporary = File(pickedImage!.path);
      this.image = imageTemporary;
      print(image);
    } on PlatformException catch (e) {
      print('failed to pick image');
    }
  }

  Future<void> showAlertDialog(BuildContext context) async {
    emit(showAlertDialogState());
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      Container(
                          height: 140.h,
                          width: 190.w,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img_4.png'))),
                      SizedBox(height: 30.h),
                      Text(
                        'The Result is:',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Bengin',
                        style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff00ff00)),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Color(0xffff4572)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
