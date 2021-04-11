import 'package:flutter/material.dart';
import 'package:kbu_app/utils/universal_veriables.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        backgroundColor: UniversalVeriables.bg,
      ),
      backgroundColor: UniversalVeriables.bg,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(
                          'KARABÜK ÜNİVERSİTESİ ÖN LİSANS-LİSANS ULUSLARARASI ÖĞRENCİLERİN BAŞVURU, KABUL VE KAYIT YÖNERGESİ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Gerekli İşlem Adımları:',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.arrow_circle_down,
                              color: Colors.grey,
                              size: 35,
                            ),
                            title: Text(
                              'Başvuru Koşulları' +
                                  "\n" +
                                  'Kontenjanların Belirlenmesi' +
                                  "\n" +
                                  'Başvuruların Değerlendirilmesi' +
                                  "\n" +
                                  'KBU-ULOS' +
                                  "\n" +
                                  'Yerleştirme' +
                                  "\n" +
                                  'Katkı Payı/Öğrenim Ücreti' +
                                  "\n" +
                                  'Öğrenim Vizesi' +
                                  "\n" +
                                  'Kayıt Evrakları' +
                                  "\n" +
                                  'Genel Sağlık Sigortası ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: RaisedButton(
                            color: Colors.grey,
                            elevation: 10,
                            child: Text(
                              "Ayrıntıları Görmek için Tıklayınız",
                              style:
                              TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            onPressed: () => _launchURL(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _launchURL() async {
    const url = 'https://www.karabuk.edu.tr/belgeler/ybu_yonergeturkce.pdf';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
