import 'package:flutter/material.dart';
import 'package:w9_practice_firebase/data/repositories/artists/artist_repository.dart';
import 'package:w9_practice_firebase/model/artists/artist.dart';
import 'package:w9_practice_firebase/ui/utils/async_value.dart';

class ArtistsViewModel extends ChangeNotifier {
  final ArtistRepository _artistRepository;
  ArtistsViewModel({required ArtistRepository artistRepository})
    : _artistRepository = artistRepository {
    _init();
  }

  AsyncValue<List<Artist>> artistsValue = AsyncValue.loading();

  void _init() {
    fetchArtists();
  }

  void fetchArtists() async {
    try {
      artistsValue = AsyncValue.success(await _artistRepository.fetchArtists());
    } catch (err) {
      artistsValue = AsyncValue.error(err);
    } finally {
      notifyListeners();
    }
  }
}
