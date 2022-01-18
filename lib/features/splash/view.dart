import 'package:flutter/material.dart';
import 'package:inout_training/core/location_services/location_services.dart';
import 'package:inout_training/core/router/router.dart';
import 'package:inout_training/features/home/view.dart';
import 'package:inout_training/features/splash/units/location_denied_dialog.dart';
import 'package:inout_training/widgets/loading_indicator.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with WidgetsBindingObserver {

  AppLifecycleState previousState = AppLifecycleState.inactive;

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    getLocation();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed && previousState == AppLifecycleState.paused){
      MagicRouter.navigateAndPopAll(SplashView());
    }
    previousState = state;
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  void getLocation() async {
    await LocationServices.getCurrentLocation();
    if(LocationServices.currentPosition == null){
      showLocationDeniedDialog();
    }else{
      MagicRouter.navigateAndPopAll(HomeView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingIndicator(),
      ),
    );
  }
}
