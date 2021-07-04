import 'package:clubhouseui/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfile(
      {Key? key,
      required this.imageUrl,
      required this.name,
      this.size= 48.0,
      this.isNew = false,
      this.isMuted= false,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              //height: 100,
              //padding: const EdgeInsets.all(6.0),
              child: UserProfleImage(imgUrl: imageUrl, size: size,)
            ),
            if(isNew)
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        //color: Colors.black,
                        offset: Offset(0,1),
                        blurRadius:2,
                      )
                    ]
                  ),
                  alignment: Alignment.center,
                  child: Text('🎉' , style: TextStyle(fontSize: 15.0),),
                )
              ),
            if(isMuted)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        //color: Colors.black,
                        offset: Offset(0,1),
                        //blurRadius:2,
                      )
                    ]
                  ),
                  alignment: Alignment.center,
                  child: Icon(CupertinoIcons.mic_slash_fill, size: 15,)
                )
              ),
          ],
        ),
        Flexible(child: Text(name,
        overflow: TextOverflow.ellipsis,
        )),
      ],
    );
  }
}
