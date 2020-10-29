class ApiEndpoint {
  static final ApiEndpoint _singleton = ApiEndpoint();
  static ApiEndpoint get instance => _singleton;

  static final String categories = "/category";
  static final String eventTypes = "/event-types";
}
