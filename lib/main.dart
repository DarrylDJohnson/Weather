import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/simple_bloc_observer.dart';
import 'providers/splash_provider.dart';
import 'router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dabble Weather',
      initialRoute: initialRoute,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRouter.generateRoute,
      theme: ThemeData(
        fontFamily: "Quicksand",
        accentColor: Colors.blue,
      ),
      home: SplashProvider(),
    );
  }
}
