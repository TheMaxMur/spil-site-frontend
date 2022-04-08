import 'package:web_app/widgets/projects_details/routing_data.dart';

extension StringExtensions on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    return RoutingData(
        route: uriData.path, queryParametrs: uriData.queryParameters);
  }
}
