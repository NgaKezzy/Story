import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story/core/language/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:story/common/domain/entities/response/movie_data.dart';
import 'package:story/common/widgets/loading/loading_component.dart';
import 'package:story/core/colors/app_colors.dart';
import 'package:story/core/di/di.dart';
import 'package:story/core/routers/app_router.dart';
import 'package:story/core/text_style/app_text_style.dart';
import 'package:story/features/home/models/param_movie_list_page.dart';
import 'package:story/features/movie/cubit/movie_cubit.dart';
import 'package:story/features/movie/cubit/movie_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Logger logger = getIt.get<Logger>();
  final MovieCubit movieCubit = getIt.get();
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    movieCubit.clearData();
    if (movieCubit.state.newMovieList.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        movieCubit.initDataMovie();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: () async {
            movieCubit.initDataMovie();
          },
          child: BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  _buildSliderMovie(),
                  _buildMovieGrid(
                    title: language!.singleMovie,
                    movies: state.movieSingle,
                    isPadding: false,
                  ),
                  _buildMovieCartoon(language.cartoon),
                  _buildMovieGrid(
                    title: language.seriesMovie,
                    movies: state.movieSeries,
                    isPadding: true,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMovieGrid({
    required String title,
    required List<Movie> movies,
    required bool isPadding,
  }) {
    return SliverToBoxAdapter(
      child: movies.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Gap(10),
                  Row(
                    children: [
                      Text(title, style: AppTextStyles.textStyleBold20),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          context.push(
                            AppRouteConstant.movieListPage,
                            extra: ParamMovieListPage(
                              movies: movies,
                              title: title,
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),

                  // Gap(10),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: isPadding ? 90 : 0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.8,
                        ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          movieCubit.playMovie(
                            movie: movies[index],
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
                                    imageUrl: movies[index].fullThumbUrl,
                                    errorWidget: (context, url, error) =>
                                        Center(child: Icon(Icons.warning)),
                                    placeholder: (context, url) => Container(
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
                                  movies[index].name ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },

                    itemCount: 9,
                  ),
                ],
              ),
            )
          : SizedBox(),
    );
  }

  Widget _buildSliderMovie() {
    return SliverToBoxAdapter(
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                // color: AppColors.red1,
                height: ScreenUtil().screenHeight * 0.25,
                child: PageView.builder(
                  controller: _pageController,
                  allowImplicitScrolling: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        movieCubit.playMovie(
                          movie: state.newMovieList[index],
                          context: context,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: state.newMovieList[index].thumbUrl ?? '',
                            errorWidget: (context, url, error) =>
                                Center(child: Icon(Icons.warning)),
                            placeholder: (context, url) => Container(
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: LoadingComponent(),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },

                  itemCount: state.newMovieList.length,
                ),
              ),
              Center(
                child: state.newMovieList.isNotEmpty
                    ? Column(
                        children: [
                          const SizedBox(height: 10),
                          SmoothPageIndicator(
                            controller: _pageController,
                            //     _pageController, // PageController
                            count: state.newMovieList.length,
                            effect: ExpandingDotsEffect(
                              dotWidth: 10,
                              dotHeight: 10,
                            ), // your preferred effect
                            onDotClicked: (index) {},
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMovieCartoon(String title) {
    return SliverToBoxAdapter(
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state.movieCartoon.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Gap(10),
                  Row(
                    children: [
                      Text(title, style: AppTextStyles.textStyleBold20),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          context.push(
                            AppRouteConstant.movieListPage,
                            extra: ParamMovieListPage(
                              movies: state.movieCartoon,
                              title: title,
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().screenHeight * 0.25,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            movieCubit.playMovie(
                              movie: state.movieCartoon[index],
                              context: context,
                            );
                          },
                          child: SizedBox(
                            width: ScreenUtil().screenWidth * 0.4,

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: state
                                          .movieCartoon[index]
                                          .fullThumbUrl,
                                      errorWidget: (context, url, error) =>
                                          Center(child: Icon(Icons.warning)),
                                      placeholder: (context, url) => Container(
                                        color: Colors.transparent,
                                        alignment: Alignment.center,
                                        child: LoadingComponent(),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  state.movieCartoon[index].name ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Gap(10),
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
