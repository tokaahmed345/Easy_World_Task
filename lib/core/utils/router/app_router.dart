import 'package:character_hub/core/utils/router/routes_name.dart';
import 'package:character_hub/feature/home/home_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
  
    routes: [
      GoRoute(
        path: RoutesName.home,
        name: RoutesName.home,
        builder: (context, state) => const HomeView(),
      ),
      
     
    ],
  );
}