import 'package:flutter/material.dart';
import 'package:nfctask/viewmodels/tap_screen_vm.dart';
import 'package:nfctask/services/nfc_manager_services.dart';

class TapScreenView extends StatefulWidget {
  const TapScreenView({super.key});

  @override
  State<TapScreenView> createState() => _TapScreenViewState();
}

class _TapScreenViewState extends State<TapScreenView> {
  final TapCardViewModel _viewModel = TapCardViewModel();
  final NfcService _nfcService = NfcService();
  String _statusMessage = "Tap an NFC card to read";
  bool _isNfcAvailable = false;

  @override
  void initState() {
    super.initState();
    _checkNfcAvailability();
  }

  Future<void> _checkNfcAvailability() async {
    try {
      bool isAvailable = await _nfcService.isNfcAvailable();
      setState(() {
        _isNfcAvailable = isAvailable;
        _statusMessage = isAvailable
            ? "NFC is available on this device. Tap a card."
            : "NFC not available. Tap the card above to scan.";
      });
    } catch (e) {
      setState(() {
        _statusMessage = "Error checking NFC: ${e.toString()}";
      });
    }
  }

  void _handleNfcTap() async {
    setState(() {
      _statusMessage = "Processing NFC tap...";
    });

    try {
      await _viewModel.processNfcTap();
      setState(() {
        _statusMessage = "NFC data processed and saved successfully!";
      });
    } catch (e) {
      setState(() {
        _statusMessage = e.toString();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  void _handleFakeCardTap(String scannedData) async {
    try {
      final message = await _viewModel.processFakeCardTap(scannedData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NFC Card')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_isNfcAvailable)
              GestureDetector(
                onLongPress:(){
                  //for ocr if your device does not have nfc support you can scan and register your card but my 48 hours are about to over i ll implent it later :)
                }
                ,
                onTap: () => _handleFakeCardTap("FakeCard123"),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.blue.shade700,
                  child: Container(
                    width: 300,
                    height: 180,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade700, Colors.blue.shade400],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.credit_card, color: Colors.white),
                            const SizedBox(width: 8),
                            const Text(
                              'Credit Card',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          '**** **** **** 1234',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'John Doe',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Text(
              _statusMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            if (_isNfcAvailable)
              GestureDetector(
                onTap: _handleNfcTap,
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.blue.shade700,
                  child: Container(
                    width: 300,
                    height: 180,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade700, Colors.blue.shade400],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Icon(Icons.nfc, size: 100, color: Colors.white),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
