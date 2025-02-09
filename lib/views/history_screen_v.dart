import 'package:flutter/material.dart';
import 'package:nfctask/viewmodels/history_screen_vm.dart';
import 'package:nfctask/models/tap_models.dart';

class HistoryView extends StatelessWidget {
  final HistoryViewModel _viewModel = HistoryViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tap History")),
      body: Center(
        child: StreamBuilder<List<TapModel>>(
          stream: _viewModel.getTapHistory(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text("No data found");
            }

            final taps = snapshot.data!;
            return ListView.builder(
              itemCount: taps.length,
              itemBuilder: (context, index) {
                final tap = taps[index];
                return ListTile(
                  title: Text("Card: ${tap.cardData}"),
                  subtitle: Text(
                    "Location: ${tap.latitude}, ${tap.longitude}\nTime: ${tap.timestamp}",
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
