import 'package:blogspot/src/constants/app.strings.dart';
import 'package:blogspot/src/constants/app.theme.dart';
import 'package:blogspot/src/services/app.service.dart';
import 'package:blogspot/src/views/dashboard/dashboard.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:blogspot/src/services/router.service.dart' as router;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppService().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      onGenerateRoute: router.generateRoute,
      // initialRoute: _startRoute,
      home: const Dashboard(),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: AppTheme.lightTheme(),
    );
  }
}
