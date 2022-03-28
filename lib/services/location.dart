import 'package:realtime_climate_tracker/screens/loading_screen.dart';
import 'package:geolocator/geolocator.dart';

class Location{
  double latitude =0 ;
  double longitude =0 ;

 Future<String> get_location()async{
   try {
   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   latitude = position.latitude;
   longitude = position.longitude;
   return '';
   }
   catch(e){
     print(e);
     return '';

   }

 }

}




