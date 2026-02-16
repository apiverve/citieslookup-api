/// Response models for the Cities Lookup API.

/// API Response wrapper.
class CitieslookupResponse {
  final String status;
  final dynamic error;
  final CitieslookupData? data;

  CitieslookupResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory CitieslookupResponse.fromJson(Map<String, dynamic> json) => CitieslookupResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CitieslookupData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Cities Lookup API.

class CitieslookupData {
  String? search;
  List<CitieslookupDataFoundcitiesItem>? foundCities;

  CitieslookupData({
    this.search,
    this.foundCities,
  });

  factory CitieslookupData.fromJson(Map<String, dynamic> json) => CitieslookupData(
      search: json['search'],
      foundCities: (json['foundCities'] as List?)?.map((e) => CitieslookupDataFoundcitiesItem.fromJson(e)).toList(),
    );
}

class CitieslookupDataFoundcitiesItem {
  String? name;
  String? altName;
  String? country;
  String? featureCode;
  int? population;
  CitieslookupDataFoundcitiesItemLoc? loc;

  CitieslookupDataFoundcitiesItem({
    this.name,
    this.altName,
    this.country,
    this.featureCode,
    this.population,
    this.loc,
  });

  factory CitieslookupDataFoundcitiesItem.fromJson(Map<String, dynamic> json) => CitieslookupDataFoundcitiesItem(
      name: json['name'],
      altName: json['altName'],
      country: json['country'],
      featureCode: json['featureCode'],
      population: json['population'],
      loc: json['loc'] != null ? CitieslookupDataFoundcitiesItemLoc.fromJson(json['loc']) : null,
    );
}

class CitieslookupDataFoundcitiesItemLoc {
  String? type;
  List<double>? coordinates;

  CitieslookupDataFoundcitiesItemLoc({
    this.type,
    this.coordinates,
  });

  factory CitieslookupDataFoundcitiesItemLoc.fromJson(Map<String, dynamic> json) => CitieslookupDataFoundcitiesItemLoc(
      type: json['type'],
      coordinates: (json['coordinates'] as List?)?.cast<double>(),
    );
}

class CitieslookupRequest {
  String city;
  int? limit;

  CitieslookupRequest({
    required this.city,
    this.limit,
  });

  Map<String, dynamic> toJson() => {
      'city': city,
      if (limit != null) 'limit': limit,
    };
}
