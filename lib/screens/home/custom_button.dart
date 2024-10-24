import 'package:calculator/constant/constant_screen.dart';
import 'package:flutter/material.dart';
class ButtonScreen extends StatelessWidget {
  final Color BTnColor;
  final String text;
  final Function? onBTNClick;
  const ButtonScreen({super.key, required this.text,required this.onBTNClick, required this.BTnColor});

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Expanded(
        child: Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: mediaquery.width*0.01,
            vertical: mediaquery.height*0.01
          ),
          child: Container(
            margin:  EdgeInsets.symmetric(horizontal: mediaquery.width*0.015),
            child: ElevatedButton(
              onPressed: () {
              onBTNClick!(text);
            },
              style: ElevatedButton.styleFrom(
                  backgroundColor: BTnColor,
                  shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(20),
                  ),
              ),
              child:
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: mediaquery.width*0.04,
                  //horizontal: mediaquery.width*0.01,
                ),
                child: Text(text,
                  style:  TextStyle(
                    fontSize: mediaquery.width*0.07,
                    color: Colors.white,
                  ),
                  selectionColor: constantScreen.textBTnColor,
                ),
              ),
            ),
          ),
        )
    );
  }
}
