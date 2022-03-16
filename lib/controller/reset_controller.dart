import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetControler extends GetxController {
  final GlobalKey<FormState> resetformkey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;

  var password = '';
  var name='';
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
   
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  
  String? validatename(String value) {
    if (!GetUtils.isUsername(value)) {
      return "  Please enter a valid name";
    }
    return null;
  }

 
  String? validateEmail(String? value) {

    final bool isValid = EmailValidator.validate(value!);

    if (isValid==false) {
      return "  Provide valid Email";
    }else{
      return null;
    }
   
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "  Password must be of  min 6 characters";
    }
    
    return null;
  }

  void checkLogin({ required void call}) {
    final isValid = resetformkey.currentState!.validate();
    if (!isValid) {
      return call;
    }
    resetformkey.currentState!.save();
  }
}
