import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/features/home/cubit/news_cubit.dart';
import 'package:x_projects_task/features/home/cubit/news_state.dart';
import 'package:x_projects_task/features/home/presentation/widgets/latest_news_item_list_tile.dart';
import 'package:x_projects_task/features/home/presentation/widgets/latest_news_shimmer_list_tile.dart';

class LatestNewsView extends StatelessWidget {
  const LatestNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const LatestNewsShimmerListTile(),
              childCount: 5,
            ),
          );
        } else if (state is NewsLoaded) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index < state.latest.length) {
                final item = state.latest[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                  ).copyWith(bottom: 16.h),
                  child: LatestNewsItemListTile(item, key: Key(item.id)),
                );
              } else {
                return const LatestNewsShimmerListTile();
              }
            }, childCount: state.latest.length + (state.isLoadingMore ? 3 : 0)),
          );
        }
        return SliverToBoxAdapter(child: Text("${state.runtimeType}"));
      },
    );
  }
}
