import 'package:flutter/material.dart';

class AudioTrackTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        "audioTrack.thumbnail",
        height: 60,
        width: 60,
        fit: BoxFit.cover,
      ),
      title: Text('Track Name'),
      subtitle: Text('Artist Name'),
      onTap: () {

      },
    );
  }
}
