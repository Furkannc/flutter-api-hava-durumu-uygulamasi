**Flutter ile api kullanarak hava durumu uygulaması**
***

***Cihazın internet erişimine izin vermek için:
AndroidManifest.xml içerisine yazmanız gereken kod***
![internetpermisson](https://github.com/Furkannc/flutter-api-hava-durumu-uygulamasi/blob/main/images/internet_permisson.png?raw=true)
***

***Http ve icon paketlerini eklemek için  pubspec.yaml dosyası içine dependices satırı altına eklemeniz gereken kodlar***
![dependencices](https://github.com/Furkannc/flutter-api-hava-durumu-uygulamasi/blob/main/images/dependencies.png?raw=true)
***

***Api key almak için aşağıdaki siteyi kullanabilirsiniz***
https://openweathermap.org/current
***
***Api key'i bu kısma yazarak kullanamaya başlayabilirsiniz***

    http.Response  response = await  http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$selectedsehir&units=imperial&appid= {HERE API KEY} "));
***
**Uygulama içi görseller**


![enter image description here](https://github.com/Furkannc/flutter-api-hava-durumu-uygulamasi/blob/main/images/1.png?raw=true)

![enter image description here](https://github.com/Furkannc/flutter-api-hava-durumu-uygulamasi/blob/main/images/2.png?raw=true)
