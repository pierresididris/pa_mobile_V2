import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pa_fjt_mobile/models/request.dart';
import 'package:pa_fjt_mobile/services/authentication_api.dart';
import 'package:pa_fjt_mobile/services/requests_service.dart';
import 'package:pa_fjt_mobile/utils/constant.dart';
import 'package:pa_fjt_mobile/widgets/request_item.dart';
import 'package:pa_fjt_mobile/widgets/title_page.dart';

class RequestsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RequestsPageState();
  }
}

class RequestsPageState extends State<RequestsPage> {
  bool _loading = true;
  List<RequestEntity> requests = <RequestEntity>[];

  @override
  void initState() {
    this.loadData();
    super.initState();
  }

  void loadData() {
    setState(() {
      this._loading = true;
    });
    RequestService()
        .getRequests(UserService().currentUser!.email!)
        .then((List<RequestEntity> results) {
      setState(() {
        _loading = false;
        requests = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          actions: [
            IconButton(onPressed: () => loadData(), icon: Icon(Icons.refresh))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: (_loading)
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      TitlePage(
                        title: "Historique des demandes",
                        titleIcon: Icon(
                          Icons.space_dashboard,
                          size: 20.0,
                          color: BACKGROUND_COLOR,
                        ),
                      ),
                      // Column(
                      //   children: [
                      //     RequestItem(
                      //         requestType: "Location de salle",
                      //         requestDate: "02/04/2021",
                      //         requestStatus: "waiting"),
                      //     RequestItem(
                      //         requestType: "Location de salle",
                      //         requestDate: "02/04/2021",
                      //         requestStatus: "accepted"),
                      //     RequestItem(
                      //         requestType: "Location de salle",
                      //         requestDate: "02/04/2021",
                      //         requestStatus: "waiting")
                      //   ],
                      // )
                      Container(
                          margin: const EdgeInsets.all(10.0),
                          child: (new ListView.separated(
                            shrinkWrap: true,
                            itemCount: requests == null ? 0 : requests.length,
                            itemBuilder: (BuildContext context, int index) {
                              print(requests[index]);
                              return RequestItem(
                                  requestType: "Location de salle",
                                  requestDate: "02/04/2021",
                                  requestStatus:
                                      requests[index].flatRequestStatus);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                          ))),
                    ],
                  ),
          ),
        ));
  }
}
