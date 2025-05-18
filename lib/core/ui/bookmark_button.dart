import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_projects_task/core/ui/svg_icon_button.dart';
import 'package:x_projects_task/core/constants/assets_manager.dart';
import 'package:x_projects_task/features/home/data/model/news_item.dart';
import 'package:x_projects_task/features/bookmark/cubit/bookmark_cubit.dart';
import 'package:x_projects_task/features/bookmark/cubit/bookmark_state.dart';

class BookmarkButton extends StatelessWidget {
  final NewsItem item;
  final Color fill;
  const BookmarkButton(this.item, {super.key, this.fill = Colors.white});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkCubit, BookmarkState>(
      builder: (context, state) {
        if (state is BookmarkUpdated &&
            state.bookmarks.any((e) => e.id == item.id)) {
          return SvgIconButton(
            key: const Key("bookmark-filled"),
            color: fill,
            icon: AssetsManager.assetsIconsBookmarkFill,
            onTap: () => context.read<BookmarkCubit>().removeBookmark(item.id),
          );
        }
        return SvgIconButton(
          key: const Key("bookmark-outline"),
          color: fill,
          icon: AssetsManager.assetsIconsBookmarkOutline,
          onTap: () => context.read<BookmarkCubit>().addBookmark(item),
        );
      },
    );
  }
}
