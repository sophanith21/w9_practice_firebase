import 'package:w9_practice_firebase/data/repositories/artists/artist_repository.dart';
import 'package:w9_practice_firebase/data/repositories/songs/song_repository.dart';
import 'package:w9_practice_firebase/model/artists/artist.dart';
import 'package:w9_practice_firebase/model/artists/artist_song.dart';
import 'package:w9_practice_firebase/model/songs/song.dart';

class ArtistsSongsService {
  final SongRepository _songRepository;
  final ArtistRepository _artistRepository;

  ArtistsSongsService({
    required SongRepository songRepository,
    required ArtistRepository artistRepository,
  }) : _songRepository = songRepository,
       _artistRepository = artistRepository;

  Future<List<ArtistSong>> fetchArtistSong() async {
    List<Song> songs = await _songRepository.fetchSongs();
    Map<String, Artist> artistMap = {
      for (var artist in await _artistRepository.fetchArtists())
        artist.id: artist,
    };
    return [
      for (var song in songs)
        if (artistMap.containsKey(song.artistId))
          ArtistSong(artist: artistMap[song.artistId]!, song: song),
    ];
  }
}
