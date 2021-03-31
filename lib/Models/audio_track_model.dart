class AudioTrackModel {
  final String artistName;
  final String trackName;
  final String audioUrl;
  final String thumbnail;

  AudioTrackModel(
      {this.artistName, this.trackName, this.audioUrl, this.thumbnail});

  bool get isEmpty =>
      this.artistName == null &&
          this.trackName == null &&
          this.audioUrl == null &&
          this.thumbnail == null;
}