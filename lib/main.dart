import 'package:flutter/material.dart';
import 'package:untitled8/providers/great_places.dart';
import 'package:untitled8/screens/add_place_screen.dart';
import 'package:untitled8/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: GreatPlaces(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
            title: 'Great Places',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
                  .copyWith(secondary: Colors.amber),
            ),
            home: PlacesListScreen(),
            routes: {
              AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
            }));
  }
}
