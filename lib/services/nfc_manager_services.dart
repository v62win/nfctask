import 'package:nfc_manager/nfc_manager.dart';


class NfcService {

  Future<bool> isNfcAvailable() async {
    return await NfcManager.instance.isAvailable();
  }

  Future<String> readNfcTag() async {
    if (!await NfcManager.instance.isAvailable()) {
      throw Exception('NFC is not available on this device.');
    }

    String cardData = '';
    await NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      try {
        final ndef = Ndef.from(tag);
        if (ndef != null && ndef.cachedMessage != null) {
          cardData = ndef.cachedMessage!.records.first.payload.toString();
        }
      } catch (e) {
        throw Exception('Failed to read NFC tag: $e');
      } finally {
        NfcManager.instance.stopSession();
      }
    });

    if (cardData.isEmpty) {
      throw Exception('No NFC data found.');
    }

    return cardData;
  }
}
