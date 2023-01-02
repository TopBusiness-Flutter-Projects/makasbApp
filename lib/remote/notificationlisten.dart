import 'package:rxdart/rxdart.dart';



class NotificationsBloc {
  NotificationsBloc._internal();

  static final NotificationsBloc instance = NotificationsBloc._internal();

  final BehaviorSubject<String> _notificationsStreamController = BehaviorSubject<String>();

  Stream<String> get notificationsStream {
    return _notificationsStreamController;
  }

  void newNotification(String notification) {
    _notificationsStreamController.sink.add(notification);
  }

  void dispose() {
    _notificationsStreamController?.close();
  }
}