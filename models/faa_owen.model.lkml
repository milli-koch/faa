connection: "lookerdata_standard_sql"

datagroup: faa_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

datagroup: substitution_syntax_datagroup {
  sql_trigger: SELECT MAX(id) FROM ${fake_table.SQL_TABLE_NAME};;
  max_cache_age: "24 hours"
}



persist_with: faa_default_datagroup

include: "/views/**/*.view"

explore: aircraft {}

explore: aircraft_models {}

explore: airports {}

explore: flights {}

explore: accidents {
  view_name: accidents
  always_filter: {
    filters: [accidents.air_carrier: "AlwaysFilter"]
  }
}

explore: accidents_extended {
  extends: [accidents]
  hidden: no
  always_filter: {
    filters: [accidents.air_carrier: "AlwaysFilter"]
  }
}

explore: special_characters_owen_test {}

explore: ndt_filter {}
