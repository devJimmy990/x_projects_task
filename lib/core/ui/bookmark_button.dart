import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    return BlocConsumer<BookmarkCubit, BookmarkState>(
      listener: (context, state) {
        if (state is BookmarkError) {
          Fluttertoast.showToast(
            msg: state.error,
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
        if (state is BookmarkUpdated) {
          Fluttertoast.showToast(
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: state.action == "add" ? Colors.green : Colors.red,
            msg:
                state.action == "add"
                    ? "Added to bookmark"
                    : "Removed from bookmark",
          );
        }
      },
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
          onTap: () {
            context.read<BookmarkCubit>().addBookmark(item);
            Fluttertoast.showToast(
              textColor: Colors.white,
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.blue,
              msg: item.id.toString(),
            );
          },
        );
      },
    );
  }
}
