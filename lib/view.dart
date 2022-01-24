import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:inout_training/locale_keys.dart';

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.login_email.tr(), style: Theme.of(context).textTheme.headline3,),
            Text(LocaleKeys.home_title.tr(), style: Theme.of(context).textTheme.headline3,),
            ElevatedButton(
              onPressed: () {
                if(context.locale.languageCode == 'ar'){
                  context.setLocale(Locale('en'));
                } else {
                  context.setLocale(Locale('ar'));
                }
              },
              child: Text(LocaleKeys.setting_change_language.tr(), style: Theme.of(context).textTheme.headline3,),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     context.setLocale(Locale('ar'));
            //   },
            //   child: Text('اللغه العربيه'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     context.setLocale(Locale('en'));
            //   },
            //   child: Text('English'),
            // ),
          ],
        ),
      ),
    );
  }
}
