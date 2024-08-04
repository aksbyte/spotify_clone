import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_news_songs.dart';
import 'package:spotify_clone/presentation/pages/home/bloc/news_songs_state.dart';
import 'package:spotify_clone/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();
    print("######################");
    print("{This is songs data : $returnedSongs}");

    returnedSongs.fold(
      (l) => emit(NewsSongsFailure()),
      (data) => emit(NewsSongsLoaded(songs: data)),
    );
  }
}
