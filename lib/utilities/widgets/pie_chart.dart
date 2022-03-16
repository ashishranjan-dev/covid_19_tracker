
import 'package:covid_19_tracker/utilities/widgets/formated_date.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class PieChartSample2 extends StatefulWidget {
    
 final String title1;
 final String title2;
 
final Color color1;
final Color color2;
 final double value1;
  final double value2;
 PieChartSample2({Key? key,required this.title1,required this.title2,required this.color1, required this.color2, required this.value1, required this.value2}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => PieChart2State(title1: title1, title2: title2,
   color1: color1, color2: color2, value1: value1, value2: value2, );
}

class PieChart2State extends State {


  PieChart2State({
    required this.title1,
    required this.title2,
    required this.color1,
  required this.color2,
  required this.value1,
  required this.value2,
   
  });

final Color color1;
final Color color2;
 final double value1;
  final double value2;

  final String title1;
  final String title2;
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
     Size size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Card(
          shape:OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), 
              borderSide: BorderSide(color: Colors.white)
          ),
          elevation: 85,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                        pieTouchData: PieTouchData(touchCallback:
                            (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        }),
                        borderData: FlBorderData(
                          show: false,
                        ),
                       
                        centerSpaceRadius: size.width*0.12,
                        sections: showingSections(color1: color1, color2: color2, value1: value1, value2: value2)),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[


                   




                  Indicator(
                    color: Color.fromARGB(255, 238, 57, 2),
                    text: title1,
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: Color.fromARGB(255, 43, 124, 230),
                    text: title2,
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                
                ],
              ),
              const SizedBox(
                width: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections({required Color color1,
  required Color color2,
  required double value1,
  required double value2,
  
  
  }) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: color1,
            value: value1,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: color2,
            value: value2,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        /* case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 35,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          ); */
        default:
          throw Error();
      }
    });
  }
}


class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}