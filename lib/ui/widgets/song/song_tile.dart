import 'package:flutter/material.dart';
import 'package:w9_practice_firebase/model/artists/artist_song.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.artistSong,
    required this.isPlaying,
    required this.onTap,
  });

  final ArtistSong artistSong;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(artistSong.song.imageUrl.toString()),
          ),
          onTap: onTap,
          title: Text(artistSong.song.title),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              Text("${artistSong.song.duration.inMinutes} mins"),
              Text("${artistSong.artist.name} - ${artistSong.artist.genre}"),
            ],
          ),
          trailing: Text(
            isPlaying ? "Playing" : "",
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
