import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uuid/uuid.dart';
import 'package:weather_app/models/place.dart';
import 'package:weather_app/router.dart';
import 'package:weather_app/screens/components/place_search_delegate.dart';

class SearchButton extends StatelessWidget {
  _search(BuildContext context) async {
    final sessionToken = Uuid().v4();
    final Place result = await showSearch(
      context: context,
      delegate: PlaceSearchDelegate(sessionToken),
    );

    if (result != null && result.isValid())
      Navigator.popAndPushNamed(context, weatherRoute, arguments: result);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: SvgPicture.asset("assets/icons/search.svg"),
      onPressed: () => _search(context),
    );
  }
}
