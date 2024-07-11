import '../models/get_event_model_class.dart';
import '../service/get_event_service.dart';

class EventRepository {
  final EventService _eventService;

  EventRepository(this._eventService);

  Future<List<Event>> getEvents() async {
    try {
      // You might add caching logic or data transformation here
      final events = await _eventService.fetchEvents();
      return events;
    } catch (e) {
      // You might want to handle errors or log them here
      throw Exception('Network Issue');
    }
  }
}
