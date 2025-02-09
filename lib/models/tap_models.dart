class TapModel {
  final String cardData;
  final double latitude;
  final double longitude;
  final DateTime timestamp;

  TapModel({
    required this.cardData,
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'card_data': cardData,
      'location': {
        'latitude': latitude,
        'longitude': longitude,
      },
      'timestamp': timestamp.toIso8601String(),
    };
  }

  static TapModel fromMap(Map<String, dynamic> map) {
    return TapModel(
      cardData: map['card_data'],
      latitude: map['location']['latitude'],
      longitude: map['location']['longitude'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
