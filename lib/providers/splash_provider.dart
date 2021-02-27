import 'package:flutter/material.dart';
import 'package:weather_app/cubits/splash/splash_cubit.dart';
import 'package:weather_app/router.dart';
import 'package:weather_app/screens/loading/loading_screen.dart';

class SplashProvider extends StatefulWidget {
  @override
  _SplashProviderState createState() => _SplashProviderState();
}

class _SplashProviderState extends State<SplashProvider> {
  SplashCubit cubit;

  @override
  void initState() {
    cubit = SplashCubit();
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => cubit,
        child: BlocListener(
          cubit: cubit,
          listener: (context, state) {
            if (state is SplashStateError) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error.toString())));
            }
            if (state is SplashStateLocation) {
              Navigator.popAndPushNamed(context, locationRoute);
            } else if (state is SplashStateWeather) {
              Navigator.popAndPushNamed(
                context,
                weatherRoute,
                arguments: state.place,
              );
            }
          },
          child: LoadingScreen(),
        ),
      ),
    );
  }
}
