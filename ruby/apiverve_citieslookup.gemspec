# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_citieslookup"
  spec.version       = "1.2.3"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "Cities Lookup API - Ruby Client"
  spec.description   = "Cities Lookup is a city search API that searches over 150,000 global cities to find country codes, population counts, and city size classifications by name. Paid plans add GeoJSON coordinates and custom match limits."
  spec.homepage      = "https://apiverve.com/marketplace/citieslookup?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/citieslookup-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/citieslookup"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
