# Cities Lookup API - PHP Package

Cities Lookup is a city search API that searches over 150,000 global cities to find country codes, population counts, and city size classifications by name. Paid plans add GeoJSON coordinates and custom match limits.

## Installation

Install via Composer:

```bash
composer require apiverve/citieslookup
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Citieslookup\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'city' => 'San Francisco',
    'limit' => 1
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Citieslookup\Client;
use APIVerve\Citieslookup\Exceptions\APIException;
use APIVerve\Citieslookup\Exceptions\ValidationException;

try {
    $response = $client->execute(['city' => 'San Francisco', 'limit' => 1]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/citieslookup?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/citieslookup?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/citieslookup?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
