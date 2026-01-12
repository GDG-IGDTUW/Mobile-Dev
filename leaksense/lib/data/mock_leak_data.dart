import '../models/leak_event.dart';

final List<LeakEvent> mockLeaks = [
  LeakEvent(
    location: 'Bathroom Pipe',
    risk: 'High',
    distance: '1.8 m',
    duration: '2 hours',
    time: DateTime.now().subtract(const Duration(hours: 3)),
  ),
  LeakEvent(
    location: 'Kitchen Sink',
    risk: 'Medium',
    distance: '0.9 m',
    duration: '45 mins',
    time: DateTime.now().subtract(const Duration(days: 1)),
  ),
];
