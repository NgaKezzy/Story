import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story/core/di/di.dart';
import 'package:story/features/movie/cubit/movie_cubit.dart';
import 'package:story/features/setting/movie_history_page.dart';

class MovieHistoryProvider extends StatelessWidget {
  const MovieHistoryProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieCubit movieCubit = getIt.get();
    return BlocProvider.value(
     value: movieCubit,
      child: const MovieHistoryPage(),
    );
  }
}
