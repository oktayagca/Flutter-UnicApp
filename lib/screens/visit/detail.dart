import 'package:flutter/material.dart';
import 'package:getflutter/components/rating/gf_rating.dart';
import 'package:kbu_app/screens/visit/data.dart';
import 'package:kbu_app/utils/universal_veriables.dart';

class DetailPage extends StatefulWidget {
  final VisitInfo visitInfo;

  const DetailPage({Key key, this.visitInfo}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextEditingController controller = new TextEditingController();
  String result = "";
  double _rating = 1;
  double count = 1;

  _Post() {
    Text(
      result,
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVeriables.bg,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 50),
                        Text(
                          widget.visitInfo.name,
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.grey),
                        SizedBox(height: 32),
                        Text(
                          widget.visitInfo.description ?? '',
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 32),
                        Divider(color: Colors.grey),
                        Text(
                          "Adres: " + widget.visitInfo.address ?? '',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 32),
                        Divider(color: Colors.grey),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: widget.visitInfo.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  widget.visitInfo.images[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  ),
                  Divider(
                      color: Colors.grey,
                      height: 80,
                      indent: 35,
                      endIndent: 35),
                  SizedBox(height: 25),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    height: 100,
                    width: 400,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 3.0)),
                    child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Yorum ekle",
                        ),
                        onSubmitted: (String str) {
                          setState(() {
                            result = result + "\n" + str;
                          });
                          controller.text = "";
                        },
                        controller: controller),
                  ),
                  SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.only(left: 245),
                    child: RaisedButton(
                      color: Colors.grey,
                      elevation: 10,
                      child: Text(
                        "Yorumu Gönder",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => _Post,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.only(left: 33),
                    child: GFRating(
                      size: 24.0,
                      color: Colors.yellow,
                      value: _rating,
                      onChanged: (value) {
                        setState(() {
                          _rating = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 245),
                    child: RaisedButton(
                      color: Colors.grey,
                      onPressed: () {
                        setState(() {
                          _rating = count++;
                        });
                      },
                      child: Text(
                        "Puan Ver",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
