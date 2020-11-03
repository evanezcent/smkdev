import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smkdev/src/constants/constant.dart';
import 'package:smkdev/src/ui/components/booking/booking_form_user.dart';
import 'package:smkdev/src/ui/components/booking/doctor_schedule_item.dart';
import 'package:smkdev/src/ui/components/buttons/button_primary.dart';
import 'package:smkdev/src/ui/components/widget_short_description.dart';
import 'package:smkdev/src/utils/dialog_form.dart';

class BookingDoctorDetail extends StatefulWidget {
  @override
  _BookingDoctorDetailState createState() => _BookingDoctorDetailState();
  const BookingDoctorDetail({Key key, this.name, this.specialist})
      : super(key: key);
  final String name, specialist;
}

class _BookingDoctorDetailState extends State<BookingDoctorDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorPrimary,
      body: Stack(
        children: [
          Positioned(
            left: 20,
            top: 40,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.16),
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(radius: 80),
                SizedBox(height: 10),
                Text(
                  widget.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  widget.specialist,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.45,
              minChildSize: 0.45,
              maxChildSize: 0.85,
              builder: (BuildContext context, s) {
                return Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Stack(
                    children: [
                      Positioned(
                        left: size.width * 0.4,
                        child: Container(
                          width: 40,
                          height: 10,
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: colorPrimary),
                        ),
                      ),
                      ListView(
                        controller: s,
                        padding: EdgeInsets.only(top: 30, bottom: 10),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jadwal",
                                style: TextStyle(
                                    color: colorPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              ScheduleItem(
                                day: "Senin",
                                time: "08.00-14.00",
                                hospital: "RSUD Cengkareng",
                              ),
                              ScheduleItem(
                                day: "Rabu",
                                time: "08.00-14.00",
                                hospital: "RSUD Tangerang Selatan",
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          ShortDescriptionWidget(
                            title: "Biografi",
                            shortDesc:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                          ),
                          SizedBox(height: 20),
                          ShortDescriptionWidget(
                            title: "Kredensial",
                            shortDesc:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                          ),
                          SizedBox(height: 20),
                          ShortDescriptionWidget(
                            title: "Afliansi Akademik",
                            shortDesc:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        width: size.width,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(boxShadow: darkShadow, color: Colors.white),
        child: ButtonPrimary(
          buttonText: "Buat Janji",
          color: colorPrimary,
          textColor: Colors.white,
          onClicked: () {
            showFormBooking(size, true, context);
          },
        ),
      ),
    );
  }
}
