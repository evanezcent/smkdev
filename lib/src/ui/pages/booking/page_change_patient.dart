import 'package:flutter/material.dart';
import 'package:smkdev/src/constants/constant.dart';
import 'package:smkdev/src/models/user.dart';
import 'package:smkdev/src/ui/components/dialog_form.dart';

class ChangePatient extends StatefulWidget {
  const ChangePatient({Key key, this.userList, this.id}) : super(key: key);

  @override
  _ChangePatientState createState() => _ChangePatientState();

  final List<User> userList;
  final int id;
}

class _ChangePatientState extends State<ChangePatient> {
  int id;
  @override
  void initState() {
    super.initState();
    this.id = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.black38,
        title: Text(
          "Ganti Pasien",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: widget.userList.length == 0
          ? CircularProgressIndicator()
          : Column(
              children: [
                LimitedBox(
                  maxHeight: size.height * 0.8,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.userList.length,
                      itemBuilder: (context, index) => PatientListItem(
                            user: widget.userList[index],
                            selected: widget.userList[index].id == this.id
                                ? true
                                : false,
                            callbackFunction: () {
                              setState(() {
                                this.id = widget.userList[index].id;
                              });
                              Navigator.pop(context, this.id);
                            },
                          )),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showFormBooking(size, false, context, () {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: colorPrimary,
                      ),
                      Text(
                        "Tambah Baru",
                        style: TextStyle(
                            color: colorPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class PatientListItem extends StatelessWidget {
  const PatientListItem({
    Key key,
    this.selected,
    this.user,
    this.callbackFunction,
  }) : super(key: key);

  final bool selected;
  final User user;
  final Function callbackFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: GestureDetector(
          onTap: callbackFunction,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(this.user.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Text(
                    "Jenis Kelamin: ${this.user.kelamin}",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Status : ${this.user.status}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              selected
                  ? Icon(
                      Icons.check_circle_rounded,
                      color: colorPrimary,
                      size: 35,
                    )
                  : Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey),
                    ),
            ],
          ),
        ));
  }
}
