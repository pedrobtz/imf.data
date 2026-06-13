# list_dimension_values rejects unknown dimensions

    Code
      list_dimension_values("CPI", "NOT_A_DIMENSION")
    Condition
      Error:
      ! Unknown dimension `NOT_A_DIMENSION`. Available dimensions: FREQUENCY.

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

# parse_data_message rejects non-numeric measures

    Code
      parse_data_message(response)
    Condition
      Error:
      ! Malformed SDMX response: measure `OBS_VALUE` contains non-numeric value "not-a-number".

# get_data returns a typed empty result

    Code
      result <- get_data("CPI", attributes = "STATUS")
    Condition
      Warning:
      No observations matched the query.

# get_data validates requested attributes

    Code
      get_data("CPI", attributes = "UNKNOWN")
    Condition
      Error:
      ! Unknown attributes: UNKNOWN. Available attributes: SCALE, STATUS.

