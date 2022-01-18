import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:inout_training/core/router/router.dart';
import 'package:inout_training/features/search/view.dart';

showLocationDeniedDialog() => showDialog(
      context: MagicRouter.currentContext,
      builder: (context) => _Dialog(),
    );

class _Dialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Unable to get current location',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Please make sure your location service is enabled and app has a permission.',
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              child: Text('Open Setting'),
              onPressed: () async {
                await Geolocator.openAppSettings();
              },
            ),
            ElevatedButton(
              onPressed: () => MagicRouter.navigateAndPopAll(SearchView()),
              child: Text('Search By City name'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Pick location from Google maps'),
            ),
          ],
        ),
      ),
    );
  }
}
