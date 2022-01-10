import 'package:flutter/material.dart';
import 'package:inout_training/core/location_services/location_services.dart';
import 'package:inout_training/core/router/router.dart';
import 'package:inout_training/features/home/view.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    await LocationServices.getCurrentLocation();
    MagicRouter.navigateAndPopAll(HomeView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.stream, size: 50,),
      ),
    );
  }
}
