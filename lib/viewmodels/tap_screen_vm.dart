import 'package:nfctask/models/tap_models.dart';
import 'package:nfctask/services/firestore_services.dart';
import 'package:nfctask/services/geolocator_services.dart';
import 'package:nfctask/services/nfc_manager_services.dart';

class TapCardViewModel {
  final FirestoreService _firestoreService = FirestoreService();
  final LocationService _locationService = LocationService();
  final NfcService _nfcService = NfcService();

  Future<void> processDummyTapData() async {
    try {
      final tap = TapModel(
        cardData: "Mock NFC Data",
        latitude: 37.7749,
        longitude: -122.4194,
        timestamp: DateTime.now(),
      );

      await _firestoreService.saveTap(tap);
    } catch (e) {
      print("Error processing dummy NFC tap: $e");
    }
  }


  Future<void> processNfcTap() async {
    try {
      final cardData = await _nfcService.readNfcTag();
      final location = await _locationService.getCurrentLocation();

      final tap = TapModel(
        cardData: cardData,
        latitude: location.latitude,
        longitude: location.longitude,
        timestamp: DateTime.now(),
      );

      await _firestoreService.saveTap(tap);
    } catch (e) {
      print("Error processing NFC tap: $e");
      throw Exception("NFC processing failed: $e");
    }
  }

  Future<String> processFakeCardTap(String s) async {
    try {
      final location = await _locationService.getCurrentLocation();

      final tap = TapModel(
        cardData: s,
        latitude: location.latitude,
        longitude: location.longitude,
        timestamp: DateTime.now(),
      );

      await _firestoreService.saveTap(tap);
      return "Fake card data processed and saved successfully!";
    } catch (e) {
      throw Exception("Error processing fake card tap: $e");
    }
  }
}
