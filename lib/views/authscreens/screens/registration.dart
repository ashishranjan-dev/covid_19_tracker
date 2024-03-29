
import 'dart:async';
import 'dart:ui';


import 'package:covid_19_tracker/services/authservices.dart';
import 'package:covid_19_tracker/utilities/widgets/loader.dart';
import 'package:covid_19_tracker/views/authscreens/screens/login.dart';
import 'package:covid_19_tracker/views/homepage_screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/registercontroller.dart';
import '../utilities/const_color.dart';
import 'consts.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> with TickerProviderStateMixin {
  AnimationController? controller1;
  AnimationController? controller2;
  Animation<double>? animation1;
  Animation<double>? animation2;
  Animation<double>? animation3;
  Animation<double>? animation4;
  bool isloading=false;
  
  var register=Get.put(RegisterController());
  


  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .4).animate(
      CurvedAnimation(
        parent: controller1!,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1!.forward();
        }
      });
  /*   animation2 = Tween<double>(begin: .02, end: .06).animate(
      CurvedAnimation(
        parent: controller1!,
        curve: Curves.easeOutQuint
      ),
    )..addListener(() {
        setState(() {});
      });
 */
 animation2 = Tween<double>(begin: .01, end: .06).animate(
      CurvedAnimation(
        parent: controller1!,
        curve: Curves.fastOutSlowIn
      ),
    )..addListener(() {
        setState(() {});
      });
      
      

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2!,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2!.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2!,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(Duration(milliseconds: 2500), () {
      controller1!.forward();
    });

    controller2!.forward();
  }

  @override
  void dispose() {
    controller1!.dispose();
    controller2!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      backgroundColor: Color(0xff192028),
      body:  isloading==false? ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Form(
              key: register.registerformkey,
              child: Stack(
                children: [
            
                  //1st
                  Positioned(
                    left:  size.height * (animation2!.value + .35),
                    top: size.width * 1.4,
                     child: CircleAvatar(backgroundImage: Pics.pic,radius:size.width*0.15,
                     backgroundColor: backgroundcolor,
                     
                     ),
                  ),
                  
            
                  //2nd
            
            
                  Positioned(
                     top: size.height * .75,
                    left: size.width * -.3,
                    child: CircleAvatar(backgroundImage: Pics.pic,radius: animation4!.value - 30,
                     backgroundColor: backgroundcolor,
                    
                    
                    ),
                  ),
            
                  
            
                  //3rd
                       
                  Positioned(
                     top: size.height * .1,
                    left: size.width * (animation2!.value + .05),
                     child: CircleAvatar(backgroundImage: Pics.pic,radius:size.width*0.15,
                      backgroundColor: backgroundcolor,
                     
                     ),
                  ),
            
                
            
                  //4th
                
                   Positioned(
                   top: size.height*0.7 * animation3!.value,
                    left: size.width * (animation1!.value + -0.1),
                     child: CircleAvatar(backgroundImage: Pics.globe,radius: size.width*0.45,
            
                      backgroundColor: backgroundcolor,
                     
                     
                     ),
                  ), 
             
                  //5th
            
                   Positioned(
                  top: size.height * -.2,
                    left: size.width * .55,
                     child: CircleAvatar(backgroundImage: Pics.pic,radius:animation4!.value,
            
                      backgroundColor: backgroundcolor,
                    
                     
                     ),
                  ), 
                  
                  Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * .1),
                          child: Text(
                            'Covid Tracker',
                            style: GoogleFonts.manrope(
                              color: Colors.white.withOpacity(.9),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              wordSpacing: 4,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: size.height*0.05,),



                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          namefield(size: size),
                          SizedBox(height: size.height*0.02,),
                          emailfield(size: size),
                            SizedBox(height: size.height*0.02,),
                            passwordfield(size: size),
                              SizedBox(height: size.height*0.02,),
                      
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: ()async{

                                  if(register.registerformkey.currentState!.validate()){

                                    setState(() {
                                      isloading=true;
                                    });

                                    await Auth.signUp(email: register.emailController.text.trim(), name: register.namecontroller.text.trim(),
                                          password: register.passwordController.text.trim(), size: size   );                                
                                       setState(() {
                                      isloading=false;
                                    });
                                 
                               
                                 

                                  }




                                  
                             

                                },
                                child: component2(
                                 string: 'Sign up',
                                                             width:   2.18,
                                                           
                                ),
                              ),
                             
                            ],
                          ),

                          SizedBox(height: 4,),

                               InkWell(
                                 onTap: ()async{

                                   
                               setState(() {
                                 isloading=true;
                               });

                             await  Auth.signInWithGoogle(context: context);

                             
                               setState(() {
                                 isloading=true;
                               });



                                 },
                                 child: component2(
                                   string: 'Sign up  with gmail',
                                   width: 1.2,
                                    
                                  ),
                               ),




                        ],
                      ),
                      Expanded(
                        flex: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: (){
                                     Get.to(()=>LoginScreen(),transition: Transition.leftToRightWithFade,duration:Duration(seconds: 2),);
                              },
                              child: component2(
                                   string: 'Already have account',
                                 width:   2.18,
                                 
                                  ),
                            ),
                               
                            SizedBox(height: size.height * .05),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ):loader.laoder(context: context)
    );
  }
  


  Widget emailfield({required size}) {
   
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          height: size.width / 6,
          width: size.width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            controller: register.emailController,
            style: TextStyle(color: Colors.white.withOpacity(.99),fontWeight: FontWeight.w600),
            cursorColor: Colors.white,
            obscureText: false,
                    validator: (String? value) => register.validateEmail(value!),
            keyboardType:
                 TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.white.withOpacity(.4),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: 'email..',
              hintStyle:
                  TextStyle(fontSize: 16, color: Colors.white.withOpacity(.6)),
            ),
          ),
        ),
      ),
    );
  }


  Widget passwordfield({required size}) {
   
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          height: size.width / 6,
          width: size.width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            controller: register.passwordController,
            style: TextStyle(color: Colors.white.withOpacity(.99),fontWeight: FontWeight.w600),
            cursorColor: Colors.white,
            obscureText: false,
                    validator: (String? value) => register.validatePassword(value!),
            keyboardType:
                 TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: Colors.white.withOpacity(.4),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: 'Password..',
              hintStyle:
                  TextStyle(fontSize: 16, color: Colors.white.withOpacity(.6)),
            ),
          ),
        ),
      ),
    );
  }


   Widget namefield({required size}) {
   
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          height: size.width / 6,
          width: size.width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            controller: register.namecontroller,
            style: TextStyle(color: Colors.white.withOpacity(.99),fontWeight: FontWeight.w600),
            cursorColor: Colors.white,
            obscureText: false,
                    validator: (String? value) => register.validatename(value!),
            keyboardType:
                 TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white.withOpacity(.4),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: 'name..',
              hintStyle:
                  TextStyle(fontSize: 16, color: Colors.white.withOpacity(.6)),
            ),
          ),
        ),
      ),
    );
  }



  Widget component2({required String string,required double width,}) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        
          child: Container(
            height: size.width / 8,
            width: size.width / width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              string,
              style: TextStyle(color: Colors.white.withOpacity(.8)),
            ),
          ),
        ),
      ),
    );
  }
}



class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}