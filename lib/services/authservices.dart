

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19_tracker/utilities/constants/const_color.dart';
import 'package:covid_19_tracker/views/homepage_screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

class Auth{

      static Future<void> singout()async{

        await FirebaseAuth.instance.signOut();

        


         
       } 

  static Future<void> signIn({required String email, required String password,required Size size}) async {
    final _auth = FirebaseAuth.instance;


    String? errorMessage;

      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
         

          
     
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }


        Get.snackbar('error','',duration: Duration(seconds: 3),colorText: Colors.purpleAccent,
        messageText: Text(errorMessage,style: GoogleFonts.manrope(fontSize: size.width*0.04,fontWeight: FontWeight.w700,color:Colors.purpleAccent, ),),
         backgroundGradient: gradcolor,
     
            
        
        
        );
        

      
      }catch(e){
      Get.snackbar('error','',duration: Duration(seconds: 3),colorText: Colors.purpleAccent,
        messageText: Text('Network error',style: GoogleFonts.manrope(fontSize: size.width*0.04,fontWeight: FontWeight.w700,color:Colors.purpleAccent, ),),
         backgroundGradient: gradcolor,
     
            
        
        
        );


      }
    }

    

    static Future<void> signUp({required String email, required String password,required String name,required Size size}) async {

       
    String? errorMessage;
   
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {
              postDetailsToFirestore(email: email, name: name, password: password, size: size)
            
            
            })
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Get.snackbar('error','',duration: Duration(seconds: 3),colorText: Colors.purpleAccent,
        messageText: Text(errorMessage,style: GoogleFonts.manrope(fontSize: size.width*0.04,fontWeight: FontWeight.w700,color:Colors.purpleAccent, ),),
         backgroundGradient: gradcolor,
     
            
        
        
        );
      }
    }

  static  Future<UserCredential?> signInWithGoogle({required BuildContext context}) async {
    final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleuser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);


    var authResult = await FirebaseAuth.instance.signInWithCredential(credential);



  

    }


  }





  
  postDetailsToFirestore({required email,required name,required password,required Size size}) async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = email;
    userModel.uid = user!.uid;
    userModel.name= name;
    userModel.password = password;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
  Get.snackbar('error','',duration: Duration(seconds: 3),colorText: Colors.purpleAccent,
        messageText: Text('Network error',style: GoogleFonts.manrope(fontSize: size.width*0.04,fontWeight: FontWeight.w700,color:Colors.purpleAccent, ),),
         backgroundGradient: gradcolor,
     
            
        
        
        );

   



  }



