# proxy configuration validates credentials and ports

    Code
      set_imf_proxy("http://proxy.example.com", port = 70000)
    Condition
      Error:
      ! `port` must be a whole number between 1 and 65535.

---

    Code
      set_imf_proxy("http://proxy.example.com", username = "proxy-user")
    Condition
      Error:
      ! `username` and `password` must be supplied together.

---

    Code
      set_imf_proxy("http://proxy.example.com", auth = "bearer")
    Condition
      Error in `match.arg()`:
      ! 'arg' should be one of "basic", "digest", "digest_ie", "gssnegotiate", "ntlm", "any"

# raw client validation is informative

    Code
      sdmx_structure("not-a-structure")
    Condition
      Error:
      ! `structure_type` must be one of: 'datastructure', 'metadatastructure', 'dataflow', 'metadataflow', 'provisionagreement', 'structureset', 'process', 'categorisation', 'dataconstraint', 'metadataconstraint', 'conceptscheme', 'codelist', 'categoryscheme', 'hierarchy', 'hierarchyassociation', 'agencyscheme', 'dataproviderscheme', 'dataconsumerscheme', 'organisationunitscheme', 'transformationscheme', 'rulesetscheme', 'userdefinedoperatorscheme', 'customtypescheme', 'namepersonalisationscheme', 'vtlmappingscheme', 'valuelist', 'structuremap', 'representationmap', 'conceptschememap', 'categoryschememap', 'organisationschememap', 'reportingtaxonomymap', '*'.

---

    Code
      sdmx_data("CPI", first_n_obs = 0)
    Condition
      Error:
      ! `first_n_obs` must be a positive whole number.

---

    Code
      sdmx_data("CPI", first_n_obs = 1, last_n_obs = 1)
    Condition
      Error:
      ! Use only one of `first_n_obs` and `last_n_obs`.

---

    Code
      sdmx_data("CPI", start_period = "January")
    Condition
      Error:
      ! `start_period` is not a supported SDMX period.

---

    Code
      sdmx_data("CPI", start_period = "2026-02-30")
    Condition
      Error:
      ! `start_period` is not a supported SDMX period.

---

    Code
      sdmx_data("CPI", updated_after = "2026-06-13")
    Condition
      Error:
      ! `updated_after` must be an RFC 3339 timestamp.

---

    Code
      sdmx_data("CPI", filters = list("USA"))
    Condition
      Error:
      ! Every element of `filters` must have a dimension name.

