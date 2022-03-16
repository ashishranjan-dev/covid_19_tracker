import 'dart:async';
import 'dart:ui';

import 'package:covid_19_tracker/services/auth_controller.dart';
import 'package:covid_19_tracker/views/authscreens/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'consts.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  AnimationController? controller1;
  AnimationController? controller2;
  Animation<double>? animation1;
  Animation<double>? animation2;
  Animation<double>? animation3;
  Animation<double>? animation4;




  @override
  void initState() {




    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 8,
      ),
    );
    animation1 = Tween<double>(begin: .18, end: .43).animate(
      CurvedAnimation(parent: controller1!, curve: Curves.decelerate),
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
    animation2 = Tween<double>(begin: .6, end: .25).animate(
      CurvedAnimation(parent: controller1!, curve: Curves.fastOutSlowIn),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 8,
      ),
    );
    animation3 = Tween<double>(begin: .9, end: .1).animate(
        CurvedAnimation(parent: controller2!, curve: Curves.decelerate))
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
    animation4 = Tween<double>(begin: 170, end: 90).animate(
      CurvedAnimation(
        parent: controller2!,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller1!.forward();

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
    var opacity = animation2!.value;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.mainColor,
              AppColors.mainColor.withOpacity(.8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            _buildHeader(),
            Align(
              child: Container(
                padding: EdgeInsets.only(top: size.height*0.1),
                height: MediaQuery.of(context).size.height *
                    .80 *
                    animation3!.value,
                width: MediaQuery.of(context).size.width * .93,
                child: Image.asset("lib/assets/auth/virus.png"),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .25,
              right: 25,
              child: Container(
                width:
                    MediaQuery.of(context).size.width * 1.3 * animation1!.value,
                child: Image.asset("lib/assets/auth/person.png"),
              ),
            ),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset(
          "lib/assets/auth/logo.png",
          opacity: animation3,
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Positioned(
      bottom: 50,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           
            GestureDetector(
              onTap: () {

                Get.to(()=>LoginScreen(),transition: Transition.rightToLeftWithFade,duration:Duration(seconds: 2),);



              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 47, 103, 131),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(66, 87, 52, 245),
                      offset: Offset(1, 1),
                      spreadRadius: 1,
                      blurRadius: 3,
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width * .85,
                height: 60,
                child: Center(
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
