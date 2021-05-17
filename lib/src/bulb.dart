class Bulb {
  String id;
  bool connected;

  Bulb({
    required this.id,
    required this.connected,
  });

  factory Bulb.fromJson(Map<String, dynamic> json) {
    return Bulb(
      id: json["id"],
      connected: json["connected"],
    );
  }
}
