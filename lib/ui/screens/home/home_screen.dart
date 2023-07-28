import 'package:flutter/material.dart';
import 'package:flutter_bikes_ui/ui/screens/details/details_screen.dart';
import 'package:flutter_bikes_ui/ui/widgets/animation_scale_elastic.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final iconBike = [
      'assets/icons/1.png',
      'assets/icons/2.png',
      'assets/icons/3.png',
      'assets/icons/4.png',
    ];
    final List<dynamic> bikes = [
      ['assets/bikes/1.png', Colors.blueAccent.shade700],
      ['assets/bikes/2.png', Colors.yellow.shade700],
      ['assets/bikes/3.png', Colors.purple.shade700],
      ['assets/bikes/4.png', Colors.orange.shade700],
      ['assets/bikes/5.png', Colors.cyanAccent.shade700],
      ['assets/bikes/6.png', Colors.red.shade700],
      ['assets/bikes/7.png', const Color.fromARGB(255, 42, 40, 40)],
      ['assets/bikes/8.png', Colors.indigo.shade900],
      ['assets/bikes/9.png', Colors.green.shade900],
      ['assets/bikes/10.png', const Color.fromARGB(255, 160, 95, 16)],
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Image(
                image: AssetImage('assets/bike.png'),
              ),
              Positioned(
                bottom: -2,
                child: Container(
                  width: size.width,
                  height: size.height * 0.4,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(0, 0, 0, 0),
                        Colors.white12,
                        Colors.white54,
                        Colors.white
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 50,
                left: 15,
                right: 15,
                child: AnimationScaleElastic(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                            width: 50,
                            color: Colors.white,
                            image: AssetImage('assets/logo.png'),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'BIKES',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                letterSpacing: -3,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            size: 30,
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image(
                              image: AssetImage('assets/ingnex.png'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.2,
                left: 0,
                right: 0,
                child: AnimationScaleElastic(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 120,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(36),
                            bottomRight: Radius.circular(36),
                          ),
                        ),
                        child: const Text(
                          'TREK FUEL EX',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 120,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(36),
                            bottomLeft: Radius.circular(36),
                          ),
                        ),
                        child: const Text(
                          '\$6,800',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Positioned(
              //   top: size.height * 0.2,
              //   right: 0,
              //   child:
              // ),
              Positioned(
                bottom: -50,
                left: 15,
                right: 15,
                child: AnimationScaleElastic(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      iconBike.length,
                      (index) => Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                              height: 60,
                              width: 60,
                              color: Colors.black,
                              image: AssetImage(iconBike[index])),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'News',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AnimationScaleElastic(
              child: ListView.builder(
                itemCount: bikes.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 40, left: 15, right: 40),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 3,
                              color: Colors.grey.shade300,
                            )
                          ]),
                      width: 180,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: -10,
                            right: -10,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade400,
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.pinkAccent,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 15,
                            child: Row(
                              children: [
                                Image(
                                    width: 35,
                                    image: AssetImage('assets/ingnex.png')),
                                Text(
                                  'TITAN',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                          const Positioned(
                            top: 60,
                            child: Text(
                              'Pedal Titan',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Positioned(
                            top: 75,
                            right: -40,
                            child: Hero(
                              tag: index,
                              child: Image(
                                width: 220,
                                image: AssetImage(bikes[index][0]),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 40,
                            left: 15,
                            right: 15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '\$12,999',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: bikes[index][1],
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -15,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 650),
                                    reverseTransitionDuration:
                                        const Duration(milliseconds: 650),
                                    pageBuilder: (context, animation, _) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: DetailsScreen(
                                          bike: bikes[index][0],
                                          color: bikes[index][1],
                                          index: index,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.amber.shade700,
                                        const Color.fromARGB(255, 161, 62, 8),
                                      ]),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(10),
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: const Row(
                                  children: [
                                    Text(
                                      'Explore',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
