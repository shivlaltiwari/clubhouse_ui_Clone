
import 'package:clubhouseui/config/palette.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class Upcommingrooms extends StatelessWidget {
  final List<Room> upcomingRooms;
  const Upcommingrooms({Key? key, required this.upcomingRooms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Palette.secondaryBackground,
          borderRadius: BorderRadius.circular(20.0)),
      //height: 100.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: upcomingRooms
              .map((e) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                      Text(e.time),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${e.club}".toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .overline!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0),
                          ),
                          Text(e.name)
                        ],
                      )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
