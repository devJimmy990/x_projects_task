import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/ui/bookmark_button.dart';
import 'package:x_projects_task/core/ui/svg_icon_button.dart';
import 'package:x_projects_task/core/constants/extensions.dart';
import 'package:x_projects_task/core/constants/assets_manager.dart';
import 'package:x_projects_task/core/constants/colors_manager.dart';
import 'package:x_projects_task/core/ui/floating_bottom_container.dart';
import 'package:x_projects_task/features/home/data/model/news_item.dart';

class NewsItemDetailsScreen extends StatelessWidget {
  final NewsItem item;
  const NewsItemDetailsScreen(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: ColorsManager.blackPrimary,
          ),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      floatingActionButton: FloatingBottomContainer(
        children: [
          SvgIconButton(
            size: 24,
            onTap: () {},
            icon: AssetsManager.assetsIconsChat,
          ),

          BookmarkButton(item, fill: Colors.grey),
          SvgIconButton(
            size: 24,
            onTap: () {},
            icon: AssetsManager.assetsIconsShare,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 280.h,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                stretchModes: const [StretchMode.zoomBackground],
                background: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(32.r),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        item.urlToImage,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (_, __, ___) => Image.asset(
                              AssetsManager.assetsImagesNewsDummy,
                              fit: BoxFit.cover,
                            ),
                      ),
                      Container(color: const Color.fromARGB(100, 20, 30, 40)),
                    ],
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                child: Column(
                  spacing: 32.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 12.w,
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundImage: const AssetImage(
                            AssetsManager.assetsImagesUser,
                          ),
                        ),
                        Text(
                          item.author,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      spacing: 14.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Technology".toUpperCase(),
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(color: ColorsManager.blackSecondary),
                        ),
                        Text(
                          item.title,
                          softWrap: true,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),

                        Text(
                          item.publishedAt.toLongDateFormat(),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Divider(
                      color: const Color.fromRGBO(20, 30, 40, 0.08),
                      thickness: 2.h,
                    ),
                    Text(
                      item.content,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Disable overscroll glow or bounce
class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
