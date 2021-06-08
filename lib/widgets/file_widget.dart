import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pa_fjt_mobile/utils/constant.dart';

class FileWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    spreadRadius: .5,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                    color: Colors.black26
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally
                  children: [
                    Icon(
                      Icons.description_outlined,
                      color: BACKGROUND_COLOR,
                      size: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                          "Document",
                          style: TextStyle(
                              color: BACKGROUND_COLOR,
                              fontSize: 22.0
                          )
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: ALERT_COLOR,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.orange,
                        width: 1
                    ),
                  ),
                  child: Text(
                      "Document demandé par le centre",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20.0
                      )
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context, MaterialPageRoute(builder: (context){
                    //     return FilePage();
                    //   }),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: PAM_BUTTON,
                  ) ,
                  child: Text(
                    'Voir tout les documents',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0
                      )
                  ),
                )//Faire un widget ALERT
              ],
            ),
          );
  }
}