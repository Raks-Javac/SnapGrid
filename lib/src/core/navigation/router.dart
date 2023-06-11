part of "nav_export.dart";

abstract class SgRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SgRoutes.splashScreen:
        return getPageRoute(
          settings: settings,
          view: const SplashScreen(),
        );

      case SgRoutes.homeScreen:
        return getPageRoute(
          settings: settings,
          view: const HomeView(),
        );
      case SgRoutes.detailsScreen:
        return getPageRoute(
          settings: settings,
          view: const DetailsView(),
        );

      default:
        return getPageRoute(
          settings: settings,
          view: Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static PageRoute<dynamic> getPageRoute({
    required RouteSettings settings,
    required Widget view,
  }) {
    return
//set your navigation based on platform for this app , the android dissolve animation was preffered
        // Platform.isIOS
        //     ? CupertinoPageRoute(settings: settings, builder: (_) => view)
        //     :

        MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}
