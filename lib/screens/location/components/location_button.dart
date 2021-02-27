import 'package:flutter/material.dart';
import 'package:weather_app/cubits/location/location_cubit.dart';

class LocationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: StadiumBorder(),
      color: Colors.blue,
      child: ListTile(
        title: Text(
          "My Location",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        onTap: () => context.bloc<LocationCubit>().goToLocation(),
      ),
    );
  }
}
