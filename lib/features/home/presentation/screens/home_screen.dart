import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/helper/localization.dart';
import 'package:x_projects_task/core/ui/svg_icon_button.dart';
import 'package:x_projects_task/core/constants/assets_manager.dart';
import 'package:x_projects_task/features/bookmark/cubit/bookmark_cubit.dart';
import 'package:x_projects_task/features/bookmark/cubit/bookmark_state.dart';
import 'package:x_projects_task/features/home/cubit/news_cubit.dart';
import 'package:x_projects_task/features/home/cubit/news_state.dart';
import 'package:x_projects_task/features/home/presentation/views/home_app_bar.dart';
import 'package:x_projects_task/features/home/presentation/views/latest_news_view.dart';
import 'package:x_projects_task/features/home/presentation/views/nearest_news_view.dart';
import 'package:x_projects_task/features/home/presentation/screens/all_latest_news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static Widget _buildLatestNewsHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 4.h),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Localization.latestNews,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SvgIconButton(
            icon: AssetsManager.assetsIconsBack,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AllLatestNewsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (_controller.position.pixels >=
            _controller.position.maxScrollExtent - 100 &&
        context.read<NewsCubit>().state is NewsLoaded) {
      final state = context.read<NewsCubit>().state as NewsLoaded;
      if (!state.isLoadingMore) {
        context.read<NewsCubit>().loadMoreNews();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBarView(
        onLeadingPressed: () => Scaffold.of(context).openDrawer(),
      ),
      drawer: const Drawer(),

      body: MultiBlocListener(
        listeners: [
          BlocListener<NewsCubit, NewsState>(
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
          ),
          BlocListener<BookmarkCubit, BookmarkState>(
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
                  backgroundColor:
                      state.action == "add" ? Colors.green : Colors.red,
                  msg:
                      state.action == "add"
                          ? Localization.bookmarkAdded
                          : Localization.bookmarkRemoved,
                );
              }
            },
          ),
        ],
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                spacing: 20.h,
                children: const [SizedBox(), NearestNewsView(), SizedBox()],
              ),
            ),

            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverHeaderDelegate(
                height: 40.h,
                child: HomeScreen._buildLatestNewsHeader(context),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 20.h)),

            const LatestNewsView(),

            SliverToBoxAdapter(child: SizedBox(height: 32.h)),
          ],
        ),
      ),
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;
  _SliverHeaderDelegate({required this.child, required this.height});

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant _SliverHeaderDelegate oldDelegate) {
    return oldDelegate.height != height || oldDelegate.child != child;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => SizedBox(height: height, child: child);
}
