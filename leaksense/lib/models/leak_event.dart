class LeakEvent {
  final String location;
  final String risk;
  final String distance;
  final String duration;
  final DateTime time;

  LeakEvent({
    required this.location,
    required this.risk,
    required this.distance,
    required this.duration,
    required this.time,
  });
}
