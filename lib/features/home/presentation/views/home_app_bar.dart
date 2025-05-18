import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/constants/assets_manager.dart';
import 'package:x_projects_task/core/constants/colors_manager.dart';
import 'package:x_projects_task/core/helper/localization.dart';
import 'package:x_projects_task/features/settings/cubit/settings_cubit.dart';
import 'package:x_projects_task/features/settings/cubit/settings_state.dart';

class HomeScreenAppBarView extends StatelessWidget
    implements PreferredSizeWidget {
  final void Function() onLeadingPressed;
  const HomeScreenAppBarView({super.key, required this.onLeadingPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: onLeadingPressed,
              icon:
                  state.locale == "en"
                      ? SvgPicture.asset(AssetsManager.assetsIconsMenu)
                      : RotatedBox(
                        quarterTurns: 2,
                        child: SvgPicture.asset(AssetsManager.assetsIconsMenu),
                      ),
              style: IconButton.styleFrom(backgroundColor: Colors.black),
            ),
            title:
                state.locale == "en"
                    ? RichText(
                      text: TextSpan(
                        locale: Locale(state.locale),
                        children: [
                          TextSpan(
                            text: Localization.appNameNews,
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge?.copyWith(
                              color: const Color.fromRGBO(34, 37, 42, 1),
                            ),
                          ),
                          TextSpan(
                            text: Localization.appNameApp,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                              color: const Color.fromRGBO(34, 37, 42, 1),
                            ),
                          ),
                        ],
                      ),
                    )
                    : RichText(
                      text: TextSpan(
                        locale: Locale(state.locale),
                        children: [
                          TextSpan(
                            text: Localization.appNameApp,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                              color: const Color.fromRGBO(34, 37, 42, 1),
                            ),
                          ),
                          TextSpan(
                            text: Localization.appNameNews,
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge?.copyWith(
                              color: const Color.fromRGBO(34, 37, 42, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
            actions: [
              CircleAvatar(
                radius: 18.r,
                backgroundColor: ColorsManager.blackPrimary,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AssetsManager.assetsIconsMic),
                    style: IconButton.styleFrom(backgroundColor: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
