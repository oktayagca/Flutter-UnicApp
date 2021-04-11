import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:getflutter/components/rating/gf_rating.dart';
import 'package:kbu_app/localization/localization_constants.dart';
import 'package:kbu_app/screens/visit/detail.dart';
import 'package:kbu_app/utils/universal_veriables.dart';

import 'data.dart';

class VisitPage extends StatefulWidget {
  @override
  _VisitPage createState() => _VisitPage();
}

class _VisitPage extends State<VisitPage> {
  double _rating = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, "Places to visit")),
        backgroundColor: UniversalVeriables.bg,
        centerTitle: true,
      ),
      backgroundColor: UniversalVeriables.bg,
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
              ),
              Container(
                height: 500,
                width: 500,
                padding: EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: visits.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetailPage(
                              visitInfo: visits[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 150),
                              Card(
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 100),
                                      Text(
                                        visits[index].name,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 18,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'KARABÜK',
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 12,
                                          color: UniversalVeriables.bg,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
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
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Daha Fazla Bilgi',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 12,
                                              color: UniversalVeriables.bg,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: UniversalVeriables.bg,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            visits[index].iconImage,
                            width: 1400,
                            height: 300,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
