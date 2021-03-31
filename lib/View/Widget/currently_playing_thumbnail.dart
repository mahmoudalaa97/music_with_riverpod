import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:music_with_riverpod/Services/providers.dart';
class CurrentlyPlayingThumbnail extends ConsumerWidget {
  final double height;
  final double width;

  const CurrentlyPlayingThumbnail({Key key, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentlyPlaying = watch(currentlyPlayingProvider);
    return currentlyPlaying.when(
        data: (audioTrackModel) => Image.network(
          audioTrackModel.thumbnail,
          fit: BoxFit.cover,
          height: height,
          width: width,
        ),
        loading: () => Container(),
        error: (_, __) => Container());
  }
}