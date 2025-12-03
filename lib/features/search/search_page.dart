import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:story/common/domain/entities/response/movie_data.dart';
import 'package:story/common/widgets/text_field/default_textfield.dart';
import 'package:story/core/language/l10n/app_localizations.dart';
import 'package:story/core/di/di.dart';
import 'package:story/core/text_style/app_text_style.dart';
import 'package:story/features/movie/cubit/movie_cubit.dart';
import 'package:story/features/movie/cubit/movie_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final MovieCubit movieCubit = getIt.get();
  Timer? _debounce;
  final _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: DefaultTextfield(
          heightContainer: 45,
          controller: _searchController,
          onChanged: (p0) {
            if (_debounce?.isActive ?? false) {
              _debounce!.cancel();
            }
            _debounce = Timer(const Duration(milliseconds: 400), () {
              movieCubit.getMovieSearch(_searchController.text.trim());
            });
          },
          onTapOutSide: () {
            FocusScope.of(context).unfocus();
          },

          isError: false,
          hintText: language?.search,
          maxLines: 1,
          isShowCounter: true,
          prefixIcon: Icon(Icons.search),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              final movieSearchList = state.movieSearchList ?? [];
              return state.movieSearchList.isEmpty
                  ? SizedBox()
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return _buildMovie(state.movieSearchList[index]);
                      },
                      separatorBuilder: (context, index) => Gap(10),
                      itemCount: movieSearchList.length,
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMovie(Movie? movie) {
    return GestureDetector(
      onTap: () {
        if (movie != null && movie.slug != null && movie.slug!.isNotEmpty) {
          movieCubit.playMovie(movie: movie, context: context);
        }
      },
      child: Container(
        height: 100,

        width: ScreenUtil().screenWidth,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 120,
                height: 80,

                child: CachedNetworkImage(
                  imageUrl: 'https://phimimg.com/${movie?.thumbUrl}',
                  errorWidget: (context, url, error) => Icon(Icons.warning),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: ScreenUtil().screenWidth - 166.sp,
                  child: Text(
                    movie?.name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().screenWidth - 166.sp,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(movie?.time ?? '', style: AppTextStyles.textStyle12),
                      Text(
                        movie?.year.toString() ?? '',
                        style: AppTextStyles.textStyle12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
