import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smkdev/src/constants/constant.dart';
import 'package:smkdev/src/models/event.dart';
import 'package:smkdev/src/models/layanan.dart';
import 'package:smkdev/src/ui/components/cards/cards_event.dart';
import 'package:smkdev/src/ui/components/cards/cards_layanan.dart';
import 'package:smkdev/src/ui/widgets/widget_header.dart';

class LayananDashboard extends StatefulWidget {
  @override
  _LayananDashboardState createState() => _LayananDashboardState();
}

class _LayananDashboardState extends State<LayananDashboard> {
  List<Layanan> layananList = List();
  List<Event> eventList = List();

  void getLayanan() async {
    var jsonData = await rootBundle.loadString("assets/json/layanan.json");
    var decodedJson = json.decode(jsonData);

    setState(() {
      for (var line in decodedJson) {
        layananList.add(Layanan.fromJson(line));
      }
    });
  }

  void getEvents() async {
    var jsonData = await rootBundle.loadString("assets/json/event.json");
    var decodedJson = json.decode(jsonData);

    setState(() {
      for (var line in decodedJson) {
        eventList.add(Event.fromJson(line));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.getLayanan();
    this.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              size: size,
              title: "Layanan",
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
              child: Text(
                "Fasilitas & Layanan Terkini",
                style: TextStyle(
                    color: colorPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Container(
                height: 200,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: LayananButtonsWidget(list: layananList)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
              child: Text(
                "Event & Promo",
                style: TextStyle(
                    color: colorPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: EventButtonsWidget(list: eventList),
            )
          ],
        ),
      ),
    ));
  }
}
