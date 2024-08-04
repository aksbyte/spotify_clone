import 'package:spotify_clone/domain/enties/song/song.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsLoaded extends NewsSongsState {
  final List<SongEntity> songs;

  NewsSongsLoaded({required this.songs});
}
class NewsSongsFailure extends NewsSongsState {}
