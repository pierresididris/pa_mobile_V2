import 'package:flutter/material.dart';
import 'package:pa_fjt_mobile/services/authentication_api.dart';
import 'package:pa_fjt_mobile/views/dashboard_page.dart';
import 'package:pa_fjt_mobile/views/registration_page.dart';
import 'package:pa_fjt_mobile/views/request_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_router.dart';
import 'views/login_page.dart';

UserService userService = UserService();

Future loadData() async {
  await userService.loadData();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadData();
  runApp(PamApp());
}

String getInitialRoute() {
  if (userService.isAuthenticated) {
    return NamedRoute.HOME_ROUTE;
  } else {
    return NamedRoute.CONNECTION_ROUTE;
  }
}

class PamApp extends StatelessWidget {
  const PamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'router',
        routes: {
          '/': (BuildContext context) {
            return Scaffold(
                body: (UserService().isAuthenticated)
                    ? DashboardPage()
                    : LoginPage());
          },
          NamedRoute.CONNECTION_ROUTE: (BuildContext context) => LoginPage(),
          NamedRoute.HOME_ROUTE: (BuildContext context) => DashboardPage(),
          NamedRoute.REQUESTS_ROUTE: (BuildContext context) => RequestsPage(),
          NamedRoute.INSCRIPTION_ROUTE: (BuildContext context) =>
              RegisterPage(),
        },
        initialRoute: '/');
  }
}
