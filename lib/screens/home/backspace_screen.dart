import 'package:flutter/material.dart';

import '../../constant/constant_screen.dart';
class BackspaceScreen extends StatelessWidget {
  final Color BTnColor;
  final String text;
  final Function? onBTNClick;
  const BackspaceScreen({super.key, required this.BTnColor, required this.text, this.onBTNClick});

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
                padding: EdgeInsets.zero,
                backgroundColor: BTnColor,
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20),
                ),
              ),
              child:
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: mediaquery.width*0.065,
                //  horizontal: mediaquery.width*0.06,
                ),
                child: const Icon(Icons.backspace_outlined,color: Colors.white,),
                ),
              ),
          ),
          ),

    );
  }
}
