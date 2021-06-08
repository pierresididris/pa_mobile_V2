import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pa_fjt_mobile/widgets/rent_widget.dart';
import 'package:pa_fjt_mobile/widgets/request_widget.dart';

import 'file_widget.dart';
import 'flat_widget.dart';


class WidgetContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            // padding: EdgeInsets.all(15),
            width: double.infinity,
          ),
          FlatWidget(),
          FileWidget(),
          RentWidget(),
          RequestWidget()
        ],
      ),
      // padding: EdgeInsets.all(15),
    );
  }
}