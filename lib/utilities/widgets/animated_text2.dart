import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedText2 extends StatelessWidget {
  const AnimatedText2({Key? key, required this.Text1, required this.Text2, required this.Size1, required this.Size2}) : super(key: key);

  final Text1;

  final Text2;

  final Size1;

  final Size2;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      isRepeatingAnimation: true,
          animatedTexts: [
            FadeAnimatedText(
            
              Text1,
              textStyle: GoogleFonts.amarante(
                fontSize: Size1,
                color: Color.fromARGB(255, 241, 199, 71),
                fontWeight: FontWeight.w600,
              ),
              duration: Duration(seconds: 5),

            ),
            ScaleAnimatedText(
              Text2,
              textAlign: TextAlign.center,
              textStyle: GoogleFonts.amarante(
                color: Color.fromARGB(255, 194, 247, 48),
                fontSize: Size2,
                fontWeight: FontWeight.w900,
                

              
              ),
               duration: Duration(seconds: 10),
            ),
          ],
        );
}
}