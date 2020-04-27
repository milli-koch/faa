connection: "lookerdata_standard_sql"
include: "../files/explores.explore"

datagroup: faa_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

persist_with: faa_default_datagroup
