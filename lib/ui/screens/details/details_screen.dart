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
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back),
                Text(
                  'Bike Details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.shopping_cart_outlined)
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: FittedBox(
                    child: Text(
                      'BIKE',
                      style: TextStyle(color: Colors.grey.withOpacity(0.6)),
                    ),
                  ),
                ),
                Hero(
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
                Positioned(
                  bottom: -20,
                  child: GestureDetector(
                    onTap: () {
                      value = 0.5;
                      setState(() {});
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.restart_alt_outlined,
                          color: widget.color,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  value = 0.25;
                  setState(() {});
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: widget.color,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.6,
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
              GestureDetector(
                onTap: () {
                  value = 0.75;
                  setState(() {});
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: widget.color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
