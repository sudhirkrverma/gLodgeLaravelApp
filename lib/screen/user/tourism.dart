import 'package:flutter/material.dart';

class Tourism extends StatelessWidget {
  // const Gallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourism Places'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Raneghat Bridge & Selfie Point',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(
                  "asset/gallery/Raneghat.jpg",
                  // height: 150.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'It is one of the most visited spots in Pasighat not only for the tourists but also for the locals. With the construction of the Raneghat Bridge, transportation has become easier and pleasant. A great picnic spot and a perfect getaway from the crowd of Pasighat town and enjoy beautiful sunsets.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest PS: Pasighat Police Station around 09 KMS.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest Hospital: Pasighat General hospital around 06 kms approx.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest administrative office: Office of the Deputy Commissioner around 10 kms approx.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest bus stand: Pasighat. Nearest railway station: Murkongselek station.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Bodak',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(
                  "asset/gallery/bodak.jpg",
                  // width: 800,
                  // height: 500,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'It is an ideal place for sightseeing and angling. The road to Bodak is breathtaking and best for visitors especially those who are interested in cycling and enjoying the view of the Siang River.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest PS: Pasighat Police Station around 09 KMS.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest Hospital: Pasighat General hospital around 06 kms approx.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest administrative office: Office of the Deputy Commissioner around 10 kms approx.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest bus stand: Pasighat. Nearest railway station: Murkongselek station.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Komlighat',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(
                  "asset/gallery/komlighat.jpg",
                  // width: 800,
                  // height: 500,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Another great picnic spot by the bank of the Mighty River Siang. Here one can enjoy the cool evening breeze with friends and family. After dark, one can see lights shining in houses in Mebo village nestled in the hills located on the left bank of the River Siang. Bollywood film”Rangoon” and other film industries from north east has shot many films in this place.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest PS: Pasighat Police Station around 09 KMS.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest Hospital: Pasighat General hospital around 06 kms approx.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest administrative office: Office of the Deputy Commissioner around 10 kms approx.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest bus stand: Pasighat. Nearest railway station: Murkongselek station.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Pongging hanging bridge',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(
                  "asset/gallery/bridge.jpeg",
                  // width: 800,
                  // height: 500,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Located just approximately 10 kms from Bodak village, one can trek down to Pongging village crossing the hanging bridge. The bridge is made of metal and bamboo frame and is the only way of transportation for the village.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest PS: Mebo Police Station around 09 KMS.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest Hospital: Mebo Community Health Centre.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest administrative office: Office of the Sub divisional Officer, Mebo',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest bus stand: Pasighat. Nearest railway station: Murkongselek station.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sirki Waterfall',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(
                  "asset/gallery/sirki.jpeg",
                  // width: 800,
                  // height: 500,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'It is located at a distance of approx 10 kms from Pasighat, it is a must visit to enjoy adventurous trek and witness the marvel of nature.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest PS: Pasighat Police Station around 09 KMS.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest Hospital: Pasighat General hospital around 06 kms approx.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest administrative office: Office of the Deputy Commissioner around 10 kms approx.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest bus stand: Pasighat. Nearest railway station: Murkongselek station.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Dangoria Baba Mandir',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(
                  "asset/gallery/mandir.jpg",
                  // width: 800,
                  // height: 500,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'The Mandir organizes a fair which is celebrated in the last Saturday of December every year. It is celebrated with great pomp and gaiety which draws as many as 15, 000 devotees from across the country every year.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest PS: Mebo Police Station around 09 KMS.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest Hospital: Mebo Community Health Centre.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest administrative office: Office of the Sub divisional Officer, Mebo',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nearest bus stand: Pasighat. Nearest railway station: Murkongselek station.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
