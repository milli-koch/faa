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

explore: flights_and_airports {
  view_name: flights
  join: airports {
    sql_on: ${flights.destination} = ${airports.code}  ;;
    relationship: many_to_one
  }
  join: airports2 {
    from: airports
    sql_on: ${flights.origin} = ${airports2.code}  ;;
    relationship: many_to_one
  }
}

explore: accidents {}

explore: special_characters {}
