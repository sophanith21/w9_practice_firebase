import 'package:w9_practice_firebase/model/artists/artist.dart';
import 'package:w9_practice_firebase/model/songs/song.dart';

class ArtistSong {
  final Artist artist;
  final Song song;

  const ArtistSong({required this.artist, required this.song});
}
