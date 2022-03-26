import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

void main() => runApp(MaterialApp(
      title: "Weather App",
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var feels;

  Future getWeather() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$selectedsehir&units=imperial&appid=3de1590440fdbbbb6e6b22358c85c6e0"));
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
      this.feels = results['main']['feels_like'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  List<String> sehirler = [
    "adana",
    "adiyaman",
    "afyonkarahisar",
    "agri",
    "aksaray",
    "amasya",
    "ankara",
    "antalya",
    "ardahan",
    "artvin",
    "aydin",
    "balikesir",
    "bartin",
    "batman",
    "bayburt",
    "bilecik",
    "bingol",
    "bitlis",
    "bolu",
    "burdur",
    "bursa",
    "canakkale",
    "cankiri",
    "corum",
    "denizli",
    "diyarbakir",
    "duzce",
    "edirne",
    "elazig",
    "erzincan",
    "erzurum",
    "eskisehir",
    "gaziantep",
    "giresun",
    "gumushane",
    "hakkari",
    "hatay",
    "igdir",
    "isparta",
    "istanbul",
    "izmir",
    "kahramanmaras",
    "karabuk",
    "karaman",
    "kars",
    "kastamonu",
    "kayseri",
    "kilis",
    "kirikkale",
    "kirklareli",
    "kirsehir",
    "kocaeli",
    "konya",
    "kutahya",
    "malatya",
    "manisa",
    "mardin",
    "mersin",
    "mugla",
    "mus",
    "nevsehir",
    "nigde",
    "ordu",
    "osmaniye",
    "rize",
    "sakarya",
    "samsun",
    "sanliurfa",
    "siirt",
    "sinop",
    "sivas",
    "sirnak",
    "tekirdag",
    "tokat",
    "trabzon",
    "tunceli",
    "usak",
    "van",
    "yalova",
    "yozgat",
    "zonguldak"
  ];
  String selectedsehir = "istanbul";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          "Weather app",
          style: TextStyle(
              fontSize: 30, letterSpacing: 2.5, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple,
                Colors.blue,
                Colors.purple,
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                        toBeginningOfSentenceCase("$selectedsehir").toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 50.0)),
                  ),
                  Text(
                    temp != null
                        ? (5 / 9 * (temp - 32)).round().toString() + "\u00B0C"
                        : "Yükleniyor",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      currently != null ? currently.toString() : "Yükleniyor",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DropdownButton<String>(
                    alignment: Alignment.center,
                    menuMaxHeight: 200,
                    borderRadius: BorderRadius.circular(10),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    value: selectedsehir,
                    items: List.generate(
                        sehirler.length,
                        (index) => DropdownMenuItem(
                            alignment: Alignment.center,
                            value: sehirler[index],
                            child: Text(sehirler[index]))),
                    onChanged: (newValue) {
                      setState(
                        () {
                          selectedsehir = newValue.toString();
                          getWeather();
                        },
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.thermometerHalf,
                        size: 30,
                      ),
                      title: Text(
                        "Sıcaklık",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        temp != null
                            ? (5 / 9 * (temp - 32)).round().toString() +
                                "\u00B0 C"
                            : "Yükleniyor",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.cloud),
                      title: Text("Hava",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      trailing: Text(
                          description != null
                              ? description.toString()
                              : "Yükleniyor",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.sun),
                      title: Text("Sıcaklık Nem",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      trailing: Text(
                          humidity != null
                              ? "%" + humidity.toString()
                              : "Yükleniyor",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.wind),
                      title: Text("Rüzgar Hızı",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      trailing: Text(
                          windSpeed != null
                              ? windSpeed.toString() + " Km"
                              : "Yükleniyor",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.faceSmile,
                        size: 30,
                      ),
                      title: Text(
                        "Hissedilen",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        temp != null
                            ? (5 / 9 * (feels - 32)).round().toString() +
                                "\u00B0 C"
                            : "Yükleniyor",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
