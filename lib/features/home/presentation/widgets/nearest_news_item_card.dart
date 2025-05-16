import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/ui/bookmark_button.dart';
import 'package:x_projects_task/core/ui/image_handler.dart';
import 'package:x_projects_task/core/ui/svg_icon_button.dart';
import 'package:x_projects_task/core/constants/extensions.dart';
import 'package:x_projects_task/core/constants/assets_manager.dart';
import 'package:x_projects_task/features/home/data/model/news_item.dart';
import 'package:x_projects_task/features/home/presentation/screens/news_item_details_screen.dart';

class NearestNewsItemCard extends StatelessWidget {
  final NewsItem item;
  const NearestNewsItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsItemDetailsScreen(item),
            ),
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: SizedBox(
          height: 300.h,
          width: 300.w,
          child: Stack(
            children: [
              ImageHandler(item.urlToImage, width: 300.w, height: 350.h),
              ColoredBox(
                color: const Color.fromARGB(107, 0, 0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 24.w,
                    end: 14.w,
                    top: 12.h,
                    bottom: 12.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TECHNOLOGY",
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            item.publishedAt.timeAgo(),
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        item.id.length.toString(),
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                      Text(
                        item.id,
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 10.w),
                        child: Text(
                          item.title,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          SvgIconButton(
                            color: Colors.white,
                            icon: AssetsManager.assetsIconsChat,
                            onTap: () {},
                          ),
                          BookmarkButton(item),
                          const Spacer(),
                          SvgIconButton(
                            color: Colors.white,
                            icon: AssetsManager.assetsIconsShare,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
