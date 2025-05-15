import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/features/home/cubit/news_cubit.dart';
import 'package:x_projects_task/features/home/cubit/news_state.dart';
import 'package:x_projects_task/features/home/presentation/widgets/latest_news_item_list_tile.dart';
import 'package:x_projects_task/features/home/presentation/widgets/latest_news_shimmer_list_tile.dart';

class AllLatestNewsScreen extends StatelessWidget {
  const AllLatestNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              style: IconButton.styleFrom(backgroundColor: Colors.black),
            ),
            title: Text(
              "Latest News".toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocConsumer<NewsCubit, NewsState>(
            listener: (context, state) {
              if (state is NewsError) {
                Fluttertoast.showToast(
                  msg: state.error,
                  textColor: Colors.white,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.red,
                );
              }
            },
            builder: (context, state) {
              if (state is NewsLoading) {
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder:
                      (context, index) => const LatestNewsShimmerListTile(),
                );
              } else if (state is NewsLoaded) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.news.length,
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemBuilder:
                      (context, index) => LatestNewsItemListTile(
                        state.news[index],
                        key: Key(state.news[index].id),
                      ),
                );
              }
              return Text("${state.runtimeType}");
            },
          ),
        ),
      ),
    );
  }
}
