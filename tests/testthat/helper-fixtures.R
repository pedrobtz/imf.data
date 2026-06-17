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
