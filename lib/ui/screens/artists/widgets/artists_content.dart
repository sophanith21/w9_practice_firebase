import 'package:flutter/material.dart';
import 'package:w9_practice_firebase/model/artists/artist.dart';
import 'package:w9_practice_firebase/ui/screens/artists/view_model/artists_view_model.dart';
import 'package:w9_practice_firebase/ui/theme/theme.dart';
import 'package:w9_practice_firebase/ui/utils/async_value.dart';
import 'package:w9_practice_firebase/ui/widgets/artist/artist_tile.dart';

class ArtistsContent extends StatelessWidget {
  final ArtistsViewModel vm;
  const ArtistsContent({super.key, required this.vm});
  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Artist>> artistsValue = vm.artistsValue;
    Widget content;
    switch (artistsValue.state) {
      case AsyncValueState.success:
        content = ListView.builder(
          itemCount: artistsValue.data!.length,
          itemBuilder: (context, index) {
            Artist artist = artistsValue.data![index];
            return ArtistTile(artist: artist);
          },
        );
      case AsyncValueState.loading:
        content = Center(child: CircularProgressIndicator());
      case AsyncValueState.error:
        content = Center(
          child: Text(
            'error = ${artistsValue.error!}',
            style: TextStyle(color: Colors.red),
          ),
        );
    }
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Artists", style: AppTextStyles.heading),
          SizedBox(height: 50),

          Expanded(child: content),
        ],
      ),
    );
  }
}
