import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/constants/assets_manager.dart';
import 'package:x_projects_task/core/constants/colors_manager.dart';

class HomeScreenAppBarView extends StatelessWidget
    implements PreferredSizeWidget {
  final void Function() onLeadingPressed;
  const HomeScreenAppBarView({super.key, required this.onLeadingPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: onLeadingPressed,
          icon: SvgPicture.asset(AssetsManager.assetsIconsMenu),
          style: IconButton.styleFrom(backgroundColor: Colors.black),
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'News',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: const Color.fromRGBO(34, 37, 42, 1),
                ),
              ),
              TextSpan(
                text: 'App',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
