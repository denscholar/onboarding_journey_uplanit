import 'package:flutter/material.dart';
import 'package:uplanit_supplier/core/models/event_type.dart';
import 'package:uplanit_supplier/core/repository/repository.dart';
import 'package:uplanit_supplier/core/utils/locator.dart';

class EventTypeProvider extends ChangeNotifier {
  Repository repo = Repository();
  List<EventType> _eventTypeList = [];

  bool isEventTypeLoading = false;

  List<EventType> get eventTypeList => _eventTypeList;


  void loadEventType() async {
    isEventTypeLoading = true;
    List<EventType> eventTypeList = await repo.getEventTypes();

    isEventTypeLoading = false;
    _eventTypeList = eventTypeList;

    notifyListeners();
  }
}
