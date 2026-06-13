fixture_dataflow_response <- function() {
  list(
    data = list(
      dataflows = list(
        list(
          agencyID = "IMF.STA",
          id = "CPI",
          version = "5.0.0",
          name = "Consumer Price Index",
          description = "Consumer prices.",
          structure = paste0(
            "urn:sdmx:org.sdmx.infomodel.datastructure.",
            "DataStructure=IMF.STA:DSD_CPI(5.0+.0)"
          )
        ),
        list(
          agencyID = "IMF.RES",
          id = "WEO",
          version = "1.0.0",
          name = "World Economic Outlook",
          description = "World Economic Outlook.",
          structure = paste0(
            "urn:sdmx:org.sdmx.infomodel.datastructure.",
            "DataStructure=IMF.RES:DSD_WEO(1.0.0)"
          )
        )
      )
    )
  )
}

fixture_dsd_response <- function() {
  list(
    data = list(
      dataStructures = list(
        list(
          id = "DSD_CPI",
          dataStructureComponents = list(
            dimensionList = list(
              dimensions = list(
                list(
                  id = "COUNTRY",
                  position = 0L,
                  type = "Dimension",
                  conceptIdentity = paste0(
                    "urn:sdmx:org.sdmx.infomodel.conceptscheme.",
                    "Concept=IMF:CS_MASTER(1.0).COUNTRY"
                  )
                ),
                list(
                  id = "FREQUENCY",
                  position = 1L,
                  type = "Dimension",
                  conceptIdentity = paste0(
                    "urn:sdmx:org.sdmx.infomodel.conceptscheme.",
                    "Concept=IMF:CS_MASTER(1.0).FREQ"
                  )
                )
              ),
              timeDimensions = list(
                list(
                  id = "TIME_PERIOD",
                  position = 2L,
                  type = "TimeDimension",
                  conceptIdentity = paste0(
                    "urn:sdmx:org.sdmx.infomodel.conceptscheme.",
                    "Concept=IMF:CS_MASTER(1.0).TIME_PERIOD"
                  )
                )
              )
            )
          )
        )
      ),
      conceptSchemes = list(
        list(
          concepts = list(
            list(
              id = "COUNTRY",
              name = "Country",
              coreRepresentation = list(
                enumeration = paste0(
                  "urn:sdmx:org.sdmx.infomodel.codelist.",
                  "Codelist=IMF:CL_COUNTRY(1.0+.0)"
                )
              )
            ),
            list(
              id = "FREQ",
              name = "Frequency",
              coreRepresentation = list(
                enumeration = paste0(
                  "urn:sdmx:org.sdmx.infomodel.codelist.",
                  "Codelist=IMF:CL_FREQ(1.0+.0)"
                )
              )
            ),
            list(id = "TIME_PERIOD", name = "Time period")
          )
        )
      )
    )
  )
}

fixture_availability_response <- function() {
  list(
    data = list(
      dataConstraints = list(
        list(
          cubeRegions = list(
            list(
              components = list(
                list(
                  id = "FREQUENCY",
                  values = list(
                    list(value = "A"),
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
}

fixture_codelist_response <- function() {
  list(
    data = list(
      codelists = list(
        list(
          codes = list(
            list(id = "A", name = "Annual", description = "Annual data."),
            list(id = "M", name = "Monthly", description = "Monthly data."),
            list(id = "Q", name = "Quarterly", description = "Quarterly data.")
          )
        )
      )
    )
  )
}

fixture_data_response <- function(empty = FALSE) {
  series <- if (empty) {
    NULL
  } else {
    list(
      "0:0" = list(
        attributes = list(0L),
        observations = list(
          "0" = list("151.4", 0L),
          "1" = list("152.7", NULL)
        )
      ),
      "1:1" = list(
        attributes = list(1L),
        observations = list(
          "0" = list("132.2", 0L)
        )
      )
    )
  }

  list(
    meta = list(),
    data = list(
      dataSets = list(
        list(structure = 0L, action = "Replace", series = series)
      ),
      structures = list(
        list(
          dimensions = list(
            series = list(
              list(
                id = "COUNTRY",
                keyPosition = 0L,
                values = list(list(id = "USA"), list(id = "CAN"))
              ),
              list(
                id = "FREQUENCY",
                keyPosition = 1L,
                values = list(list(id = "M"), list(id = "Q"))
              )
            ),
            observation = list(
              list(
                id = "TIME_PERIOD",
                keyPosition = 2L,
                values = list(
                  list(value = "2026-M03"),
                  list(value = "2026-M04")
                )
              )
            )
          ),
          measures = list(
            observation = list(list(id = "OBS_VALUE", roles = list()))
          ),
          attributes = list(
            series = list(
              list(
                id = "SCALE",
                values = list(list(id = "0"), list(id = "3"))
              )
            ),
            observation = list(
              list(id = "STATUS", values = list(list(id = "A")))
            )
          )
        )
      )
    )
  )
}
