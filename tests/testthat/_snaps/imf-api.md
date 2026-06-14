# DSD resolution reports missing or malformed structures

    Code
      list_dimensions("NOT_A_DATAFLOW")
    Condition
      Error:
      ! Dataflow `IMF.STA:NOT_A_DATAFLOW` was not found.

# list_dimension_values rejects unknown dimensions

    Code
      list_dimension_values("CPI", "NOT_A_DIMENSION")
    Condition
      Error:
      ! Unknown dimension `NOT_A_DIMENSION`. Available dimensions: COUNTRY, INDEX_TYPE, COICOP_1999, TYPE_OF_TRANSFORMATION, FREQUENCY, TIME_PERIOD.

# parse_data_message rejects malformed indexed payloads

    Code
      parse_data_message(short_key)
    Condition
      Error:
      ! Malformed SDMX response: key `0` contains 1 indices but its structure declares 2 dimensions.

---

    Code
      parse_data_message(out_of_bounds)
    Condition
      Error:
      ! Malformed SDMX response: The index for dimension `COUNTRY` points outside its declared values.

---

    Code
      parse_data_message(bad_structure)
    Condition
      Error:
      ! Malformed SDMX response: a data structure index points outside the structures array.

# indexed value helpers reject invalid positions

    Code
      dimension_value(dimension, "bad")
    Condition
      Error:
      ! Malformed SDMX response: The index for dimension `COUNTRY` must be a non-negative whole number.

---

    Code
      dimension_value(dimension, .Machine$integer.max)
    Condition
      Error:
      ! Malformed SDMX response: The index for dimension `COUNTRY` is too large.

---

    Code
      decode_key(1L, list(dimension))
    Condition
      Error:
      ! Malformed SDMX response: An indexed key is not one character value.

# parse_data_message rejects non-numeric measures

    Code
      parse_data_message(response)
    Condition
      Error:
      ! Malformed SDMX response: measure `OBS_VALUE` contains non-numeric value "not-a-number".

# parse_data_message handles empty and malformed message shapes

    Code
      parse_data_message(response)
    Condition
      Error:
      ! Malformed SDMX response: data sets were returned without a structure.

---

    Code
      parse_data_message(response)
    Condition
      Error:
      ! Malformed SDMX response: the series collection contains an unkeyed series.

---

    Code
      parse_data_message(response)
    Condition
      Error:
      ! Malformed SDMX response: a series contains an observation without an indexed key.

---

    Code
      parse_data_message(response)
    Condition
      Error:
      ! Malformed SDMX response: an observation is not an indexed value array.

# get_data returns a typed empty result

    Code
      result <- get_data("CPI", filters = list(COUNTRY = "ZZZ", INDEX_TYPE = "CPI",
        COICOP_1999 = "_T", TYPE_OF_TRANSFORMATION = "IX", FREQUENCY = "M"))
    Condition
      Warning:
      No observations matched the query.

# get_data validates requested attributes

    Code
      get_data("CPI", filters = list(COUNTRY = "USA", INDEX_TYPE = "CPI",
        COICOP_1999 = "_T", TYPE_OF_TRANSFORMATION = "IX", FREQUENCY = "M"),
      last_n_obs = 1, attributes = "UNKNOWN")
    Condition
      Error:
      ! Unknown attributes: UNKNOWN. Available attributes: SCALE, DECIMALS_DISPLAYED, OVERLAP, COMMON_REFERENCE_PERIOD, IFS_FLAG, PRECISION, DERIVATION_TYPE, REFERENCE_PERIOD, STATUS.

# get_data validates attribute vectors before requesting data

    Code
      get_data("CPI", attributes = NA_character_)
    Condition
      Error:
      ! `attributes` must be a character vector.

---

    Code
      get_data("CPI", attributes = list("STATUS"))
    Condition
      Error:
      ! `attributes` must be a character vector.

