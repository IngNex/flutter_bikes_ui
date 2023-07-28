import 'package:flutter/material.dart';
import 'package:flutter_bikes_ui/ui/screens/intro/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 650),
        pageBuilder: (context, animation, _) {
          return FadeTransition(opacity: animation, child: IntroScreen());
        },
      )),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: size.height * 0.38,
            child: Column(
              children: [
                TweenAnimationBuilder(
                    duration: const Duration(seconds: 1),
                    tween: Tween(begin: 0.0, end: 1.0),
                    curve: Curves.elasticOut,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        origin: Offset(0, 200 * value),
                        child: Container(
                          height: 180,
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
                          child: const Hero(
                            tag: 'logo',
                            child: Image(
                              image: AssetImage('assets/logo.png'),
                            ),
                          ),
                        ),
                      );
                    }),
                const SizedBox(height: 20),
                TweenAnimationBuilder(
                    duration: const Duration(seconds: 1),
                    tween: Tween(begin: 0.0, end: 1.0),
                    curve: Curves.elasticOut,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        origin: Offset(0, 200 * value),
                        child: const Text(
                          'BIKES',
                          style: TextStyle(
                              fontSize: 45,
                              letterSpacing: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    })
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
