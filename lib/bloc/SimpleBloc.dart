import 'dart:async';

class SimpleBloc<T> {

  final _streamController = new StreamController<T>();

  Stream<T> get stream => _streamController.stream;

  void add(T object) {
    _streamController.add(object);
  }

  void addError(T object) {
    if(! _streamController.isClosed) {
      _streamController.addError(object);
    }
  }

  void dispose() {
    _streamController.close();
  }
}

class BooleanBloc extends SimpleBloc<bool> {

}