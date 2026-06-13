# list_dimension_values rejects unknown dimensions

    Code
      list_dimension_values("CPI", "NOT_A_DIMENSION")
    Condition
      Error:
      ! Unknown dimension `NOT_A_DIMENSION`. Available dimensions: FREQUENCY.

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

