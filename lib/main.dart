import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:x_projects_task/core/theme/app_theme.dart';
import 'package:x_projects_task/generated/l10n.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/features/main/main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:x_projects_task/features/home/cubit/news_cubit.dart';
import 'package:x_projects_task/features/bookmark/cubit/bookmark_cubit.dart';
import 'package:x_projects_task/features/settings/cubit/settings_cubit.dart';
import 'package:x_projects_task/features/settings/cubit/settings_state.dart';
import 'package:x_projects_task/features/connection/no_internet_connection_screen.dart';
import 'package:x_projects_task/features/home/data/repositories/news_repository.dart';
import 'package:x_projects_task/features/home/data/data_source/remote_news_data_source.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Stream<bool> get connectionStream async* {
    final connectivity = Connectivity();
    final initial = await connectivity.checkConnectivity();
    yield initial.contains(ConnectivityResult.wifi) ||
        initial.contains(ConnectivityResult.mobile);

    await for (final result in connectivity.onConnectivityChanged) {
      yield result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SettingsCubit()),
        BlocProvider(create: (context) => BookmarkCubit()),
        BlocProvider(
          create:
              (context) => NewsCubit(NewsRepository(RemoteNewsDataSource())),
        ),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(375, 812),
        builder: (context, child) {
          return BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                supportedLocales: S.delegate.supportedLocales,
                locale: state.locale != "system" ? Locale(state.locale) : null,
                builder: // to avoid MediaQuery.of(context).platformBrightness error
                    (context, child) =>
                        _ThemeBuilder(state: state, child: child!),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: StreamBuilder<bool>(
                  stream: connectionStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Scaffold();
                    } else if (snapshot.data ?? false) {
                      return const MainScreen();
                    } else {
                      return const NoInternetConnectionScreen();
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _ThemeBuilder extends StatelessWidget {
  final SettingsState state;
  final Widget child;

  const _ThemeBuilder({required this.state, required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: switch (state.theme) {
        "dark" => AppThemeData.dark,
        "light" => AppThemeData.light,
        _ =>
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? AppThemeData.dark
              : AppThemeData.light,
      },
      child: child,
    );
  }
}
