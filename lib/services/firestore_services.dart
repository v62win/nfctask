import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nfctask/models/tap_models.dart';


class FirestoreService {
  final CollectionReference tapsRef =
  FirebaseFirestore.instance.collection('taps');

  Future<void> saveTap(TapModel tap) async {
    await tapsRef.add(tap.toMap());
  }

  Stream<List<TapModel>> getTapHistory() {
    return tapsRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return TapModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
