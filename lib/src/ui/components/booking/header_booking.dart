import 'package:flutter/material.dart';
import 'package:smkdev/src/constants/constant.dart';

class HeaderBooking extends StatelessWidget {
  const HeaderBooking({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.25,
      // margin: EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Container(
            height: size.height * 0.25 - 23,
            decoration: BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Text(
                  "Booking",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            // Make the component flow in the center-end of Header
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment:
                  Alignment.center, // Make the hint in the middle vertically
              height: 54,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: colorPrimary.withOpacity(0.3))
                  ]),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle:
                              TextStyle(color: colorPrimary.withOpacity(0.3)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.search, color: colorPrimary), onPressed: () {})
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
