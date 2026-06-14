test_that("list_datasets returns a stable catalogue", {
  vcr::use_cassette("list_datasets_imf_sta", {
    result <- list_datasets("IMF.STA")
  })

  expect_s3_class(result, "tbl_df")
  expect_named(
    result,
    c("agency", "id", "version", "name", "description", "dsd_id")
  )
  cpi <- result[result$id == "CPI", ]
  expect_equal(nrow(cpi), 1)
  expect_identical(cpi$agency, "IMF.STA")
  expect_identical(cpi$dsd_id, "DSD_CPI")
})

test_that("list_dimensions resolves key order and codelists", {
  vcr::use_cassette("list_dimensions_cpi", {
    result <- list_dimensions("CPI")
  })

  expect_equal(
    result$id,
    c(
      "COUNTRY",
      "INDEX_TYPE",
      "COICOP_1999",
      "TYPE_OF_TRANSFORMATION",
      "FREQUENCY",
      "TIME_PERIOD"
    )
  )
  expect_equal(result$position, 0:5)
  expect_identical(result$codelist_id[[1L]], "CL_COUNTRY")
})

test_that("list_dimensions uses the DSD version linked by the dataflow", {
  vcr::use_cassette("list_dimensions_cpi_version", {
    result <- list_dimensions("CPI", version = "5.0.0")
  })

  expect_identical(result$id[[1L]], "COUNTRY")
})

test_that("concept lookup follows the referenced concept scheme", {
  vcr::use_cassette("resolve_dsd_cpi", {
    resolved <- resolve_dsd("CPI", "IMF.STA", "+")
  })

  result <- dimension_records(resolved)

  expect_identical(result$codelist_id[[1L]], "CL_COUNTRY")
  expect_identical(result$name[[1L]], "Country")
})

test_that("URN and concept helpers handle invalid and ranged identities", {
  invalid <- parse_urn("not-a-urn")
  expect_true(all(is.na(unlist(invalid))))
  expect_true(all(is.na(unlist(parse_urn(NULL)))))
  expect_identical(
    extract_concept_id(
      paste0(
        "urn:sdmx:org.sdmx.infomodel.conceptscheme.",
        "Concept=IMF:CS_MASTER(1.0).FREQ"
      )
    ),
    "FREQ"
  )

  expect_identical(version_matches("+", "2.0"), TRUE)
  expect_identical(version_matches("1.0+.0", "1.0.3.0"), TRUE)
  expect_identical(version_matches("1.0", "2.0"), FALSE)
  expect_identical(version_matches(NA_character_, "1.0"), FALSE)
  expect_null(find_concept(NULL, "not-a-urn"))
  expect_null(find_concept(list(), "not-a-urn"))

  identity <- paste0(
    "urn:sdmx:org.sdmx.infomodel.conceptscheme.",
    "Concept=IMF:CS_MASTER(1.0).FREQ"
  )
  expect_null(find_concept(
    list(list(
      agencyID = "OTHER",
      id = "CS_MASTER",
      version = "1.0"
    )),
    identity
  ))
  expect_null(find_concept(
    list(list(
      agencyID = "IMF",
      id = "CS_MASTER",
      version = "1.0",
      concepts = list(list(id = "OTHER"))
    )),
    identity
  ))
})

test_that("DSD resolution reports missing or malformed structures", {
  vcr::use_cassette("list_dimensions_missing", {
    expect_snapshot(
      error = TRUE,
      list_dimensions("NOT_A_DATAFLOW")
    )
  })
})

test_that("dimension discovery returns typed empty results", {
  resolved <- list(
    dsd = list(
      dataStructureComponents = list(
        dimensionList = list(dimensions = list(), timeDimensions = list())
      )
    ),
    concepts = list()
  )
  result <- dimension_records(resolved)

  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_type(result$position, "integer")

  vcr::use_cassette("resolve_dsd_cpi_unresolved", {
    unresolved <- resolve_dsd("CPI", "IMF.STA", "+")
  })
  unresolved$concepts <- list()
  result <- dimension_records(unresolved)
  expect_identical(result$name, result$id)
})

test_that("list_dimension_values combines availability and labels", {
  vcr::use_cassette("list_dimension_values_cpi_frequency", {
    result <- list_dimension_values(
      "CPI",
      "FREQUENCY",
      filters = list(COUNTRY = "USA")
    )
  })

  expect_equal(result$code, c("A", "M", "Q"))
  expect_true(all(is.na(result$name)))
})

test_that("availability parsing skips incomplete regions and duplicates", {
  response <- list(
    data = list(
      dataConstraints = list(
        list(cubeRegions = NULL),
        list(cubeRegions = list(list(components = NULL))),
        list(
          cubeRegions = list(
            list(
              components = list(
                list(id = "OTHER", values = list(list(value = "X"))),
                list(
                  id = "FREQUENCY",
                  values = list(
                    list(id = "M"),
                    list(value = "M"),
                    list(value = "Q")
                  )
                )
              )
            )
          )
        )
      )
    )
  )

  expect_identical(availability_values(response, "FREQUENCY"), c("M", "Q"))
  expect_identical(
    availability_values(list(data = list()), "FREQUENCY"),
    character()
  )
})

