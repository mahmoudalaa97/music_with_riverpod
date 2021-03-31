import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_with_riverpod/Services/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Widget/mini_player_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ Color(0xff051937).withOpacity(0.8),Color(0xFf5EB719)],
               stops: [0.3,1.0],
                transform: GradientRotation(3),
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.mirror)),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                'My Awesome Playlist',
                style: GoogleFonts.barlow(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              centerTitle: true,
            ),
            const PlaylistWidget()
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(child: MiniPlayerWidget()),
    );
  }
}

class AudioTrackTile extends StatelessWidget {
  final int trackIndex;

  const AudioTrackTile({Key key, this.trackIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioTrack = context.read(playlistProvider)[trackIndex];
    final audioPlayer = context.read(audioPlayerProvider);
    return (audioTrack!=null&&audioPlayer!=null)?ListTile(
      leading: Image.network(
        audioTrack.thumbnail,
        height: 60,
        width: 60,
        fit: BoxFit.cover,
      ),
      title: Text(audioTrack.trackName),
      subtitle: Text(audioTrack.artistName),
      onTap: () {

        audioPlayer.playlistPlayAtIndex(trackIndex);
      },
    ):Container();
  }
}

class PlaylistWidget extends ConsumerWidget {
  const PlaylistWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final playlist = watch(playlistProvider);
    return playlist!=null?SliverList(
      delegate: SliverChildListDelegate(playlist
          .asMap()
          .entries
          .map((entry) => AudioTrackTile(
        trackIndex: entry.key,
      ))
          .toList()),
    ):Center(child: CircularProgressIndicator(),);
  }
}