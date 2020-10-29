import 'package:uplanit_supplier/core/models/category.dart';
import 'package:uplanit_supplier/core/models/event_type.dart';
import 'package:uplanit_supplier/core/services/api_endpoint.dart';
import 'package:uplanit_supplier/core/services/api_service.dart';

class Repository {
  
  Future<List<Category>> getCategories() async {
    final response = await ApiService().fetchData(ApiEndpoint.categories);

    return categoryFromJson(response);
  }

  Future<List<EventType>> getEventTypes() async {
    final response = await ApiService().fetchData(ApiEndpoint.eventTypes);

    return eventTypeFromJson(response);
  }
}
