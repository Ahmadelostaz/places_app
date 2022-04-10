import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Location_screen extends StatefulWidget {



  @override
  State<Location_screen> createState() => _Location_screenState();
}

class _Location_screenState extends State<Location_screen> {

 String _placePic;
 Future<void> get_Location() async{
   final locationData = await Location().getLocation();
   print('${locationData.altitude}''/n ${locationData.longitude}');
 }
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Container(alignment: Alignment.center,

            height: 330,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child:_placePic == null
                ? const Center(
                    child: Text('no pic add',textAlign: TextAlign.center,),
                  )
                : Image.network(
                    _placePic,
                    fit: BoxFit.cover,
              width: double.infinity,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  icon: const Icon(Icons.location_on),
                  onPressed: get_Location,
                  label:  const Text('current location',),
              ),
              TextButton.icon(
                  icon: const Icon(Icons.map),
                  onPressed: () => {},
                  label: const Text('select Map'))
            ],
          )
        ],
      )
    ;
  }
}
