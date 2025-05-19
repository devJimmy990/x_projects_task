import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/helper/localization.dart';
import 'package:x_projects_task/core/constants/assets_manager.dart';
import 'package:x_projects_task/core/constants/colors_manager.dart';

class HomeScreenAppBarView extends StatelessWidget
    implements PreferredSizeWidget {
  final void Function() onLeadingPressed;

  const HomeScreenAppBarView({super.key, required this.onLeadingPressed});

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: onLeadingPressed,
          icon:
              languageCode == "en"
                  ? SvgPicture.asset(AssetsManager.assetsIconsMenu)
                  : RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(AssetsManager.assetsIconsMenu),
                  ),
          style: IconButton.styleFrom(backgroundColor: Colors.black),
        ),
        title: RichText(
          text: TextSpan(
            locale: Localizations.localeOf(context),
            children:
                languageCode == "en"
                    ? [
                      TextSpan(
                        text: Localization.appNameNews,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextSpan(
                        text: Localization.appNameApp,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ]
                    : [
                      TextSpan(
                        text: Localization.appNameApp,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextSpan(
                        text: Localization.appNameNews,
                        style: Theme.of(context).textTheme.titleLarge,
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
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
