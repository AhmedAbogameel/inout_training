import 'package:flutter/material.dart';

import 'controller.dart';

class View extends StatelessWidget {
  final Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    print('AAAAA');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: controller.streamController.stream,
              initialData: 0,
              builder: (context, snapshot) {
                print('aksnvkjnkas');
                // RX Dart
                if(!snapshot.hasData)
                  return Text('NoData');
                return Text(snapshot.data.toString(), style: Theme.of(context).textTheme.headline5,);
              },
            ),
            ElevatedButton(
              child: Text('Plus'),
              onPressed: controller.plus,
            ),
          ],
        ),
      ),
    );
  }
}
