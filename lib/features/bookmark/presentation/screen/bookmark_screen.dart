import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/helper/localization.dart';
import 'package:x_projects_task/core/constants/assets_manager.dart';
import 'package:x_projects_task/features/bookmark/cubit/bookmark_cubit.dart';
import 'package:x_projects_task/features/bookmark/cubit/bookmark_state.dart';
import 'package:x_projects_task/features/bookmark/presentation/widgets/bookmark_list_tile.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<BookmarkCubit, BookmarkState>(
        builder: (context, state) {
          return state is! BookmarkUpdated || state.bookmarks.isEmpty
              ? Center(
                child: Image.asset(AssetsManager.assetsImagesBookmarkEmpty),
              )
              : Column(
                spacing: 13.h,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Text(
                      Localization.latestBookmark,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: ListView.builder(
                        itemCount: state.bookmarks.length,
                        itemBuilder: (context, index) {
                          return BookmarkListTile(
                            state.bookmarks[index],
                            key: Key(state.bookmarks[index].id),
                            onDismissed: () {
                              context.read<BookmarkCubit>().removeAt(index);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
        },
      ),
    );
  }
}
