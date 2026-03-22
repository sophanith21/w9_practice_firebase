import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:w9_practice_firebase/data/dtos/artist_dto.dart';
import 'package:w9_practice_firebase/data/repositories/artists/artist_repository.dart';
import 'package:w9_practice_firebase/model/artists/artist.dart';

class ArtistRepositoryFirebase implements ArtistRepository {
  final Uri artistUri = Uri.https(
    'fir-practice-dec8b-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/artists.json',
  );
  @override
  Future<Artist?> fetchArtistById(String id) {
    // TODO: implement fetchArtistById
    throw UnimplementedError();
  }

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistUri);
    if (response.statusCode == 200) {
      Map<String, dynamic> artists = jsonDecode(response.body);
      return [
        for (var artistId in artists.keys)
          ArtistDto.fromJson(artistId, artists[artistId]),
      ];
    } else {
      throw Exception("Failed to load artists");
    }
  }
}
