import 'package:flutter/material.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
    Key key,
    this.day,
    this.time,
    this.hospital,
  }) : super(key: key);

  final String day, time, hospital;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Container(
                width: 150,
                child: Text(
                  hospital,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
