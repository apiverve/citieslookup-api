# Cities Lookup API - Dart/Flutter Client

Cities Lookup is a city search API that searches over 150,000 global cities to find country codes, population counts, and city size classifications by name. Paid plans add GeoJSON coordinates and custom match limits.

[![pub package](https://img.shields.io/pub/v/apiverve_citieslookup.svg)](https://pub.dev/packages/apiverve_citieslookup)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Cities Lookup API](https://apiverve.com/marketplace/citieslookup?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_citieslookup: ^1.2.3
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_citieslookup/apiverve_citieslookup.dart';

void main() async {
  final client = CitieslookupClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'city': 'San Francisco',
      'limit': 1
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "search": "San Francisco",
    "foundCities": [
      {
        "name": "San Francisco",
        "altName": "",
        "country": "US",
        "countryName": "United States",
        "featureCode": "PPLA2",
        "population": 874961,
        "populationCategory": "major",
        "loc": {
          "type": "Point",
          "coordinates": [
            -122.4194,
            37.7749
          ]
        }
      }
    ]
  }
}
```

## API Reference

- **API Home:** [Cities Lookup API](https://apiverve.com/marketplace/citieslookup?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/citieslookup](https://docs.apiverve.com/ref/citieslookup?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
