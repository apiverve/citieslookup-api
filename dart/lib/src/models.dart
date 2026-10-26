/// Response models for the Cities Lookup API.

/// API Response wrapper.
class CitieslookupResponse {
  final String status;
  final dynamic error;
  final CitieslookupData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  CitieslookupResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory CitieslookupResponse.fromJson(Map<String, dynamic> json) => CitieslookupResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CitieslookupData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
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
  String? countryName;
  String? featureCode;
  num? population;
  String? populationCategory;
  CitieslookupDataFoundcitiesItemLoc? loc;

  CitieslookupDataFoundcitiesItem({
    this.name,
    this.altName,
    this.country,
    this.countryName,
    this.featureCode,
    this.population,
    this.populationCategory,
    this.loc,
  });

  factory CitieslookupDataFoundcitiesItem.fromJson(Map<String, dynamic> json) => CitieslookupDataFoundcitiesItem(
      name: json['name'],
      altName: json['altName'],
      country: json['country'],
      countryName: json['countryName'],
      featureCode: json['featureCode'],
      population: json['population'],
      populationCategory: json['populationCategory'],
      loc: json['loc'] != null ? CitieslookupDataFoundcitiesItemLoc.fromJson(json['loc']) : null,
    );
}

class CitieslookupDataFoundcitiesItemLoc {
  String? type;
  List<num>? coordinates;

  CitieslookupDataFoundcitiesItemLoc({
    this.type,
    this.coordinates,
  });

  factory CitieslookupDataFoundcitiesItemLoc.fromJson(Map<String, dynamic> json) => CitieslookupDataFoundcitiesItemLoc(
      type: json['type'],
      coordinates: (json['coordinates'] as List?)?.cast<num>(),
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
