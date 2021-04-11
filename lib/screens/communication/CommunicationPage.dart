import 'package:flutter/material.dart';
import 'package:kbu_app/localization/localization_constants.dart';
import 'package:kbu_app/utils/universal_veriables.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVeriables.bg,
      appBar: AppBar(
        title: Text(getTranslated(context,"Communication")),
        backgroundColor: UniversalVeriables.bg,
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Card(color: UniversalVeriables.bg,
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("image/konum1.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.blue,
                          size: 35,
                        ),
                        title: Text(
                          getTranslated(context, "Address:"),
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        subtitle: Text(
                            'Karabük Üniversitesi, Kastamonu Yolu Demir Çelik Kampüsü, 78050          Merkez/Karabük',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone_callback,
                          color: Colors.blue,
                          size: 35,
                        ),
                        title: Text(
                          getTranslated(context, "Communication"),
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        subtitle: Text('444 0 478',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.web,
                          color: Colors.blue,
                          size: 35,
                        ),
                        onTap: () => _launchURL(),
                        title: Text(
                          'Web',
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        subtitle: Text('www.karabuk.edu.tr',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  _launchURL() async {
    //FUTURE WİDGET YAPILMALI HATA VERMEMESİ İÇİN
    var url = 'https://www.karabuk.edu.tr/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}