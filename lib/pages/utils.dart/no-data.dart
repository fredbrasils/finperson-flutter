import 'package:Finperson/config/size-config.dart';
import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.block,
              color: Colors.grey[350],
              size: SizeConfig.blockSizeHorizontal * 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 10),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "No Data",
                  style: TextStyle(
                    color: Colors.grey[350],
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.blockSizeHorizontal * 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
