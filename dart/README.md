# Cities Lookup API - Dart/Flutter Client

Cities Lookup is a simple tool for looking up city data. It returns the city name, population, and more.

[![pub package](https://img.shields.io/pub/v/apiverve_citieslookup.svg)](https://pub.dev/packages/apiverve_citieslookup)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Cities Lookup API](https://apiverve.com/marketplace/citieslookup?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_citieslookup: ^1.1.14
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
        "featureCode": "PPLA2",
        "population": 864816,
        "loc": {
          "type": "Point",
          "coordinates": [
            -122.41942,
            37.77493
          ]
        }
      },
      {
        "name": "San Francisco de Macorís",
        "altName": "",
        "country": "DO",
        "featureCode": "PPLA",
        "population": 124763,
        "loc": {
          "type": "Point",
          "coordinates": [
            -70.25259,
            19.30099
          ]
        }
      },
      {
        "name": "San Francisco del Rincón",
        "altName": "",
        "country": "MX",
        "featureCode": "PPLA2",
        "population": 71139,
        "loc": {
          "type": "Point",
          "coordinates": [
            -101.85515,
            21.01843
          ]
        }
      },
      {
        "name": "South San Francisco",
        "altName": "",
        "country": "US",
        "featureCode": "PPL",
        "population": 67271,
        "loc": {
          "type": "Point",
          "coordinates": [
            -122.40775,
            37.65466
          ]
        }
      },
      {
        "name": "San Francisco",
        "altName": "",
        "country": "AR",
        "featureCode": "PPLA2",
        "population": 59062,
        "loc": {
          "type": "Point",
          "coordinates": [
            -62.08266,
            -31.42797
          ]
        }
      },
      {
        "name": "San Francisco",
        "altName": "",
        "country": "CR",
        "featureCode": "PPL",
        "population": 55923,
        "loc": {
          "type": "Point",
          "coordinates": [
            -84.12934,
            9.99299
          ]
        }
      },
      {
        "name": "San Francisco El Alto",
        "altName": "",
        "country": "GT",
        "featureCode": "PPLA2",
        "population": 54493,
        "loc": {
          "type": "Point",
          "coordinates": [
            -91.4431,
            14.9449
          ]
        }
      },
      {
        "name": "San Francisco Acuautla",
        "altName": "",
        "country": "MX",
        "featureCode": "PPL",
        "population": 27960,
        "loc": {
          "type": "Point",
          "coordinates": [
            -98.86034,
            19.34564
          ]
        }
      },
      {
        "name": "San Francisco Cuaxusco",
        "altName": "",
        "country": "MX",
        "featureCode": "PPLX",
        "population": 24900,
        "loc": {
          "type": "Point",
          "coordinates": [
            -99.61925,
            19.26755
          ]
        }
      },
      {
        "name": "San Francisco Tlalcilalcalpan",
        "altName": "",
        "country": "MX",
        "featureCode": "PPL",
        "population": 16509,
        "loc": {
          "type": "Point",
          "coordinates": [
            -99.76771,
            19.29474
          ]
        }
      },
      {
        "name": "San Francisco",
        "altName": "",
        "country": "SV",
        "featureCode": "PPLA",
        "population": 16152,
        "loc": {
          "type": "Point",
          "coordinates": [
            -88.1,
            13.7
          ]
        }
      },
      {
        "name": "San Francisco de los Romo",
        "altName": "",
        "country": "MX",
        "featureCode": "PPLA2",
        "population": 16124,
        "loc": {
          "type": "Point",
          "coordinates": [
            -102.2714,
            22.07748
          ]
        }
      },
      {
        "name": "San Francisco Zapotitlán",
        "altName": "",
        "country": "GT",
        "featureCode": "PPLA2",
        "population": 13855,
        "loc": {
          "type": "Point",
          "coordinates": [
            -91.52144,
            14.58939
          ]
        }
      },
      {
        "name": "San Francisco Ocotlán",
        "altName": "",
        "country": "MX",
        "featureCode": "PPL",
        "population": 11636,
        "loc": {
          "type": "Point",
          "coordinates": [
            -98.28345,
            19.13411
          ]
        }
      },
      {
        "name": "San Francisco Tecoxpa",
        "altName": "",
        "country": "MX",
        "featureCode": "PPL",
        "population": 11456,
        "loc": {
          "type": "Point",
          "coordinates": [
            -99.00639,
            19.19167
          ]
        }
      },
      {
        "name": "San Francisco Telixtlahuaca",
        "altName": "",
        "country": "MX",
        "featureCode": "PPLA2",
        "population": 10618,
        "loc": {
          "type": "Point",
          "coordinates": [
            -96.90529,
            17.29684
          ]
        }
      },
      {
        "name": "San Francisco Tetlanohcan",
        "altName": "",
        "country": "MX",
        "featureCode": "PPLA2",
        "population": 9858,
        "loc": {
          "type": "Point",
          "coordinates": [
            -98.1637,
            19.2602
          ]
        }
      },
      {
        "name": "San Francisco Chimalpa",
        "altName": "",
        "country": "MX",
        "featureCode": "PPL",
        "population": 8953,
        "loc": {
          "type": "Point",
          "coordinates": [
            -99.34398,
            19.44279
          ]
        }
      },
      {
        "name": "Altos de San Francisco",
        "altName": "",
        "country": "PA",
        "featureCode": "PPL",
        "population": 8189,
        "loc": {
          "type": "Point",
          "coordinates": [
            -79.79,
            8.86167
          ]
        }
      },
      {
        "name": "San Francisco Zacacalco",
        "altName": "",
        "country": "MX",
        "featureCode": "PPL",
        "population": 7420,
        "loc": {
          "type": "Point",
          "coordinates": [
            -98.98279,
            19.92875
          ]
        }
      }
    ]
  }
}
```

## API Reference

- **API Home:** [Cities Lookup API](https://apiverve.com/marketplace/citieslookup?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/citieslookup](https://docs.apiverve.com/ref/citieslookup?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
