import 'package:flutter/material.dart';

class FavoriteToggleIcon extends StatelessWidget {
   FavoriteToggleIcon({Key? key}) : super(key: key);
  bool favorite=false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [ GestureDetector(
            onTap:(){},
            child: Icon(
              favorite ?Icons.favorite_border: Icons.favorite  ,
              color:favorite ? Colors.red : Colors.red,
              size: 30,
          ),
        )
        ],
      ),
    );
  }
}
