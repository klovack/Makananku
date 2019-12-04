import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  final String imageURL;
  final String title;

  Thumbnail({@required this.imageURL, @required this.title});

  @override
  Widget build(BuildContext context) {
    return // Thumbnail
        Stack(
      children: <Widget>[
        // Recipe Image
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Image.network(
            imageURL,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
            // color: Colors.white54,
            // colorBlendMode: BlendMode.lighten,
          ),
        ),

        // Recipe name
        Positioned(
          top: 24,
          left: 24,
          child: Container(
            constraints: BoxConstraints(maxWidth: 250),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white60,
              backgroundBlendMode: BlendMode.lighten,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.title,
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        )
      ],
    );
    // End Thumbnail
  }
}
