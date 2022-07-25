import 'dart:async';

import 'package:covid_project/api_service.dart';
import 'package:covid_project/countries.dart';
import 'package:covid_project/world_status.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 5))
        ..repeat();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Get.to(()=>WorldStatus());

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(

            children: [
              AnimatedBuilder(
                child: SizedBox(
                   width: MediaQuery.of(context).size.width*0.6,
                   height: MediaQuery.of(context).size.height*0.5,


                  child:Image(image: AssetImage("images/virus.png")) ,),
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _controller.value * math.pi,
                      child: child,
                    );
                  }),
              Text("Covid 19 Tracker Application",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
