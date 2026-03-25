import 'package:flutter/material.dart';
import 'package:w9_practice_firebase/model/artists/artist_song.dart';
import 'package:w9_practice_firebase/services/artists_songs_service.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';
import '../../../utils/async_value.dart';

class LibraryViewModel extends ChangeNotifier {
  final ArtistsSongsService artistsSongsService;
  final PlayerState playerState;

  AsyncValue<List<ArtistSong>> artistSongValue = AsyncValue.loading();

  LibraryViewModel({
    required this.artistsSongsService,
    required this.playerState,
  }) {
    playerState.addListener(notifyListeners);

    // init
    _init();
  }

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() async {
    fetchSong();
  }

  void fetchSong() async {
    // 1- Loading state
    artistSongValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2- Fetch is successfull
      artistSongValue = AsyncValue.success(
        await artistsSongsService.fetchArtistSong(),
      );
    } catch (e) {
      // 3- Fetch is unsucessfull
      artistSongValue = AsyncValue.error(e);
    }
    notifyListeners();
  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();
}
