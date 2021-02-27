import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/place.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/shared_pref.dart';

import 'location_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationService service;

  LocationCubit()
      : this.service = LocationService(),
        super(LocationStateLoading());

  init() {
    emit(LocationStateMain());
  }

  goToLocation([Place place]) async {
    try {
      if (place == null)
        emit(LocationEvent(await service.currentLocation));
      else
        emit(LocationEvent(place));
    } catch (e) {
      emit(LocationStateError(e));
    }
  }
}
