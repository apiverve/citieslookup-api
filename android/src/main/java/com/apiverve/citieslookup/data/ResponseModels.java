// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     CitiesLookupData data = Converter.fromJsonString(jsonString);

package com.apiverve.citieslookup.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static CitiesLookupData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(CitiesLookupData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(CitiesLookupData.class);
        writer = mapper.writerFor(CitiesLookupData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// CitiesLookupData.java

package com.apiverve.citieslookup.data;

import com.fasterxml.jackson.annotation.*;

public class CitiesLookupData {
    private String search;
    private FoundCity[] foundCities;

    @JsonProperty("search")
    public String getSearch() { return search; }
    @JsonProperty("search")
    public void setSearch(String value) { this.search = value; }

    @JsonProperty("foundCities")
    public FoundCity[] getFoundCities() { return foundCities; }
    @JsonProperty("foundCities")
    public void setFoundCities(FoundCity[] value) { this.foundCities = value; }
}

// FoundCity.java

package com.apiverve.citieslookup.data;

import com.fasterxml.jackson.annotation.*;

public class FoundCity {
    private String name;
    private String altName;
    private String country;
    private FeatureCode featureCode;
    private long population;
    private LOC loc;

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("altName")
    public String getAltName() { return altName; }
    @JsonProperty("altName")
    public void setAltName(String value) { this.altName = value; }

    @JsonProperty("country")
    public String getCountry() { return country; }
    @JsonProperty("country")
    public void setCountry(String value) { this.country = value; }

    @JsonProperty("featureCode")
    public FeatureCode getFeatureCode() { return featureCode; }
    @JsonProperty("featureCode")
    public void setFeatureCode(FeatureCode value) { this.featureCode = value; }

    @JsonProperty("population")
    public long getPopulation() { return population; }
    @JsonProperty("population")
    public void setPopulation(long value) { this.population = value; }

    @JsonProperty("loc")
    public LOC getLOC() { return loc; }
    @JsonProperty("loc")
    public void setLOC(LOC value) { this.loc = value; }
}

// FeatureCode.java

package com.apiverve.citieslookup.data;

import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum FeatureCode {
    PPL, PPLA, PPLA2, PPLX;

    @JsonValue
    public String toValue() {
        switch (this) {
            case PPL: return "PPL";
            case PPLA: return "PPLA";
            case PPLA2: return "PPLA2";
            case PPLX: return "PPLX";
        }
        return null;
    }

    @JsonCreator
    public static FeatureCode forValue(String value) throws IOException {
        if (value.equals("PPL")) return PPL;
        if (value.equals("PPLA")) return PPLA;
        if (value.equals("PPLA2")) return PPLA2;
        if (value.equals("PPLX")) return PPLX;
        throw new IOException("Cannot deserialize FeatureCode");
    }
}

// LOC.java

package com.apiverve.citieslookup.data;

import com.fasterxml.jackson.annotation.*;

public class LOC {
    private Type type;
    private double[] coordinates;

    @JsonProperty("type")
    public Type getType() { return type; }
    @JsonProperty("type")
    public void setType(Type value) { this.type = value; }

    @JsonProperty("coordinates")
    public double[] getCoordinates() { return coordinates; }
    @JsonProperty("coordinates")
    public void setCoordinates(double[] value) { this.coordinates = value; }
}

// Type.java

package com.apiverve.citieslookup.data;

import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum Type {
    POINT;

    @JsonValue
    public String toValue() {
        switch (this) {
            case POINT: return "Point";
        }
        return null;
    }

    @JsonCreator
    public static Type forValue(String value) throws IOException {
        if (value.equals("Point")) return POINT;
        throw new IOException("Cannot deserialize Type");
    }
}