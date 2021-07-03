import 'package:flutter/material.dart';

class UserProfleImage extends StatelessWidget {
  final String imgUrl;
  final double size;

  const UserProfleImage({Key? key, required this.imgUrl, this.size = 48.0,});
     
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:BorderRadius.circular(25.0),
      child: Image.network(
        imgUrl,
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),

    );
  }
}
