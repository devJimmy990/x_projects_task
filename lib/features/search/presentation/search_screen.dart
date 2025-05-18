import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/helper/localization.dart';
import 'package:x_projects_task/core/ui/svg_icon_button.dart';
import 'package:x_projects_task/core/constants/assets_manager.dart';
import 'package:x_projects_task/core/constants/colors_manager.dart';
import 'package:x_projects_task/features/home/presentation/screens/news_item_details_screen.dart';
import 'package:x_projects_task/features/search/bloc/search_cubit.dart';
import 'package:x_projects_task/features/search/bloc/search_state.dart';
import 'package:x_projects_task/features/home/data/repositories/news_repository.dart';
import 'package:x_projects_task/features/home/data/data_source/remote_news_data_source.dart';
import 'package:x_projects_task/features/search/presentation/widgets/search_shimmer_text.dart';
import 'package:x_projects_task/features/settings/cubit/settings_cubit.dart';
import 'package:x_projects_task/features/settings/cubit/settings_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(NewsRepository(RemoteNewsDataSource())),
      child: const _SearchBody(),
    );
  }
}

class _SearchBody extends StatefulWidget {
  const _SearchBody();

  @override
  State<_SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<_SearchBody> {
  late bool isLTR;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    isLTR = context.read<SettingsCubit>().isEnglish;
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<SearchCubit>().loadMoreNews();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
      child: Column(
        spacing: 10.h,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorsManager.blackPrimary,
              borderRadius: BorderRadius.circular(28.r),
              border: Border.all(color: Colors.grey.shade300),
            ),
            padding: EdgeInsetsDirectional.only(
              start: 24.w,
              end: 8.w,
              top: 4.h,
              bottom: 4.h,
            ),
            child: Row(
              children: [
                Expanded(
                  child: BlocBuilder<SettingsCubit, SettingsState>(
                    builder: (context, state) {
                      return TextField(
                        controller: _controller,
                        selectionControls: EmptyTextSelectionControls(),
                        onChanged: (query) {
                          if (query.isEmpty) {
                            _controller.clear();
                            return;
                          }
                          context.read<SearchCubit>().onQueryChanged(query);
                        },

                        cursorColor: Colors.white,
                        cursorWidth: 2.w,
                        cursorHeight: 20.h,
                        cursorRadius: Radius.circular(20.r),
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                        decoration: InputDecoration(
                          hintText: Localization.searchHint,
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      );
                    },
                  ),
                ),
                _controller.text.isNotEmpty
                    ? IconButton(
                      onPressed: () {
                        _controller.clear();
                        setState(() {});
                      },
                      icon: const Icon(Icons.clear),
                      style: IconButton.styleFrom(padding: EdgeInsets.zero),
                    )
                    : const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.search, color: Colors.black),
                    ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchError) {
                  return Center(
                    child: Text('${Localization.error}: ${state.error}'),
                  );
                } else if (state is SearchLoaded) {
                  if (state.news.isEmpty) {
                    return Center(child: Text(Localization.searchEmpty));
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${state.news.length} ${Localization.searchNews}",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          isLTR
                              ? const SvgIconButton(
                                size: 20,
                                icon: AssetsManager.assetsIconsBack,
                              )
                              : const RotatedBox(
                                quarterTurns: 2,
                                child: SvgIconButton(
                                  size: 20,
                                  icon: AssetsManager.assetsIconsBack,
                                ),
                              ),
                        ],
                      ),
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: ListView.separated(
                            controller: _scrollController,
                            itemCount:
                                state.news.length +
                                (state.isLoadingMore ? 4 : 0),
                            separatorBuilder:
                                (_, __) => const SizedBox(height: 24),
                            itemBuilder: (context, index) {
                              if (index >= state.news.length) {
                                return const SearchShimmerText();
                              }
                              final item = state.news[index];
                              return GestureDetector(
                                onTap:
                                    () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => NewsItemDetailsScreen(item),
                                      ),
                                    ),
                                child: Text(
                                  item.title,
                                  maxLines: 3,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const Center(child: Text('Type to search...'));
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
