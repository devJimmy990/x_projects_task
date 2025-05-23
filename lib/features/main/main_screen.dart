import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_projects_task/core/ui/svg_icon_button.dart';
import 'package:x_projects_task/core/cubit/generic_cubit.dart';
import 'package:x_projects_task/core/constants/assets_manager.dart';
import 'package:x_projects_task/core/ui/floating_bottom_container.dart';
import 'package:x_projects_task/features/bookmark/presentation/screen/bookmark_screen.dart';
import 'package:x_projects_task/features/home/presentation/screens/home_screen.dart';
import 'package:x_projects_task/features/notification/notification_screen.dart';
import 'package:x_projects_task/features/search/presentation/search_screen.dart';
import 'package:x_projects_task/features/settings/settings_screen.dart';

final List<Widget> _screens = [
  const HomeScreen(),
  const BookmarkScreen(),
  const SearchScreen(),
  const NotificationScreen(),
  const SettingsScreen(),
];

final List<String> _icons = [
  AssetsManager.assetsIconsHome,
  AssetsManager.assetsIconsBookmark,
  AssetsManager.assetsIconsSearch,
  AssetsManager.assetsIconsNotification,
  AssetsManager.assetsIconsSettings,
];

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GenericCubit<int>>(
      create: (_) => GenericCubit<int>(0),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<GenericCubit<int>, int>(
            builder: (context, selectedIndex) {
              return IndexedStack(index: selectedIndex, children: _screens);
            },
          ),
        ),
        floatingActionButton: BlocBuilder<GenericCubit<int>, int>(
          builder: (context, selectedIndex) {
            return FloatingBottomContainer(
              children: List.generate(_icons.length, (index) {
                return SvgIconButton(
                  isSelected: selectedIndex == index,
                  icon: _icons[index],
                  onTap: () {
                    context.read<GenericCubit<int>>().update(index);
                  },
                );
              }),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
