
import 'package:flutter/material.dart';
import 'package:pa_fjt_mobile/utils/constant.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RequestItem extends StatelessWidget {
  final String requestType;
  final String requestStatus;
  final String requestDate;
  const RequestItem({
    required this.requestStatus,
    required this.requestType,
    required this.requestDate,
  });

  @override
  Widget build(BuildContext context) {
    IconData requestIcon = requestStatus == "waiting" ?
    Icons.hourglass_empty_rounded
        : requestStatus == "accepted" ?
    Icons.done_rounded : Icons.close_rounded;

    MaterialColor requestColor = requestStatus == "waiting" ?
    Colors.yellow
        : requestStatus == "accepted" ?
    Colors.green : Colors.red;


    return InkWell(
      onTap: (){
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) {
        //     return SingleRequestPage();
        //   }),
        // );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Colors.white,
              width: 1
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 1,
                offset: Offset(0, 2),
                color: Colors.black26
            )
          ],
        ),
        child: Row(
          children: [
            CircularPercentIndicator(
              radius: 40.0,
              lineWidth: 5.0,
              percent: 1.0,
              center: Icon(
                requestIcon,
                size: 30.0,
                color: requestColor,
              ),
              progressColor: requestColor,
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  requestDate,
                  style: TextStyle(
                    color: BACKGROUND_COLOR,
                    fontSize: 13.0,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                    requestType,
                    style: TextStyle(
                      color: BACKGROUND_COLOR,
                      fontSize: 17.0,
                    )
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
              color: PAM_BUTTON,
            ),
          ],
        ),
      ),
    );
  }
}