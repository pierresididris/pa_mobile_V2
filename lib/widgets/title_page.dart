
import 'package:flutter/material.dart';
import 'package:pa_fjt_mobile/utils/constant.dart';

class TitlePage extends StatelessWidget {
  final String title;
  final Icon titleIcon;
  const TitlePage({
    required this.title,
    required this.titleIcon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: PAM_TITLE,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: BACKGROUND_COLOR,
            width: 1
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          titleIcon,
          Text(
              title,
              style: TextStyle(
                  color: BACKGROUND_COLOR,
                  fontSize: 20.0
              )
          ),
        ],
      ),
    );
  }
}