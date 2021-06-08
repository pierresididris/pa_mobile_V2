import 'package:flutter/material.dart';
import 'package:pa_fjt_mobile/app_router.dart';
import 'package:pa_fjt_mobile/services/authentication_api.dart';
import 'package:pa_fjt_mobile/utils/constant.dart';
import 'package:pa_fjt_mobile/widgets/request_item.dart';
import 'package:pa_fjt_mobile/widgets/title_page.dart';
import 'package:pa_fjt_mobile/widgets/widget_container.dart';

class DashboardPage extends StatefulWidget {
  final Function(int)? switchTabRequest;

  DashboardPage({this.switchTabRequest});

  @override
  State<StatefulWidget> createState() {
    return DashboardPageState();
  }
}

class DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Bienvenu'),
            actions: [
              IconButton(
                  onPressed: () {
                    UserService().resetUser();
                    Navigator.pushNamedAndRemoveUntil(context,
                        NamedRoute.CONNECTION_ROUTE, (Route r) => false);
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
          backgroundColor: PAM_TITLE,
          // appBar: CustomAppBar(),
          body: Container(
            margin: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(30),
                // decoration: BoxDecoration(
                //   color: BACKGROUND_COLOR,
                // ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // TitlePage(),
                      WidgetContainer(
                        switchTabRequest: widget.switchTabRequest,
                      ),
                    ]),
              ),
            ),
          )),
    );
  }
}
