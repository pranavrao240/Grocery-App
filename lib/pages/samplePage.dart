import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  @override
  _IconExampleState createState() => _IconExampleState();
}

class _IconExampleState extends State<SamplePage> {
  bool isLiked = false;
  bool isDisliked = false;
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              isLiked ? Icons.thumb_up : Icons.thumb_up_off_alt,
              color: isLiked ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isLiked = !isLiked;
                if (isLiked)
                  isDisliked = false; // Ensure dislike is off when like is on
              });
            },
          ),
          IconButton(
            icon: Icon(
              isDisliked ? Icons.thumb_down : Icons.thumb_down_off_alt,
              color: isDisliked ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isDisliked = !isDisliked;
                if (isDisliked)
                  isLiked = false; // Ensure like is off when dislike is on
              });
            },
          ),
          IconButton(
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: isFavorited ? Colors.pink : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isFavorited = !isFavorited;
              });
            },
          ),
        ],
      ),
    );
  }
}
