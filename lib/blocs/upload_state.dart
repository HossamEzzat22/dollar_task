part of 'upload_cubit.dart';

@immutable
abstract class UploadState {}

class UploadInitial extends UploadState {}

class showLoadingDialogState extends UploadState {}
class pickImageState extends UploadState {}
class showAlertDialogState extends UploadState {}

