enum ServiceType {
  pickup(value: 'pickup'),
  dropoff(value: 'drop-off');

  const ServiceType({required this.value});

  final String value;
}
