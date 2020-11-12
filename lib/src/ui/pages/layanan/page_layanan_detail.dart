import 'package:flutter/material.dart';
import 'package:smkdev/src/models/layanan.dart';

class LayananDetailPage extends StatefulWidget {
  final Layanan layanan;

  const LayananDetailPage({Key key, this.layanan}) : super(key: key);

  @override
  _LayananDetailPageState createState() => _LayananDetailPageState();
}

class _LayananDetailPageState extends State<LayananDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                widget.layanan.image,
                fit: BoxFit.cover,
              ))),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    padding: EdgeInsets.all(0),
                    backgroundColor: Colors.deepPurple,
                    label: Text('FASILITAS',
                        style: TextStyle(color: Colors.white)),
                  ),
                  Text(
                    widget.layanan.nama,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text("8 Agustus 2020", style: TextStyle(color: Colors.grey)),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent rhoncus purus vitae pulvinar fermentum. Suspendisse vulputate at diam eget rhoncus. Maecenas vel gravida nisl. Etiam faucibus nibh eu orci pharetra placerat. Donec quis arcu ut orci pellentesque scelerisque. Etiam rutrum et sapien et posuere. Nam accumsan lorem lacus, euismod pretium metus dignissim eu. Integer in felis sem. Vivamus nec massa lorem. Etiam imperdiet leo ut libero posuere interdum. Etiam varius magna quis nisl egestas, porta porta nunc congue. Suspendisse in malesuada nisl. Quisque rutrum cursus varius. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent rhoncus purus vitae pulvinar fermentum. Suspendisse vulputate at diam eget rhoncus. Maecenas vel gravida nisl. Etiam faucibus nibh eu orci pharetra placerat. Donec quis arcu ut orci pellentesque scelerisque. Etiam rutrum et sapien et posuere. Nam accumsan lorem lacus, euismod pretium metus dignissim eu. Integer in felis sem. Vivamus nec massa lorem. Etiam imperdiet leo ut libero posuere interdum. Etiam varius magna quis nisl egestas, porta porta nunc congue. Suspendisse in malesuada nisl. Quisque rutrum cursus varius."),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
