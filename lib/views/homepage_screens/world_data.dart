import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:covid_19_tracker/utilities/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../controller/world_data_controller.dart';
import '../../utilities/widgets/animated_text1.dart';
import '../../utilities/widgets/formated_date.dart';
import '../../utilities/widgets/pie_chart.dart';

class WorldDataScreen extends StatelessWidget {
  const WorldDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var data=Get.put(GetworldInfoController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Scaffold(
      body:    Obx(()=>
       data.dataloading.value==false? SingleChildScrollView(
          child:
        
             Column(children: [
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
                                  Container(
                                      height: height * 0.25,
                                      width: width * 0.25,
                                      child: Image.asset(
                                        'lib/assets/myimages/population.png',
                                        fit: BoxFit.fill,
                                      )),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Total Polulation',
                                        style: GoogleFonts.lato(
                                          fontSize: width * 0.06,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      AnmatedText1(
                                          Size: width * 0.06,
                                          input:
                                              '${formattedNumber(number:data.population.toInt())}',
                                          color1: Colors.black)
                                    ],
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PieChartSample2(
                title2: ' total\n population',
                title1: ' total people \naffected',
                color1: Colors.blue,
                color2: Colors.red,
                value2: data.cases.toDouble(),
                value1: data.population.toDouble(),
              ),
              SizedBox(
                height: 20,
              ),
              containerdesign(
                  text1: 'Overall',
                  main: Color.fromARGB(255, 98, 198, 216),
                  context: context,
                  data1: data.cases.toInt(),
                  data2: data.todaycases.toInt(),
                  text2: 'today',
                  maintext: 'Cases',
                  
                  
                   radius: BorderRadius.only(
      
                     topLeft: Radius.circular(95)
      
      
                   )),
              SizedBox(
                height: 20,
              ),
              containerdesign(
                  text1: 'Overall',
                  main: Color.fromARGB(255, 235, 119, 110),
                  context: context,
                  data1: data.deaths.toInt(),
                  data2: data.todaydeaths.toInt(),
                  text2: 'today',
                  maintext: 'Deaths', radius: BorderRadius.only(
      
                     topRight: Radius.circular(95)
      
      
                   )),
                   SizedBox(
                height: 20,
              ),
              containerdesign(
                  text1: 'Overall',
                  main: Color.fromARGB(255, 183, 235, 135),
                  context: context,
                  data1: data.recovered.toInt(),
                  data2: data.todayrecovered.toInt(),
                  text2: 'today',
                  maintext: 'Recovered', radius: BorderRadius.only(
      
                     topLeft: Radius.circular(95)
      
      
                   )),
      
                   SizedBox(
                height: 20,
              ),
              containerdesign(
                  text1: 'active',
                  main: Color.fromARGB(255, 235, 126, 229),
                  context: context,
                  data1: data.active.toInt(),
                  data2: data.crtical.toInt(),
                  text2: 'Crtial',
                  maintext: 'Current', radius: BorderRadius.only(
      
                     topRight: Radius.circular(95)
      
      
                   )),
      
      
      
      
      
      
      
              SizedBox(
                height: 20,
              ),
            ])
            
          ):loader.laoder(context:context)
      )
      );
    
  }



  Widget containerdesign({
    required BuildContext context,
    required Color main,
    required String maintext,
    required String text1,
    required int data1,
    required String text2,
    required int data2,
    required BorderRadius radius,
  }) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
        height: height * 0.30,
        width: width * 0.9,
        decoration:
            BoxDecoration(color: main, borderRadius:radius),
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
                    borderRadius: BorderRadius.circular(30),


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
                    borderRadius: BorderRadius.circular(30),


                    ),
            
                  elevation: 55,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text2,
                          style: GoogleFonts.amarante(
                              fontWeight: FontWeight.w700,
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
}
