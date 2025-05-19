import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/validator/network.dart';
import 'package:x_projects_task/core/ui/svg_icon_button.dart';
import 'package:x_projects_task/core/helper/localization.dart';
import 'package:x_projects_task/core/constants/assets_manager.dart';
import 'package:x_projects_task/core/constants/colors_manager.dart';
import 'package:x_projects_task/features/home/presentation/screens/news_item_details_screen.dart';
import 'package:x_projects_task/features/search/bloc/search_cubit.dart';
import 'package:x_projects_task/features/search/bloc/search_state.dart';
import 'package:x_projects_task/features/home/data/repositories/news_repository.dart';
import 'package:x_projects_task/features/home/data/data_source/remote_news_data_source.dart';
import 'package:x_projects_task/features/search/presentation/widgets/search_shimmer_text.dart';

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
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  String _lastQuery = '';

  @override
  void initState() {
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
    _focusNode.addListener(() {
      print('FocusNode: hasFocus=${_focusNode.hasFocus}');
    });
  }

  void _onQueryChanged(String query) {
    if (query == _lastQuery) return;

    context.read<SearchCubit>().onQueryChanged(query);
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
                  child: TextFormField(
                    controller: _controller,
                    focusNode: _focusNode,
                    onChanged: _onQueryChanged,
                    cursorColor: Colors.white,
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: Localization.searchHint,
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                    enableSuggestions: false,
                    autocorrect: false,
                    textInputAction: TextInputAction.search,
                  ),
                ),
                _controller.text.isNotEmpty
                    ? IconButton(
                      onPressed: () {
                        print('ClearPressed');
                        _controller.clear();
                        _lastQuery = '';
                        context.read<SearchCubit>().onQueryChanged('');
                        setState(() {});
                        _focusNode.requestFocus();
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
            child: BlocConsumer<SearchCubit, SearchState>(
              listener: (context, state) {
                if (state is SearchError) {
                  Fluttertoast.showToast(
                    textColor: Colors.white,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    msg: NetworkValidator.validate(state.error),
                  );
                }
              },
              builder: (context, state) {
                if (state is SearchLoading) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return const SearchShimmerText();
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 24),
                    itemCount: 5,
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
                          Localizations.localeOf(context).languageCode == "en"
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
                return Center(child: Text(Localization.searchType));
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
    _focusNode.dispose();
    super.dispose();
  }
}
