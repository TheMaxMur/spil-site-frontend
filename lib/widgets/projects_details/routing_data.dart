class RoutingData {
  final String route;
  final Map<String, String> _queryParametrs;

  RoutingData({
    required this.route,required Map<String, String> queryParametrs,
  }) : _queryParametrs = queryParametrs;

  operator[](String key) => _queryParametrs[key];
}