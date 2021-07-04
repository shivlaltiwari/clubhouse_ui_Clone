import 'dart:math';

import 'package:clubhouseui/widgets/user_profile_image.dart';
import 'package:clubhouseui/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class RoomScreen extends StatelessWidget {
  final Room room;
  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leadingWidth: 200.0,
        leading: TextButton.icon(
            style: TextButton.styleFrom(primary: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.chevron_down),
            label: Text(
              "All Room",
              style: TextStyle(fontSize: 15.0),
            )),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.doc,
              size: 28,
            ),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 12, top: 12, bottom: 10),
              child: UserProfleImage(
                imgUrl: currentUser.imageUrl,
                size: 32,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${room.club} 🏠".toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            letterSpacing: 1.0),
                      ),
                      GestureDetector(
                          onTap: () {}, child: Icon(CupertinoIcons.ellipsis))
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  )
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                children: [
                  ...room.speakers
                      .map(
                        (e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          name: e.givenName,
                          size: 66.0,
                          isNew: Random().nextBool(),
                          isMuted: Random().nextBool(),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Followed by speaker",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.grey[400], fontWeight: FontWeight.bold),
              ),
            )),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
                children: [
                  ...room.followedBySpeakers
                      .map(
                        (e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          name: e.givenName,
                          size: 66.0,
                          isNew: Random().nextBool(),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Others in Room",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.grey[400], fontWeight: FontWeight.bold),
              ),
            )),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
                children: [
                  ...room.others
                      .map(
                        (e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          name: e.givenName,
                          size: 66.0,
                          isNew: Random().nextBool(),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
            SliverPadding(padding: const EdgeInsets.only(bottom: 100))
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12.0,
        ),
        height: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: const Text.rich(TextSpan(children: [
                  TextSpan(text: '✌🏽', style: TextStyle(fontSize: 20.0)),
                  TextSpan(
                      text: 'Leave quietly',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0))
                ])),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300]
                    ),
                    child: Icon(CupertinoIcons.add, size: 25,),
                  ),
                ),
                SizedBox(width: 16,),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300]
                    ),
                    child: Icon(CupertinoIcons.hand_raised, size: 25,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
