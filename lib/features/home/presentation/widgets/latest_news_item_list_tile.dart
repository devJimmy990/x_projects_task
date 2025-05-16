import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/ui/image_handler.dart';
import 'package:x_projects_task/core/constants/colors_manager.dart';
import 'package:x_projects_task/features/home/data/model/news_item.dart';
import 'package:x_projects_task/features/home/presentation/screens/news_item_details_screen.dart';

class LatestNewsItemListTile extends StatelessWidget {
  final NewsItem item;
  const LatestNewsItemListTile(this.item, {super.key});

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
      child: Row(
        spacing: 24.w,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: ImageHandler(item.urlToImage),
          ),
          Expanded(
            child: Column(
              spacing: 7.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Technology".toUpperCase(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ColorsManager.blackSecondary,
                  ),
                ),
                Text(
                  item.title,
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
