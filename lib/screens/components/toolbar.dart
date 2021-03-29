import 'package:flutter/material.dart';

import 'menu.dart';
import 'search_button.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0.0,
      textTheme: Theme.of(context).textTheme,
      iconTheme: Theme.of(context).iconTheme,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => menu(context),
      ),
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.headline6,
          children: [
            TextSpan(
              text: "Dabble",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            TextSpan(
              text: "Weather",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      actions: [SearchButton()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
