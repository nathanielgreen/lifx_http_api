class Selector {
  final String value;

  const Selector([this.value = 'all']);

  factory Selector.label(String label) => Selector('label:$label');

  factory Selector.id(String id) => Selector('id:$id');
}
