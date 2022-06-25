# Weather App - Dart / Flutter

## Project Status ( Suspended - Askıya Alındı)

<table>
  <tr>
     <td><img src="https://user-images.githubusercontent.com/17275354/169695152-423d8751-d60f-4bf8-b89c-97b163b61a84.gif" alt="Suspended" width="300"></td>
  </tr> 
</table>

</br>

## Project Description

### Tr
Projede http kullanılarak, https://collectapi.com sitesindeki Hava Durumu API'sinden veri çekilmiştir. 5 günlük hava durumu verisi Tabbar kullanılarak ekrana çizilmiştir. Ayarlar sayfasından şehir ve veri dili ayarı yapılabilmektedir fakat şuan o kısmın arkaplanı çalışmıyor. En yakın zamanda eklenecektir.
</br>
### En
Using http in the project, data was retrieved from the Weather API on the https://collectapi.com site. 5 days of weather data is drawn on the screen using Tabbar. City and data language settings can be made from the settings page, but the background of that section is not working now. It will be added as soon as possible.



</br>

## Project Feature

#### Responsive Screen ✓
#### MVVM ✓
#### Clean Code ✓


</br>

## Using


#### Register on collectapi.com and get an api key from the weather api for free.

```js

   var response = await http.get(
        Uri.parse(
            'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=eskişehir'), //Paste Weather Api url
        headers: {
          'content-type': 'application/json',
          'authorization':
              'apikey .........................' //Paste Weather Api apikey
        });
        
```



</br>

## Project Screenshots

<table>

  <tr>
    <td><img src="https://user-images.githubusercontent.com/17275354/175790973-a21a384b-8f86-4359-b266-fdd91cfd6d0d.jpeg" width="350" title="hover text"></td>
    <td><img src="https://user-images.githubusercontent.com/17275354/175790976-dde2886e-3ced-4de6-a0ed-45834c3aaa29.jpeg" width="350" title="hover text"></td>
    <td><img src="https://user-images.githubusercontent.com/17275354/175790978-5e8f9715-db1b-46d5-802e-581a80126656.jpeg" width="350" title="hover text"></td>
  </tr>
  
  
  
</table>
  
  
 

