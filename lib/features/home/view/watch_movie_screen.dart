import 'dart:async';

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:story/common/domain/entities/response/movie_data.dart';
import 'package:story/core/di/di.dart';
import 'package:story/features/movie/cubit/movie_cubit.dart';
import 'package:story/features/movie/cubit/movie_state.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WatchMovieScreen extends StatefulWidget {
  const WatchMovieScreen({super.key, required this.movie});
  final Movie movie;

  @override
  State<WatchMovieScreen> createState() => _WatchMovieScreenState();
}

class _WatchMovieScreenState extends State<WatchMovieScreen> {
  final MovieCubit movieCubit = getIt.get();
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  int currentIndex = 0;
  bool _hasCalledVideoEnd = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    await movieCubit.getMovieInfo(widget.movie.slug ?? "");
    setVideoPlayerController(
      linkVideo:
          movieCubit
              .state
              .movieInfo
              ?.episodes!
              .last
              .serverData?[widget.movie.episodeCurrentlyWatching]
              .linkM3U8 ??
          '',
      index: widget.movie.episodeCurrentlyWatching,
    );
  }

  void _videoListener() {
    final controller = _videoPlayerController;
    if (controller == null || !controller.value.isInitialized) return;

    final position = controller.value.position;
    final duration = controller.value.duration;

    if (duration > Duration.zero &&
        !controller.value.isPlaying &&
        (duration - position).inMilliseconds.abs() < 500 &&
        !_hasCalledVideoEnd) {
      _hasCalledVideoEnd = true;
      print('🎬 Video kết thúc!');
      _onVideoEnd();
    }
  }

  Future<void> setVideoPlayerController({
    required String linkVideo,
    required int index,
    bool isStart = false,
  }) async {
    timer?.cancel();
    // Thoát fullscreen nếu đang bật
    if (_chewieController?.isFullScreen == true) {
      _chewieController?.exitFullScreen();
      await Future.delayed(const Duration(milliseconds: 500));
    }

    setState(() {
      _chewieController = null;
    });

    _hasCalledVideoEnd = false; // ← reset tại đây!
    currentIndex = index;

    _videoPlayerController?.removeListener(_videoListener);
    _videoPlayerController?.pause();
    await _videoPlayerController?.dispose();
    _chewieController?.dispose();

    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(linkVideo),
    );

    await _videoPlayerController?.initialize();
    _videoPlayerController?.addListener(_videoListener);

    await _videoPlayerController?.setLooping(false);
    await _videoPlayerController?.setVolume(1.0);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      startAt: isStart ? null : widget.movie.duration,
      autoPlay: true,
      looping: false,
      allowFullScreen: true,
      deviceOrientationsOnEnterFullScreen: [DeviceOrientation.landscapeRight],
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      placeholder: const Center(child: CircularProgressIndicator()),
      aspectRatio: 16 / 9,
    );

    setState(() {});

    timer = Timer.periodic(Duration(seconds: 10), (_) {
      final current = _videoPlayerController?.value.position;
      if (current != null) {
        print('⏱ Đang phát tại: ${current.inSeconds}s');
        movieCubit.saveMovieInformation(
          index: currentIndex,
          duration: Duration(seconds: current.inSeconds),
        );
      }
    });
  }

  void _onVideoEnd() {
    final total =
        movieCubit.state.movieInfo?.episodes?.last.serverData?.length ?? 0;

    if (currentIndex + 1 < total) {
      setVideoPlayerController(
        linkVideo:
            movieCubit
                .state
                .movieInfo
                ?.episodes!
                .last
                .serverData?[currentIndex + 1]
                .linkM3U8 ??
            '',
        index: currentIndex + 1,
        isStart: true,
      );
    } else {
      print('🚫 Đã hết tập phim, không còn video để phát tiếp.');
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    _videoPlayerController?.removeListener(_videoListener);
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(language!.watchAMovie)),
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [buildVideo(), buildInfoMovie(context)],
            );
          },
        ),
      ),
    );
  }

  Widget buildVideo() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child:
          _chewieController != null
              ? SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Chewie(
                  key: ValueKey(
                    _chewieController,
                  ), // 👈 Force rebuild khi đổi controller
                  controller: _chewieController!,
                ),
              )
              : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildInfoMovie(BuildContext context) {
    final language = AppLocalizations.of(context);

    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state.movieInfo != null) {
          return Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        '${language!.movieName}: ${state.movieInfo?.movie?.name}',
                      ),

                      Gap(10),
                      Text(
                        '${language.movieContent}: ${state.movieInfo?.movie?.content}',
                      ),
                      Gap(10),

                      Text(
                        '${language.movieDirector}: ${state.movieInfo?.movie!.director?.join(', ')}',
                      ),
                      Gap(10),

                      Text(
                        '${language.movieActor}: ${state.movieInfo?.movie!.actor?.join(', ')}',
                      ),
                      Gap(10),
                      Text(
                        '${language.category}: ${state.movieInfo?.movie!.category?.join(', ')}', // chỗ này gọi đến phương thức toString trong class Category
                      ),
                      Gap(10),

                      if ((state.movieInfo?.episodes?.last.serverData?.length ??
                              0) >
                          1)
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 8,
                                childAspectRatio: 1,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                          shrinkWrap: true,
                          itemCount:
                              state
                                  .movieInfo
                                  ?.episodes
                                  ?.last
                                  .serverData
                                  ?.length ??
                              0,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setVideoPlayerController(
                                  linkVideo:
                                      state
                                          .movieInfo
                                          ?.episodes!
                                          .first
                                          .serverData?[index]
                                          .linkM3U8 ??
                                      '',
                                  index: index,
                                  isStart: true,
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color:
                                      currentIndex == index
                                          ? Colors.red
                                          : Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text('${index + 1}'),
                              ),
                            );
                          },
                        ),
                      Gap(20),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
