import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:story/core/colors/app_colors.dart';
import 'package:story/core/di/di.dart';
import 'package:story/core/language/cubit/language_cubit.dart';
import 'package:story/core/routers/app_router.dart';
import 'package:story/core/text_style/app_text_style.dart';
import 'package:story/core/theme/cubit/theme_cubit.dart';
import 'package:story/core/theme/cubit/theme_state.dart';
import 'package:story/core/language/l10n/app_localizations.dart';
import 'package:story/features/auth/cubit/auth_cubit.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final ThemeCubit themeCubit = getIt<ThemeCubit>();
  final LanguageCubit languageCubit = getIt<LanguageCubit>();
  final AuthCubit authCubit = getIt<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(language!.setting)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(language.darkMode),
                    Transform.scale(
                      scale: 0.7,
                      child: CupertinoSwitch(
                        value: themeCubit.state.isDark,
                        onChanged: (value) {
                          themeCubit.toggedTheme();
                        },
                      ),
                    ),
                  ],
                );
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(language.language),
                DropdownButton<String>(
                  value: languageCubit.state.languageCode,
                  style: AppTextStyles.textStyle10.copyWith(
                    color: AppColors.red5,
                  ),
                  underline: const SizedBox(), // Ẩn đường gạch chân
                  items: [
                    DropdownMenuItem(
                      value: 'vi',
                      child: Text(language.vietNamese),
                    ),
                    DropdownMenuItem(
                      value: 'en',
                      child: Text(language.english),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      languageCubit.changedLanguage(newValue);
                    }
                  },
                ),
              ],
            ),

            // Gap(50),
            // TextButton(
            //   onPressed: () {
            //     showOkCancelAlertDialog(
            //       context: context,
            //       title: language.logout,
            //       message: language.logoutConfirm,

            //       onPopInvokedWithResult: (didPop, result) {
            //         if (result == OkCancelResult.ok) {
            //           authCubit.setIsLogin(false);
            //           context.go(AppRouteConstant.initial);
            //         } else if (result == OkCancelResult.cancel) {
            //           print('nhấn hủy');
            //         }
            //       },
            //     );
            //   },
            //   child: Text(language.logout),
            // ),
          ],
        ),
      ),
    );
  }
}
