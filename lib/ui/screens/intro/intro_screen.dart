import 'package:flutter/material.dart';
import 'package:flutter_bikes_ui/ui/screens/home/home_screen.dart';
import 'package:flutter_bikes_ui/ui/widgets/animation_scale_elastic.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/cycling.jpg'),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black45, Colors.black],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.18,
              child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 100,
                child: Hero(
                  tag: 'logo',
                  child: Image(
                    color: Colors.white,
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.16,
              child: const AnimationScaleElastic(
                child: Text(
                  'BIKES',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      letterSpacing: -5,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.05,
              child: AnimationScaleElastic(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 650),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 650),
                        pageBuilder: (context, animation, _) {
                          return FadeTransition(
                              opacity: animation, child: const HomeScreen());
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.orange.shade700,
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 8,
                              spreadRadius: 1,
                              color: Colors.black)
                        ],
                        borderRadius: BorderRadius.circular(30)),
                    child: const Text(
                      '> > >',
                      style: TextStyle(fontSize: 25, color: Colors.white),
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
