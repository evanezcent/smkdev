import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smkdev/src/constants/constant.dart';
import 'package:smkdev/src/ui/components/buttons/button_primary.dart';

void showFormBooking(
    Size size, bool _warning, BuildContext context, Function daftarClick) {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  TextEditingController textNama = new TextEditingController();
  TextEditingController textHp = new TextEditingController();
  TextEditingController textEmail = new TextEditingController();
  String _nama, _nohp, _email = '';
  String _kelamin = '';

  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    context: context,
    pageBuilder: (_, __, ___) {
      // return BookingFormUser(size: size);
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: DraggableScrollableSheet(
          initialChildSize: _warning ? 0.72 : 0.7,
          minChildSize: 0.3,
          maxChildSize: _warning ? 0.72 : 0.7,
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
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _warning
                              ? Text(
                                  "Maaf, anda belum terdaftar dalam aplikasi. Harap daftar terlebih dahulu untuk dapat memesan jadwal dengan dokter yang bersangkutan.",
                                  style: TextStyle(
                                      color: Colors.red[300],
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  "Tambah pasien baru",
                                  style: TextStyle(
                                      color: colorPrimary,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                          SizedBox(height: 40),
                          Form(
                              key: _formKey,
                              autovalidate: _autoValidate,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 2),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[50],
                                        border:
                                            Border.all(color: Colors.grey[300]),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: TextFormField(
                                      controller: textNama,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value.length < 3) {
                                          print('is empty');
                                          return 'Username must be more than 6 charater';
                                        } else
                                          return null;
                                      },
                                      onSaved: (String val) {
                                        _nama = val;
                                      },
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 20, right: 20),
                                          hintText: "Nama",
                                          hintStyle: TextStyle(
                                            color: Colors.grey[400],
                                          ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "No Handphone",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 2),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[50],
                                        border:
                                            Border.all(color: Colors.grey[300]),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: TextFormField(
                                      controller: textHp,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value.length < 3) {
                                          print('is empty');
                                          return 'Username must be more than 6 charater';
                                        } else
                                          return null;
                                      },
                                      onSaved: (String val) {
                                        _nohp = val;
                                      },
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 20, right: 20),
                                          hintText: "No Handphone",
                                          hintStyle: TextStyle(
                                            color: Colors.grey[400],
                                          ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Jenis Kelamin",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RadioListTile(
                                            value: "laki",
                                            selected: _kelamin == 'laki',
                                            activeColor: colorPrimary,
                                            groupValue: _kelamin,
                                            title: Text(
                                              "Laki-laki",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            onChanged: (val) {
                                              print(val);
                                              _kelamin = val;
                                            }),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                            value: "perempuan",
                                            selected: _kelamin == 'perempuan',
                                            activeColor: colorPrimary,
                                            groupValue: _kelamin,
                                            title: Text(
                                              "Perempuan",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            onChanged: (val) {
                                              print(val);
                                              _kelamin = val;
                                            }),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 2),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[50],
                                        border:
                                            Border.all(color: Colors.grey[300]),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: TextFormField(
                                      controller: textNama,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value.length < 3) {
                                          print('is empty');
                                          return 'Username must be more than 6 charater';
                                        } else
                                          return null;
                                      },
                                      onSaved: (String val) {
                                        _nama = val;
                                      },
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 20, right: 20),
                                          hintText: "email",
                                          hintStyle: TextStyle(
                                            color: Colors.grey[400],
                                          ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ButtonPrimary(
                                        buttonText: "Batal",
                                        color: Colors.grey[200],
                                        textColor: Colors.black,
                                        onClicked: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ButtonPrimary(
                                        buttonText: "Daftar",
                                        color: colorPrimary,
                                        textColor: Colors.white,
                                        onClicked: daftarClick,
                                      ),
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}
