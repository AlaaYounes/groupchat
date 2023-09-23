import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../shared/component/Constants.dart';
import '../login_screen.dart';
import 'app_states.dart';
import 'package:flutter/material.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  void MoveToSigninScreen(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
    emit(AppMoveToSigninScreenState());
  }

  Future<void> getUserData(String userId) async {

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();

    Map<String, dynamic> userdata = snapshot.data() as Map<String, dynamic>;
    data=userdata;

    }

  // void MoveToRegisterScreen(context) {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => SignUpScreen()));
  //   emit(AppMoveToRegisterScreenState());
  // }
  // XFile? image = XFile("")
  // void gg() async {
  //
  //   final ImagePicker picker = ImagePicker();
  //   image = await picker.pickImage(source: ImageSource.gallery);
  //   if(image != null){
  //     print('${image!.path}');
  //     file =File(image!.path);
  //     emit(ggState());
  //   }else{
  //     print('wrong request');
  //   }
  // }
  XFile imageFile = XFile("https://firebasestorage.googleapis.com/v0/b/zomo-app-ed5e4.appspot.com/o/images%2FSecond_Logo.png?alt=media&token=afed0fe0-46d9-4342-abb7-92e8238bb725");


  Future<void> imageSelector(BuildContext context, String pickerType) async {
    switch (pickerType) {
      case "gallery":
        imageFile = (await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 90,
        ))!;
        break;
      case "camera":
        imageFile = (await ImagePicker().pickImage(
          source: ImageSource.camera,
          imageQuality: 90,
        ))!;
        break;
    }
  }
}
