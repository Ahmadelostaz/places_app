import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
            ),
          ],
        ),
        body: FutureBuilder(
            future: Provider.of<GreatPlaces>(context, listen: false)
                .fetchAndSetPlaces(),
            builder: (ctx, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? const Center(
                  child:  CircularProgressIndicator(
              backgroundColor: Colors.red,
              color: Colors.blue,
            ),
                )
                : Consumer<GreatPlaces>(
                    child: const Center(child: Text('no place')),
                    builder: (ctx, places, ch) => places.items.isEmpty
                        ? ch
                        : ListView.builder(
                            itemCount: places.items.length,
                            itemBuilder: (ctx, index) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        FileImage(places.items[index].image),
                                  ),
                                  title: Text(places.items[index].title),
                                  onTap: () => {},
                                )),
                  )));
  }
}
