import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w9_practice_firebase/services/artists_songs_service.dart';

import '../../states/player_state.dart';
import 'view_model/library_view_model.dart';
import 'widgets/library_content.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LibraryViewModel(
        playerState: context.read<PlayerState>(),
        artistsSongsService: context.read<ArtistsSongsService>(),
      ),
      child: LibraryContent(),
    );
  }
}
