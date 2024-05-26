import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/quizLogo.png',
              width: 300,
              color: const Color.fromARGB(255, 169, 136, 210),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.actor(
                      textStyle: const TextStyle(color: Color.fromARGB(255, 176, 124, 240)),
                      fontSize: 20,
                    ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              onPressed: switchScreen,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.start),
              label: const Text("Start Quiz"))
        ],
      ),
    );
  }
}
