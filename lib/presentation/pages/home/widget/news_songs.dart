import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/configs/constant/app_url.dart';
import 'package:spotify_clone/domain/enties/song/song.dart';
import 'package:spotify_clone/presentation/pages/home/bloc/news_songs_cubit.dart';
import 'package:spotify_clone/presentation/pages/home/bloc/news_songs_state.dart';

import '../../../../common/common_import.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state is NewsSongsLoaded) {
              return _songsList(state.songs);
            }
            return const Center(child: Text('Something went wrong'));
          },
        ),
      ),
    );
  }

  Widget _songsList(List<SongEntity> songs) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return SizedBox(
            height: 160,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            '${AppUrl.fireStorage}${songs[index].artist} - ${songs[index].title}.jpg?${AppUrl.mediaAlt}'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 14,
            ),
        itemCount: songs.length);
  }
}
