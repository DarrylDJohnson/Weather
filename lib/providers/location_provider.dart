import 'package:flutter/material.dart';
import 'package:weather_app/cubits/location/location_cubit.dart';
import 'package:weather_app/router.dart';
import 'package:weather_app/screens/components/double_press_to_exit.dart';
import 'package:weather_app/screens/loading/loading_screen.dart';
import 'package:weather_app/screens/location/location_screen.dart';

class LocationProvider extends StatefulWidget {
  @override
  _LocationProviderState createState() => _LocationProviderState();
}

class _LocationProviderState extends State<LocationProvider> {
  LocationCubit cubit;

  @override
  void initState() {
    cubit = LocationCubit();
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DoublePressToExit(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => cubit,
          child: BlocConsumer(
            cubit: cubit,
            listener: (context, state) {
              if (state is LocationStateError) {
                SnackBar snackBar = SnackBar(content: Text("${state.error}"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else if (state is LocationEvent) {
                Navigator.popAndPushNamed(
                  context,
                  weatherRoute,
                  arguments: state.place,
                );
              }
            },
            builder: (context, state) {
              if (state is LocationStateLoading) {
                return LoadingScreen();
              } else if (state is LocationStateMain) {
                return LocationScreen();
              }

              throw () {};
            },
            buildWhen: (previous, current) =>
                current is LocationStateMain || current is LocationStateLoading,
          ),
        ),
      ),
    );
  }
}
