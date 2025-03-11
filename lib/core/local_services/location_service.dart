import 'package:amicus/core/local_services/message_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
class MyLocationService{


  static Future<Position?> requestLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      MessageService.showSnackBar(message: "Please Enable Location Services in Your Phone Settings", isSuccess: false);
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();


     if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied.');
      }
    }


    if (permission == LocationPermission.deniedForever) {

      openAppSettings();
      return Future.error('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }



  Future<void> openAppSettingsIfDenied() async {
    if (await Permission.location.isPermanentlyDenied) {
      await openAppSettings();  // Opens app settings
    }
  }
}