test_that("codelist lookup handles missing resources", {
  result <- codelist_labels(NA_character_, NA_character_, NA_character_)
  expect_equal(nrow(result), 0)

  vcr::use_cassette("codelist_missing", {
    result <- codelist_labels("IMF", "NOT_A_CODELIST", "+")
  })
  expect_equal(nrow(result), 0)
})

test_that("list_dimension_values returns typed empty availability", {
  vcr::use_cassette("list_dimension_values_empty", {
    result <- list_dimension_values(
      "CPI",
      "FREQUENCY",
      filters = list(COUNTRY = "ZZZ")
    )
  })

  expect_equal(nrow(result), 0)
  expect_named(result, c("code", "name", "description"))
})

test_that("list_dimension_values rejects unknown dimensions", {
  vcr::use_cassette("list_dimension_values_unknown", {
    expect_snapshot(
      error = TRUE,
      list_dimension_values("CPI", "NOT_A_DIMENSION")
    )
  })
})

test_that("parse_data_message decodes series and attributes", {
  result <- parse_data_message(
    fixture_data_response(),
    attributes = c("SCALE", "STATUS")
  )

  expect_s3_class(result, "tbl_df")
  expect_named(
    result,
    c(
      "COUNTRY",
      "FREQUENCY",
      "TIME_PERIOD",
      "OBS_VALUE",
      "SCALE",
      "STATUS"
    )
  )
  expect_equal(result$COUNTRY, c("USA", "USA", "CAN"))
  expect_equal(result$FREQUENCY, c("M", "M", "Q"))
  expect_equal(result$OBS_VALUE, c(151.4, 152.7, 132.2))
  expect_equal(result$SCALE, c("0", "0", "3"))
  expect_equal(result$STATUS, c("A", NA, "A"))
})

test_that("parse_data_message rejects malformed indexed payloads", {
  short_key <- fixture_data_response()
  names(short_key$data$dataSets[[1L]]$series)[[1L]] <- "0"
  expect_snapshot(error = TRUE, parse_data_message(short_key))

  out_of_bounds <- fixture_data_response()
  names(out_of_bounds$data$dataSets[[1L]]$series)[[1L]] <- "9:0"
  expect_snapshot(error = TRUE, parse_data_message(out_of_bounds))

  bad_structure <- fixture_data_response()
  bad_structure$data$dataSets[[1L]]$structure <- 9L
  expect_snapshot(error = TRUE, parse_data_message(bad_structure))
})

test_that("indexed value helpers reject invalid positions", {
  dimension <- list(id = "COUNTRY", values = list(list(id = "USA")))

  expect_identical(dimension_value(dimension, NULL), NA_character_)
  expect_identical(dimension_value(dimension, NA_integer_), NA_character_)
  expect_snapshot(error = TRUE, dimension_value(dimension, "bad"))
  expect_snapshot(
    error = TRUE,
    dimension_value(dimension, .Machine$integer.max)
  )
  expect_identical(decode_key("", list()), character())
  expect_snapshot(error = TRUE, decode_key(1L, list(dimension)))
  expect_identical(
    dimension_value(list(values = list(list(id = "VALUE"))), 0L),
    "VALUE"
  )
})

test_that("attribute and component helpers handle missing definitions", {
  typed <- empty_tibble(c(flag = "logical"))
  expect_type(typed$flag, "logical")
  expect_null(first_existing(list(), c("name", "id")))
  expect_identical(decode_attribute(NULL, list()), NA_character_)
  expect_identical(decode_attribute("raw", list()), "raw")
  expect_identical(decode_attributes(list(), list()), character())
  expect_identical(
    component_names(list(list()), c("dimensions", "series")),
    character()
  )
  expect_identical(parse_measure(NULL, list(id = "OBS_VALUE")), NA_real_)
  expect_identical(available_attributes(list(data = list())), character())

  empty <- empty_data_result(list(), "STATUS")
  expect_named(empty, c("OBS_VALUE", "STATUS"))
  expect_type(empty$OBS_VALUE, "double")
})

test_that("parse_data_message rejects non-numeric measures", {
  response <- fixture_data_response()
  response$data$dataSets[[1L]]$series[[1L]]$observations[[1L]][[1L]] <-
    "not-a-number"

  expect_snapshot(error = TRUE, parse_data_message(response))
})

