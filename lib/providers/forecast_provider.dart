import 'package:flutter/material.dart';
import 'package:weather_app/cubits/forecast/forecast_cubit.dart';
import 'package:weather_app/cubits/location/location_cubit.dart';
import 'package:weather_app/models/place.dart';
import 'package:weather_app/screens/components/double_press_to_exit.dart';
import 'package:weather_app/screens/loading/loading_screen.dart';

import '../screens/forecast/forecast_screen.dart';

class ForecastProvider extends StatefulWidget {
  final Place place;

  const ForecastProvider(
    this.place, {
    Key key,
  }) : super(key: key);

  @override
  _ForecastProviderState createState() => _ForecastProviderState();
}

class _ForecastProviderState extends State<ForecastProvider> {
  ForecastCubit cubit;

  @override
  void initState() {
    cubit = ForecastCubit(widget.place);
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
            listener: (BuildContext context, state) {
              if (state is ForecastStateError) {
                SnackBar snackBar = SnackBar(
                  content: Text("Error : ${state.error}"),
                );

                Scaffold.of(context).showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
              if (state is ForecastStateSuccess) {
                return ForecastScreen(state.forecast);
              } else if (state is ForecastStateLoading) {
                return LoadingScreen();
              }
              throw () {};
            },
            buildWhen: (previous, current) =>
                current is ForecastStateSuccess ||
                current is ForecastStateLoading,
          ),
        ),
      ),
    );
  }
}
