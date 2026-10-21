# Cities Lookup API - Ruby Gem

Cities Lookup is a city search API that searches over 150,000 global cities to find country codes, population counts, and city size classifications by name. Paid plans add GeoJSON coordinates and custom match limits.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_citieslookup'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_citieslookup
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_citieslookup'

# Initialize the client
client = APIVerve::Citieslookup::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  city: "San Francisco",
  limit: 1
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ city: "San Francisco", limit: 1 })
  puts response["data"]
rescue APIVerve::Citieslookup::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Citieslookup::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Citieslookup::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/citieslookup?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/citieslookup?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/citieslookup?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
