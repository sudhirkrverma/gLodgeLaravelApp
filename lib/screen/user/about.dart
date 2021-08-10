import 'package:flutter/material.dart';

class About extends StatelessWidget {
  // const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About District'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 5.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'About District',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'The East Siang District is a wild mountainous area and presents a remarkable topographical variety. The District has an area of 4005 sq.km. and is lying approximately between 27º 43′ and 29º20′ North latitudes and 94º 42′ and 95º 35′ East latitudes. The Name of the district is derived from the Mighty River Siang that, originating from Tibet, where it is called Tsangpo, transcends down and flows through the entire length of the area until it descends down into the plains of Asam south of Pasighat town, where it meets Dihang and Lohit and becomes the Brahmaputra. The Pasighat town, the headquarter of the East Siang District, is situated at an altitude of 155 metres above main sea level and is the oldest town in Arunachal Pradesh – established in 1911 A.D. A political Officer was appointed in that year with a view to help the natives of the area to come down to the plains of Assam for trade and commerce. It would not be wrong to say, therefore, that the people of East Siang District were the first natives of the state to come in contact with the mainstream. Therefore this district is called as `the gateway to Arunachal Pradesh’. The mighty Siang river is the life-line of the East Siang District and in Pasighat, it calms down before entering Assam south of Pasighat. The town covers an area of 4005 sq.kms. and supports a population of nearly eighty thousand persons.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
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
                    'Our People',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'The East Siang District is mostly populated by the Adi tribe which comprise of a large number of tribal groups and can be divided into various subgroups such as the Minyongs, Padams, Shimongs, Milangs, Pasis, Karkos, Ashings, Pangis, Tangmas and Boris. The Adis belong to the Astro-Mongolide race and are good looking, sturdy and vigorous. According to Griession’s linguistic classification, the language spoken in East Siang District are put together under the North-Assam group of the Tibeto-Burmese group. There are various theories regarding the original home of the Adis; however it seems probable that they came to their present habitat from the north i.e. Tibet. River Siang had a major role in determining the route of migration of most of the Adi clans. However, the exact location of their original home in Tibet or beyond that is still to be ascertained. The society in East Siang, like most parts of the state, is organized on the basis of clan and village and the social relationships are determined on the basis of kinship or locality. The family, called rutum, is the smallest social unit. The society is basically patrilineal and patriarchal and the sons inherit the property. One outstanding feature of the Adi society that sets it aside from the mainland is the absence of the caste system. Of course, there are some social distinctions, but all people eat together on social occasion and take their part in social councils. Any mention of the Adi community of the district will not be complete without giving a brief account of the system of local-self government called Kebang. These village councils are time-honored socio-political institutions deriving their authority from tradition. They function as village governments expressing the will and power of the members of the society. The functions of these Kebangs are three-fold – judicial, administrative and developmental.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
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
                    'Art & Culture',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Dances are an integral part of the lives of the people of East Siang. These dances are simple, rythmic, colourful and participative. Some of the famous dances are:',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Ponung',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Popir',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Dishang',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Tapu',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
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
                    'Hotels',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'These are available hotels in town of Pasighat. The details are given below:',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Aane Hotel',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Serene Hotel',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Paane Hotel',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Hotel East',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Hotel Donyo Polo',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Siang Hotel',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Hotel Payeng',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
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
                    'Subdivision & Blocks',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'There are 4 (four) Blocks in East Siang District and they are :',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Mebo',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nari Koyu',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Pasighat',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Ruksin',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
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
                    'Police',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'There are 5(Five) Police Station in East Siang District: ',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Pasighat Police Station',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Ruksin Police Station',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Mebo Police Station',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Oyan Police Station',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\u2022 Nari Police Station',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
