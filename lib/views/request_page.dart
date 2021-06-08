import 'package:flutter/material.dart';
import 'package:pa_fjt_mobile/utils/constant.dart';
import 'package:pa_fjt_mobile/widgets/request_item.dart';
import 'package:pa_fjt_mobile/widgets/title_page.dart';

class RequestsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RequestsPageState();
  }
}

class RequestsPageState extends State<RequestsPage> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Dashboard")),
          body:SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  TitlePage(
                    title: "Historique des demandes",
                    titleIcon: Icon(
                      Icons.space_dashboard,
                      size: 20.0,
                      color: BACKGROUND_COLOR,
                    ),
                  ),
                  Column(
                    children: [
                      RequestItem(requestType: "Location de salle", requestDate: "02/04/2021", requestStatus: "waiting"),
                      RequestItem(requestType: "Location de salle", requestDate: "02/04/2021", requestStatus: "accepted"),
                      RequestItem(requestType: "Location de salle", requestDate: "02/04/2021", requestStatus: "waiting")
                    ],
                  )
                  // Container(
                  //     margin: const EdgeInsets.all(10.0),
                  //     child: (new ListView.separated(
                  //       shrinkWrap: true,
                  //       itemCount: state.requests == null ? 0 : state.requests.length,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         print(state.requests[index].requestStatus);
                  //         return RequestItem(requestType: "Location de salle", requestDate: "02/04/2021", requestStatus: state.requests[index].requestStatus);
                  //       }, separatorBuilder: (BuildContext context, int index) => const Divider(),
                  //     ))
                  // ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
