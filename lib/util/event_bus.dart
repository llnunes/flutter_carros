import 'package:carros/bloc/SimpleBloc.dart';
import 'package:provider/provider.dart';

class Event {}

class EventBus extends SimpleBloc<Event> {
//  final _streamController = StreamController<Event>.broadcast();
//
//  Stream<Event> get stream => _streamController.stream;

  static EventBus get(context) => Provider.of<EventBus>(context, listen: false);

  sendEvent(Event event) {
    add(event);
  }

//  dispose() {
//    _streamController.close();
//  }
}
