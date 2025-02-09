import 'package:nfctask/services/firestore_services.dart';
import 'package:nfctask/models/tap_models.dart';

class HistoryViewModel {
  final FirestoreService _firestoreService = FirestoreService();

  Stream<List<TapModel>> getTapHistory() {
    return _firestoreService.getTapHistory();
  }
}
