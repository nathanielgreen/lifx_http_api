enum Power { on, off }

class Color {
  double hue;
  double saturation;
  int kelvin;

  Color({required this.hue, required this.saturation, required this.kelvin});
}

class Bulb {
  String id;
  String uuid;
  String label;
  bool connected;
  Power power;
  Color color;
  double brightness;

  Bulb({
    required this.id,
    required this.uuid,
    required this.label,
    required this.connected,
    required this.power,
    required this.color,
    required this.brightness,
  });

  factory Bulb.fromJson(Map<String, dynamic> json) {
    return Bulb(
      id: json["id"],
      uuid: json["uuid"],
      label: json["label"],
      connected: json["connected"],
      power: json["power"],
      color: json["color"],
      brightness: json["brightness"],
    );
  }
}
