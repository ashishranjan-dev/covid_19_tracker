import 'dart:core';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilities/widgets/animated_text1.dart';
import '../../utilities/widgets/formated_date.dart';
import '../../utilities/widgets/pie_chart.dart';

class StatedetailScreen extends StatefulWidget {
    String active,confirmed,deaths,deltaconfirmed,dealtadeaths,deltarecovered,recovered,state;
  

  StatedetailScreen({

    required this.active,

        required this.confirmed,
            required this.deaths,
                required this.deltaconfirmed,
                    required this.dealtadeaths,
                        required this.deltarecovered,
                            required this.recovered,

                                required this.state,
  
  });

  @override
  _StatedetailScreenState createState() => _StatedetailScreenState();
}

class _StatedetailScreenState extends State<StatedetailScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          height: height * 0.55,
          width: width,
          child: Card(
             color: Color.fromARGB(255, 158, 239, 241).withOpacity(0.7),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            elevation: 30,
            child: Stack(
              children: [
                Positioned(
                    top: height * 0.10,
                    left: width * 0.095,
                    child: Text(
                      widget.state,
                      style: TextStyle(
                          fontSize: width * 0.07, fontWeight: FontWeight.w700),
                    )),
                Positioned(
                  top: height * 0.20,
                  left: width * 0.075,
                  child: Container(
                    height: height * 0.30,
                    width: width * 0.85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          
                                Text(
                                  'Total active cases',
                                  style: GoogleFonts.lato(
                                    fontSize: width * 0.06,
                                    fontWeight: FontWeight.w500,
                                  ),),

                                 AnmatedText1(
                                    Size: width * 0.06,
                                    input:
                                        '${widget.active}',
                                    color1: Colors.black),
                          
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        PieChartSample2(
          title2: ' total cases',
          title1: ' total deaths',
          color1: Colors.blue,
          color2: Colors.red,
          value2: double.parse(widget.deaths),
          value1:  double.parse(widget.confirmed),
        ),
        SizedBox(
          height: 10,
        ),
        /*    containerdesign(
                text1: 'Overall',
                main: Color.fromARGB(255, 98, 198, 216),
                context: context,
                data1: widget.totalCases.toInt(),
                data2: widget.todaycases.toInt(),
                text2: 'today',
                maintext: 'Cases'),
            SizedBox(
              height: 10,
            ),*/
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [

            Datacard(
            main: Color.fromARGB(255, 191, 29, 219),
            maintext: 'confirmed',
            data1: widget.confirmed
            
            ),
          

           Datacard(
            main: Color.fromRGBO(245, 10, 41, 1),
            maintext: 'Deaths',
            data1: widget.deaths,
          ),
         ],
       ),
        SizedBox(
          height: 15,
        ),

       Column(


         children: [



            Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [

            Datacard(
            main: Color.fromARGB(255, 10, 160, 219),
            maintext: 'Dealta\nconfirmed',
            data1: widget.deltaconfirmed
          ),

           Datacard(
            main: Color.fromRGBO(245, 10, 41, 1),
            maintext: 'Dealta\nDeaths',
            data1: widget.dealtadeaths,
          ),

        
         ],
       ),





         ],
       ),

       SizedBox(
          height: 15,
        ),

       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [

              Datacard(
            main: Color.fromARGB(255, 37, 74, 236),
            maintext: 'active',
            data1: widget.active,
          ),

            Datacard(
            main: Color.fromARGB(255, 31, 122, 3),
            maintext: 'recoverd',
            data1: widget.recovered,
          ),

          
         ],
       ),

       
       SizedBox(
          height: 25,
        ),






      ])),
    );
  }

  /*  Widget containerdesign({
    required BuildContext context,
    required Color main,
    required String maintext,
    required String text1,
    required int data1,
    required String text2,
    required int data2,
  }) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
        height: height * 0.30,
        width: width * 0.9,
        decoration:
            BoxDecoration(color: main, borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Column(
          children: [
            Text(
              maintext,
              style: GoogleFonts.amarante(
                  fontWeight: FontWeight.w900, fontSize: width * 0.06),
            ),
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: height * 0.20,
                width: width * 0.37,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 75,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text1,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w700,
                              fontSize: width * 0.06),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        AnmatedText1(
                          Size: width * 0.06,
                          input: '${formattedNumber(number: data1)}',
                          color1: main,
                        )
                      ]),
                ),
              ),
              SizedBox(
                width: width * 0.06,
              ),
              Container(
                height: height * 0.20,
                width: width * 0.37,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 55,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text2,
                          style: GoogleFonts.amarante(
                              fontWeight: FontWeight.w900,
                              fontSize: width * 0.06),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        AnmatedText1(
                          Size: width * 0.06,
                          input: '${formattedNumber(number: data2)}',
                          color1: main,
                        )
                      ]),
                ),
              ),
            ]),
          ],
        ));
  }
 */

  Widget Datacard({
    required Color main,
    required String maintext,
    required String data1,
  
  }) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 10,
      child: Container(
        height: height * 0.2,
        width: width * 0.43,
        color: main.withOpacity(0.2),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,

       children: [
         

          Text(maintext,style: GoogleFonts.manrope(fontSize: width*0.05,
            color: main,
            fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 12,),

          Text( data1,style: GoogleFonts.manrope(fontSize: width*0.07,
            color: main,
            fontWeight: FontWeight.w800
            ),)
        ]),
      ),
    );
  }
}
