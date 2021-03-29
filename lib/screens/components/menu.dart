import 'package:flutter/material.dart';
import 'package:weather_app/cubits/menu/menu_cubit.dart';
import 'package:weather_app/models/place.dart';
import 'package:weather_app/providers/menu_provider.dart';

menu(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8.0),
      ),
    ),
    builder: (context) {
      return MenuProvider(scaffoldContext: context);
    },
  );
}

class Menu extends StatelessWidget {
  final List<Place> places;

  const Menu(this.places);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          leading: Icon(Icons.history),
          title: Text(
            "Recently Viewed",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          reverse: true,
          itemBuilder: (context, index) => ListTile(
            leading: Icon(null),
            title: Text("${places[index].name}"),
            subtitle: () {
              if (places[index].description != null)
                return Text("${places[index].description}");
            }(),
            onTap: () => context.bloc<MenuCubit>().goToLocation(places[index]),
          ),
          itemCount: places.length,
        ),
        Divider(thickness: 1.5),
        ListTile(
            leading: Icon(Icons.location_on),
            title: Text(
              "My Location",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            onTap: () => context.bloc<MenuCubit>().goToLocation()),
      ],
    );
  }
}
