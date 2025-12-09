declare module '@apiverve/citieslookup' {
  export interface citieslookupOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface citieslookupResponse {
    status: string;
    error: string | null;
    data: CitiesLookupData;
    code?: number;
  }


  interface CitiesLookupData {
      search:      string;
      foundCities: FoundCity[];
  }
  
  interface FoundCity {
      name:        string;
      altName:     string;
      country:     string;
      featureCode: FeatureCode;
      population:  number;
      loc:         LOC;
  }
  
  enum FeatureCode {
      Ppl = "PPL",
      Ppla = "PPLA",
      Ppla2 = "PPLA2",
      Pplx = "PPLX",
  }
  
  interface LOC {
      type:        Type;
      coordinates: number[];
  }
  
  enum Type {
      Point = "Point",
  }

  export default class citieslookupWrapper {
    constructor(options: citieslookupOptions);

    execute(callback: (error: any, data: citieslookupResponse | null) => void): Promise<citieslookupResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: citieslookupResponse | null) => void): Promise<citieslookupResponse>;
    execute(query?: Record<string, any>): Promise<citieslookupResponse>;
  }
}
