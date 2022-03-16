import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnmatedText1 extends StatelessWidget {
  const AnmatedText1({Key? key, this.input, this.Size, required this.color1}) : super(key: key);
  final input;
  final Size;
  final Color color1;

  @override
  Widget build(BuildContext context) {
    return  AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              input,
              speed: Duration(milliseconds: 500),
              textStyle:GoogleFonts.abhayaLibre(
                          fontSize: Size,
                          color:color1,
                          fontWeight: FontWeight.w600,
                          
                        )
            ),
          ],
          isRepeatingAnimation: true,
          repeatForever: true,
          displayFullTextOnTap: true,
          stopPauseOnTap: false,
        );
  }
}