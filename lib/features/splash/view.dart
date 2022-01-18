import 'package:flutter/material.dart';
import 'package:inout_training/core/location_services/location_services.dart';
import 'package:inout_training/core/router/router.dart';
import 'package:inout_training/features/home/view.dart';
import 'package:inout_training/features/splash/units/location_denied_dialog.dart';

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
    if(LocationServices.currentPosition == null){
      showLocationDeniedDialog();
    }else{
      MagicRouter.navigateAndPopAll(HomeView());
    }
    /*
    - User denied location permission
    - Connection Error
    - Get Location by city name
    - Unknown Location (Search)
     */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Get My Location'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Get Location By City name'),
            ),
          ],
        ),
      ),
    );
  }
}
