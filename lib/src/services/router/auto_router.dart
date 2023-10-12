import '../../features/auth/ui/auth_screen.dart';
import '../../features/app/ui/app_container_screen.dart';
import 'package:auto_route/auto_route.dart';


part 'auto_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: AppContainerRoute.page, initial: true),
      ];
}
