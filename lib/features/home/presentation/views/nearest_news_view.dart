import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/features/home/cubit/news_cubit.dart';
import 'package:x_projects_task/features/home/cubit/news_state.dart';
import 'package:x_projects_task/features/home/presentation/widgets/nearest_news_item_card.dart';
import 'package:x_projects_task/features/home/presentation/widgets/nearest_news_item_shimmer_card.dart';

class NearestNewsView extends StatelessWidget {
  const NearestNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoaded) {
            return ListView.separated(
              itemCount: state.newest.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => SizedBox(width: 16.w),
              padding: EdgeInsetsDirectional.only(start: 32.w, end: 16.w),
              itemBuilder:
                  (context, index) => NearestNewsItemCard(
                    state.newest[index],
                    key: Key(state.newest[index].id),
                  ),
            );
          }
          return ListView.separated(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => SizedBox(width: 16.w),
            padding: EdgeInsetsDirectional.only(start: 32.w, end: 16.w),
            itemBuilder: (context, index) => const NearestNewsItemShimmerCard(),
          );
        },
      ),
    );
  }
}
