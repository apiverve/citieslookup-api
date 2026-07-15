declare module '@apiverve/citieslookup' {
  export interface citieslookupOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface citieslookupResponse {
    status: string;
    error: string | null;
    data: CitiesLookupData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface CitiesLookupData {
      search:      null | string;
      foundCities: FoundCity[];
  }
  
  interface FoundCity {
      name:               null | string;
      altName:            null | string;
      country:            null | string;
      countryName:        null | string;
      featureCode:        null | string;
      population:         number | null;
      populationCategory: null | string;
      loc:                LOC;
  }
  
  interface LOC {
      type:        null | string;
      coordinates: (number | null)[];
  }

  export default class citieslookupWrapper {
    constructor(options: citieslookupOptions);

    execute(callback: (error: any, data: citieslookupResponse | null) => void): Promise<citieslookupResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: citieslookupResponse | null) => void): Promise<citieslookupResponse>;
    execute(query?: Record<string, any>): Promise<citieslookupResponse>;
  }
}
