import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w9_practice_firebase/data/repositories/artists/artist_repository.dart';
import 'package:w9_practice_firebase/ui/screens/artists/view_model/artists_view_model.dart';
import 'package:w9_practice_firebase/ui/screens/artists/widgets/artists_content.dart';

class ArtistsScreen extends StatelessWidget {
  const ArtistsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          ArtistsViewModel(artistRepository: context.read<ArtistRepository>()),
      child: Consumer<ArtistsViewModel>(
        builder: (context, value, child) => ArtistsContent(vm: value),
      ),
    );
  }
}
