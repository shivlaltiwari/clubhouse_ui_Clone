import 'package:clubhouseui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  const RoomCard({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${room.club} 🏠".toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      letterSpacing: 1.0),
                ),
                Text(
                  room.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        //color: Colors.red,
                        height: 100.0,
                        child: Stack(
                          children: [
                            Positioned(
                                left: 28.0,
                                top: 20.0,
                                child: UserProfleImage(
                                  imgUrl: room.speakers[1].imageUrl,
                                  size: 48.0,
                                )),
                            UserProfleImage(
                              imgUrl: room.speakers[0].imageUrl,
                              size: 48.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map(
                              (e) => Text(
                                "${e.givenName}  ${e.familyName} 💬",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text:
                                      '${room.speakers.length + room.followedBySpeakers.length + room.others.length} '),
                                      WidgetSpan(child: Icon(CupertinoIcons.person_fill, size: 18.0, color: Colors.grey,) ),
                                      TextSpan(text: '/ ${room.speakers.length}'),
                                      WidgetSpan(child: Icon(CupertinoIcons.chat_bubble_fill, size: 18.0, color: Colors.grey,))
                            ]),
                            style: TextStyle(color: Colors.grey[600]),
                            )
                          ],
                        )),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
