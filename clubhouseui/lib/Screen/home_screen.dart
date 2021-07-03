import 'package:clubhouseui/data.dart';
import 'package:clubhouseui/widgets/upcomming_rooms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clubhouseui/widgets/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.search,
                size: 28.0,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.envelope_open,
                  size: 26.0,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.calendar,
                  size: 28.0,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.bell,
                  size: 28.0,
                )),
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
        body: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
              children: [
                Upcommingrooms(upcomingRooms: upcomingRoomsList),
                const SizedBox(
                  height: 12.0,
                ),
                ...roomsList.map((e) => RoomCard(room: e)),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.1),
                      Theme.of(context).scaffoldBackgroundColor,
                    ])),
              ),
            ),
            Positioned(
              bottom: 50,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: const Text.rich(TextSpan(children: [
                  WidgetSpan(
                      child: Icon(
                    CupertinoIcons.add,
                    size: 21.0,
                    color: Colors.white,
                  )),
                  TextSpan(
                      text: "  Start a room",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))
                ])),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.circle_grid_3x3_fill, size: 28.0,)),
                  Positioned(
                    bottom: 11.8,
                    right: 4.6,
                    child: Container(
                      height: 16.0,
                      width: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
