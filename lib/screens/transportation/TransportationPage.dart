import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kbu_app/localization/localization_constants.dart';
import 'package:kbu_app/utils/universal_veriables.dart';

class TransportationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, "Communication")),
        backgroundColor: UniversalVeriables.bg,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 700,
          height: 700,
          color: UniversalVeriables.bg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text("İSTANBUL"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => _istanbulRotation(context)));
                  }),
              RaisedButton(
                  child: Text("ANKARA"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => _ankaraRotation(context)));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _istanbulRotation(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVeriables.bg,
      appBar: AppBar(
        title: Text(getTranslated(context, "Directions")),
        backgroundColor: UniversalVeriables.bg,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 5.0)),
                    child: ListTile(
                      leading: Icon(
                        Icons.airplanemode_active,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "Başlangıç Noktası: İstanbul Havalimanı"
                            "                                                Varış Noktası: Karabük Üniversitesi",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                      subtitle: Text("Lütfen aşağıdaki adımları takip ediniz",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 5.0)),
                    child: ListTile(
                      leading: Icon(
                        Icons.bus_alert,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "H-3 Metrobüsünü bekle",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                      subtitle: Text("Gümrük / Eminönü yönü",style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 5.0)),
                    child: ListTile(
                      leading: Icon(
                        Icons.directions_walk,
                        color: Colors.green,
                      ),
                      title: Text(
                        "Masko 1/ Topkapı-Bahçeşehir Yönünde in",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                      subtitle:
                      Text(" Masko 1/Topkapı yönünde 1 dk boyunca yürü",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 5.0)),
                    child: ListTile(
                      leading: Icon(
                        Icons.bus_alert,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "760 numaralı metrobüsü bekle",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                      subtitle: Text("Esenler Otogar son durakta in",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 5.0)),
                    child: ListTile(
                      leading: Icon(
                        Icons.directions_bus,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "Karabük otobüsünün olduğu peronlara çık",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 5.0)),
                    child: ListTile(
                      leading: Icon(
                        Icons.directions_walk_sharp,
                        color: Colors.green,
                      ),
                      title: Text(
                        "Karabük otogarında indikten sonra otogarın ön cephesine yürü",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 5.0)),
                    child: ListTile(
                      leading: Icon(
                        Icons.directions_bus,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "100.yıl yazan herhangi bir araca binebilirsin",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 5.0)),
                    child: ListTile(
                      leading: Icon(
                        Icons.business,
                        color: Colors.brown,
                      ),
                      title: Text(
                        "Son durak: Karabük Üniversitesine ulaştınız",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ankaraRotation(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVeriables.bg,
      appBar: AppBar(
        title: Text(getTranslated(context, "Directions")),
        backgroundColor: UniversalVeriables.bg,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 5.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.airplanemode_active,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "Başlangıç Noktası: Esenboğa Havalimanı"
                        "                                                Varış Noktası: Karabük Üniversitesi",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  subtitle: Text("Lütfen aşağıdaki adımları takip ediniz",style: TextStyle(color: Colors.white),),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 5.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.directions_walk,
                    color: Colors.green,
                  ),
                  title: Text(
                    "Havalimanı - Dış Hatlar yönünde sola doğru dönün",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 5.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.bus_alert,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "442-K numaralı Kızılay(Güven Park) otobüsünü bekleyin",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  subtitle: Text(
                      "10 durak boyunca yolculuğa devam edin. Kızılay Güvenpark durağında inin",style: TextStyle(color: Colors.white),),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 5.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.directions_walk,
                    color: Colors.green,
                  ),
                  title: Text(
                    "Kızılay Güvenpark girişinden girin, 1 dk boyunca yürüyün",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  subtitle:
                  Text("Sola doğru dönün Milli Müdafaa Caddesi boyunca",style: TextStyle(color: Colors.white),),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 5.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.subway,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "Aşti metrosunu bekleyin",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  subtitle:
                  Text("7 durak boyunca gidin. Son durak Aşti de inin",style: TextStyle(color: Colors.white),),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 5.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.directions_bus,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "Karabük otobüsünün olduğu peronlara çıkın",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 5.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.directions_walk_sharp,
                    color: Colors.green,
                  ),
                  title: Text(
                    "Karabük otogarında indikten sonra otogarın ön girişine doğru yürüyün",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 5.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.directions_bus,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "100.yıl yazan herhangi bir araca binebilirsin",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 5.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.business,
                    color: Colors.brown,
                  ),
                  title: Text(
                    "Son durak: Karabük Üniversitesine ulaştınız",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}