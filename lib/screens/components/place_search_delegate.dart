import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_app/models/place.dart';
import 'package:weather_app/services/places_service.dart';

class PlaceSearchDelegate extends SearchDelegate<Place> {
  PlacesService service;

  PlaceSearchDelegate(sessionToken)
      : this.service = PlacesService(sessionToken);

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          tooltip: 'Clear',
          icon: Icon(MdiIcons.close),
          onPressed: () => query = '',
        ),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        tooltip: 'Back',
        icon: Icon(MdiIcons.arrowLeft),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => null;

  @override
  Widget buildSuggestions(BuildContext context) => FutureBuilder(
        future: query == ''
            ? null
            : service.getSuggestions(
                query,
                Localizations.localeOf(context).languageCode,
              ),
        builder: (context, snapshot) {
          return query == ''
              ? LinearProgressIndicator()
              : snapshot.hasData
                  ? ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        title: Text(snapshot.data[index].toString()),
                        onTap: () async => close(
                          context,
                          await service
                              .locationFromId(snapshot.data[index].placeId),
                        ),
                      ),
                      itemCount: snapshot.data.length ?? 0,
                    )
                  : LinearProgressIndicator();
        },
      );
}
