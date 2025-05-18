import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/ui/image_handler.dart';
import 'package:x_projects_task/core/constants/colors_manager.dart';
import 'package:x_projects_task/features/home/data/model/news_item.dart';
import 'package:x_projects_task/features/home/presentation/screens/news_item_details_screen.dart';

class BookmarkListTile extends StatelessWidget {
  final NewsItem item;
  final void Function() onDismissed;

  const BookmarkListTile(this.item, {super.key, required this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismissed(),
      background: Container(
        color: ColorsManager.grey,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: CircleAvatar(
          radius: 16.r,
          backgroundColor: ColorsManager.blackPrimary,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            semanticLabel: 'Delete bookmark',
          ),
        ),
      ),
      child: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsItemDetailsScreen(item),
              ),
            ),
        child: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: ImageHandler(item.urlToImage),
                ),
                SizedBox(width: 24.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Technology'.toUpperCase(),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: ColorsManager.blackSecondary,
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        item.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineMedium,
                        semanticsLabel: item.title,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