test_that("parse_data_message handles empty and malformed message shapes", {
  result <- parse_data_message(NULL, attributes = "STATUS")
  expect_named(result, c("OBS_VALUE", "STATUS"))

  response <- fixture_data_response()
  response$data$dataSets <- list()
  result <- parse_data_message(response)
  expect_equal(nrow(result), 0)
  expect_named(result, c("COUNTRY", "FREQUENCY", "TIME_PERIOD", "OBS_VALUE"))

  response <- fixture_data_response()
  response$data$structures <- NULL
  expect_snapshot(error = TRUE, parse_data_message(response))

  response <- fixture_data_response()
  names(response$data$dataSets[[1L]]$series) <- NULL
  expect_snapshot(error = TRUE, parse_data_message(response))

  response <- fixture_data_response()
  names(response$data$dataSets[[1L]]$series[[1L]]$observations) <- NULL
  expect_snapshot(error = TRUE, parse_data_message(response))

  response <- fixture_data_response()
  response$data$dataSets[[1L]]$series[[1L]]$observations[[1L]] <- "151.4"
  expect_snapshot(error = TRUE, parse_data_message(response))
})

test_that("parse_data_message skips series without observations", {
  response <- fixture_data_response()
  response$data$dataSets[[1L]]$series <- list(
    "0:0" = list(observations = NULL)
  )

  result <- parse_data_message(response)

  expect_equal(nrow(result), 0)
  expect_type(result$OBS_VALUE, "double")
})

test_that("parse_data_message supports observations without attributes", {
  response <- fixture_data_response()
  response$data$structures[[1L]]$attributes$observation <- list()
  response$data$dataSets[[1L]]$series <- list(
    "0:0" = list(observations = list("0" = list("1.5")))
  )

  result <- parse_data_message(response)

  expect_equal(result$OBS_VALUE, 1.5)
})

test_that("parse_data_message combines multiple response structures", {
  response <- fixture_data_response()
  second_structure <- response$data$structures[[1L]]
  second_structure$dimensions$series <- list(
    list(id = "AREA", values = list(list(id = "EUR")))
  )
  second_structure$measures$observation <- list(list(id = "ALT_VALUE"))
  second_structure$attributes$observation <- list(
    list(id = "CONFIDENTIALITY", values = list(list(id = "F")))
  )
  response$data$structures[[2L]] <- second_structure
  response$data$dataSets[[2L]] <- list(
    structure = 1L,
    series = list(
      "0" = list(
        observations = list("0" = list("2.5", 0L))
      )
    )
  )

  result <- parse_data_message(response, attributes = "CONFIDENTIALITY")

  expect_named(
    result,
    c(
      "COUNTRY",
      "FREQUENCY",
      "TIME_PERIOD",
      "OBS_VALUE",
      "CONFIDENTIALITY",
      "AREA",
      "ALT_VALUE"
    )
  )
  expect_equal(result$OBS_VALUE, c(151.4, 152.7, 132.2, NA))
  expect_equal(result$ALT_VALUE, c(NA, NA, NA, 2.5))
  expect_equal(result$CONFIDENTIALITY, c(NA, NA, NA, "F"))
})

test_that("get_data returns a typed empty result", {
  vcr::use_cassette("get_data_empty", {
    expect_snapshot(
      result <- get_data(
        "CPI",
        filters = list(
          COUNTRY = "ZZZ",
          INDEX_TYPE = "CPI",
          COICOP_1999 = "_T",
          TYPE_OF_TRANSFORMATION = "IX",
          FREQUENCY = "M"
        )
      )
    )
  })
  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_type(result$OBS_VALUE, "double")
})

test_that("get_data validates requested attributes", {
  vcr::use_cassette("get_data_unknown_attribute", {
    expect_snapshot(
      error = TRUE,
      get_data(
        "CPI",
        filters = list(
          COUNTRY = "USA",
          INDEX_TYPE = "CPI",
          COICOP_1999 = "_T",
          TYPE_OF_TRANSFORMATION = "IX",
          FREQUENCY = "M"
        ),
        last_n_obs = 1,
        attributes = "UNKNOWN"
      )
    )
  })
})

test_that("get_data returns recorded tidy observations", {
  vcr::use_cassette("get_data_cpi", {
    result <- get_data(
      "CPI",
      filters = list(
        COUNTRY = "USA",
        INDEX_TYPE = "CPI",
        COICOP_1999 = "_T",
        TYPE_OF_TRANSFORMATION = "IX",
        FREQUENCY = "M"
      ),
      last_n_obs = 2,
      attributes = "STATUS"
    )
  })

  expect_equal(nrow(result), 2)
  expect_named(
    result,
    c(
      "COUNTRY",
      "INDEX_TYPE",
      "COICOP_1999",
      "TYPE_OF_TRANSFORMATION",
      "FREQUENCY",
      "TIME_PERIOD",
      "OBS_VALUE",
      "STATUS"
    )
  )
  expect_identical(result$COUNTRY, c("USA", "USA"))
  expect_true(all(is.finite(result$OBS_VALUE)))
})

test_that("get_data validates attribute vectors before requesting data", {
  expect_snapshot(error = TRUE, get_data("CPI", attributes = NA_character_))
  expect_snapshot(error = TRUE, get_data("CPI", attributes = list("STATUS")))
})
