import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story/common/widgets/empty/empty_widget.dart';
import 'package:story/common/widgets/loading/loading_component.dart';
import 'package:story/core/di/di.dart';
import 'package:story/features/movie/cubit/movie_cubit.dart';
import 'package:story/features/movie/cubit/movie_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieHistoryPage extends StatelessWidget {
  const MovieHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);

    final MovieCubit movieCubit = getIt.get();
    return Scaffold(
      // appBar: AppBar(title: Text('Lịch sử xem')),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              if (state.movieHistory.isNotEmpty) {
                return GridView.builder(
                  padding: EdgeInsets.only(bottom: 90),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.43,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        movieCubit.playMovie(
                          movie: state.movieHistory[index],
                          context: context,
                        );
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      state.movieHistory[index].fullThumbUrl,
                                  errorWidget:
                                      (context, url, error) =>
                                          Center(child: Icon(Icons.warning)),
                                  placeholder:
                                      (context, url) => Container(
                                        color: Colors.transparent,
                                        alignment: Alignment.center,
                                        child: LoadingComponent(),
                                      ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              // width: ScreenUtil().screenWidth / 2 - 11,
                              child: Text(
                                state.movieHistory[index].name ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },

                  itemCount: state.movieHistory.length,
                );
              } else {
                return Center(
                  child: EmptyWidget(content: language!.noDataAvailable),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
