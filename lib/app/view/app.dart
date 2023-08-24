import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:realtime_employee/core/router/auto_route_observer.dart';
import 'package:realtime_employee/core/router/router_pod.dart';
import 'package:realtime_employee/core/theme/app_theme.dart';
import 'package:realtime_employee/core/theme/theme_controller.dart';
import 'package:realtime_employee/l10n/l10n.dart';
import 'package:realtime_employee/shared/helper/global_helper.dart';
import 'package:realtime_employee/shared/pods/locale_pod.dart';

///This class holds Material App or Cupertino App
///with routing,theming and locale setup .
///Also responsive framerwork used for responsive application
///which auto resize or autoscale the app.
class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with GlobalHelper {
  @override
  Widget build(BuildContext context) {
    final approuter = ref.watch(autorouterProvider);
    final currentTheme = ref.watch(themecontrollerProvider);
    final locale = ref.watch(localePod);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Realtime Employee',
      theme: Themes.theme,
      darkTheme: Themes.darkTheme,
      themeMode: currentTheme,
      routerConfig: approuter.config(
        navigatorObservers: () => [
          RouterObserver(),
        ],
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      builder: (context, child) {
        if (mounted) {
          ///Used for responsive design
          ///Here you can define breakpoint and how the responsive should work
          child = child = ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, child!),
            maxWidth: 1700,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScaleDown(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScaleDown(1700, name: 'XL'),
            ],
          );

          /// Add support for maximum text scale according to changes in
          /// accessibilty in sytem settings
          final mediaquery = MediaQuery.of(context);
          child = MediaQuery(
            data: mediaquery.copyWith(
              textScaleFactor: mediaquery.textScaleFactor.clamp(1.0, 1.2),
            ),
            child: child,
          );

          /// Added annotate region by default to switch according to theme which
          /// customize the system ui veray style

          child = GestureDetector(
            child: child,
            onTap: () {
              hideKeyboard();
            },
          );
        } else {
          child = const SizedBox.shrink();
        }

        ///Add toast support for flash
        return Toast(
          navigatorKey: navigatorKey,
          child: child,
        );
        //.monitorConnection()
      },
    );
  }
}
