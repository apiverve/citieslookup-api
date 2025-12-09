using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.CitiesLookup
{
    /// <summary>
    /// Query options for the Cities Lookup API
    /// </summary>
    public class CitiesLookupQueryOptions
    {
        /// <summary>
        /// The city name for which you want to get the data (e.g., New York)
        /// Example: San Francisco
        /// </summary>
        [JsonProperty("city")]
        public string City { get; set; }
    }
}
