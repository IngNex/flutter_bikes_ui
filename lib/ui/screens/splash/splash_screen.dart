import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: size.height * 0.35,
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 0.25,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  child: const Image(
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'BIKES',
                  style: TextStyle(
                      fontSize: 45,
                      letterSpacing: 10,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Text(
              '© byMaicolDev',
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 16, color: Colors.grey.withOpacity(0.8)),
            ),
          ),
        ],
      ),
    );
  }
}
