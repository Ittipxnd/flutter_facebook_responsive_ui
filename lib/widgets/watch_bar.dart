import 'package:flutter/material.dart';

class WatchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(width: 15.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.grey[300]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.videocam, size: 20.0),
                SizedBox(width: 5.0),
                Text('Live', style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
          SizedBox(width: 10.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.grey[300]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.music_note, size: 20.0),
                SizedBox(width: 5.0),
                Text('Music', style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
          SizedBox(width: 10.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.grey[300]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.check_box, size: 20.0),
                SizedBox(width: 5.0),
                Text('Following', style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
          SizedBox(width: 10.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.grey[300]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.fastfood, size: 20.0),
                SizedBox(width: 5.0),
                Text('Food', style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
          SizedBox(width: 10.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.grey[300]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.gamepad, size: 20.0),
                SizedBox(width: 5.0),
                Text('Gaming', style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
