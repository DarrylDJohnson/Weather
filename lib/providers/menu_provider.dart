import 'package:flutter/material.dart';
import 'package:weather_app/cubits/menu/menu_cubit.dart';
import 'package:weather_app/router.dart';
import 'package:weather_app/screens/components/menu.dart';

class MenuProvider extends StatefulWidget {
  @override
  _MenuProviderState createState() => _MenuProviderState();
}

class _MenuProviderState extends State<MenuProvider> {
  MenuCubit cubit;

  @override
  void initState() {
    cubit = MenuCubit();
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocConsumer(
        cubit: cubit,
        listener: (context, state) {
          if (state is MenuStateError) {
            SnackBar snackBar = SnackBar(content: Text("${state.error}"));
            Scaffold.of(context).showSnackBar(snackBar);
          } else if (state is MenuEvent) {
            Navigator.popAndPushNamed(
              context,
              weatherRoute,
              arguments: state.place,
            );
          }
        },
        builder: (context, state) {
          if (state is MenuStateLoading) {
            return LinearProgressIndicator();
          } else if (state is MenuStateMain) {
            return Menu(state.places);
          }

          throw () {};
        },
        buildWhen: (previous, current) =>
            current is MenuStateMain || current is MenuStateLoading,
      ),
    );
  }
}
