import 'dart:math';

import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
    required this.bike,
    required this.color,
    required this.index,
  }) : super(key: key);

  final String bike;
  final Color color;
  final int index;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double value = 0.5;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List info = [
      [Icons.pedal_bike_rounded, "material", "aluminum"],
      [Icons.alarm_on, "year", "2021"],
      [Icons.lock, "weight", "12 Kg"],
      [Icons.filter_tilt_shift, "changes", "6"],
      [Icons.data_usage, "brakes", "iron"],
      [Icons.gps_fixed, "gps", "4.0"]
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, size: 30),
                  Text(
                    'Bike Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.shopping_cart_outlined, size: 30)
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 15,
                    right: 15,
                    child: FittedBox(
                      child: Text(
                        'BIKE',
                        style: TextStyle(color: Colors.grey.withOpacity(0.6)),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Hero(
                      tag: widget.index,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.0035)
                          ..rotateY(-pi * value + 1.5),
                        child: Image(
                          image: AssetImage(widget.bike),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -5,
                    child: GestureDetector(
                      onTap: () {
                        value = 0.5;
                        setState(() {});
                      },
                      child: Icon(
                        Icons.restart_alt_rounded,
                        color: widget.color,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -5,
                    child: GestureDetector(
                      onTap: () {
                        value = 0.25;
                        setState(() {});
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: widget.color,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -5,
                    child: GestureDetector(
                      onTap: () {
                        value = 0.75;
                        setState(() {});
                      },
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: widget.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.8,
                  child: Slider(
                    value: value,
                    min: 0.25,
                    max: 0.75,
                    thumbColor: widget.color,
                    activeColor: widget.color,
                    inactiveColor: widget.color,
                    onChanged: (val) {
                      value = val;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Pedal Titan',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '\$12,999.00',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: widget.color),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: widget.color.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.star),
                        SizedBox(width: 5),
                        Text(
                          '4.9',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: widget.color.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.remove, color: Colors.black),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '1',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.add, color: Colors.black),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: info.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          info[index][0],
                          color: widget.color,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          info[index][2],
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          info[index][1],
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: widget.color,
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 2,
                      color: Colors.grey,
                      offset: Offset(0, 3))
                ],
              ),
              child: const Text(
                'Add to cart',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
