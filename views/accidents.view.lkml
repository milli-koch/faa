view: accidents {
  sql_table_name: `faa.accidents`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: accident_number {
    type: string
    sql: ${TABLE}.accident_number ;;
  }

  dimension: air_carrier {
    #type: string
    sql: ${TABLE}.air_carrier ;;
  }

  dimension: aircraft_category {
    type: string
    sql: ${TABLE}.aircraft_category ;;
    suggest_persist_for: "30 seconds"
  }

  dimension: aircraft_damage {
    type: string
    sql: ${TABLE}.aircraft_damage ;;
  }

  dimension: airport_code {
    type: string
    sql: ${TABLE}.airport_code ;;
  }

  dimension: airport_name {
    type: string
    sql: ${TABLE}.airport_name ;;
  }

  dimension: amateur_built {
    type: string
    sql: ${TABLE}.amateur_built ;;
  }

  dimension: broad_phase_of_flight {
    type: string
    sql: ${TABLE}.broad_phase_of_flight ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: engine_type {
    type: string
    sql: ${TABLE}.engine_type ;;
  }

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.event_date ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
    link: {
      label: "Owen Test"
      url: "{{link}}&pivots=accidents.country"
    }
  }

  dimension: far_description {
    type: string
    sql: ${TABLE}.far_description ;;
  }

  dimension: injury_severity {
    type: string
    sql: ${TABLE}.injury_severity ;;
  }

  dimension: investigation_type {
    type: string
    sql: ${TABLE}.investigation_type ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.make ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: number_of_engines {
    type: string
    sql: ${TABLE}.number_of_engines ;;
  }

  dimension: number_of_fatalities {
    type: string
    sql: ${TABLE}.number_of_fatalities ;;
  }

  dimension: number_of_minor_injuries {
    type: string
    sql: ${TABLE}.number_of_minor_injuries ;;
  }

  dimension: number_of_serious_injuries {
    type: string
    sql: ${TABLE}.number_of_serious_injuries ;;
  }

  dimension: number_of_uninjured {
    type: string
    sql: ${TABLE}.number_of_uninjured ;;
  }

  dimension_group: publication {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      second
    ]
    sql: ${TABLE}.publication_date ;;
  }

  measure: seconds {
    type: number
    value_format: "[h]:mm:ss"
    sql: AVG(${publication_second}) / 86400.0 ;;
  }



  dimension: purpose_of_flight {
    type: string
    sql: concat(${TABLE}.purpose_of_flight, "extra long string for rendering behavior") ;;
  }

  dimension: registration_number {
    type: string
    sql: ${TABLE}.registration_number ;;
  }

  dimension: report_status {
    type: string
    sql: ${TABLE}.report_status ;;
  }

  dimension: schedule {
    type: string
    sql: ${TABLE}.schedule ;;
  }

  dimension: weather_condition {
    type: string
    sql: ${TABLE}.weather_condition ;;
  }

  dimension: really_long_string {
    #label: "Formatted Name"
    type: string
    sql: "This is a really long string that we are looking to wrap in a single value vis - it isn't actually, now we are using this in a table vis to show render long table behavior" ;;
    # html: <div class="vis-single-value">
    #       <div style= "word-wrap: break-word; width:50%; font-size:40%;">
    #       {{ rendered_value }}
    #       </div>
    #       </div>;;
    # html: {% if size > 20 %}
    # {{ value | truncatewords: 3}}<br>{{ value | }}   ;;
    #html: Number of CSAT Ratings: {{ length._rendered_value }} ;;
  }

  dimension: length {
    type: string
    sql: char_length(${really_long_string}) ;;
  }

  dimension: truncated_string {
    type: string
    sql: s ;;
  }

  measure: count {
    label: "This is not the view name"
    type: count
    drill_fields: [id, airport_name]
    # link: {
    #   label: "Owen Measure"
    #   url: "{{link}}&pivots=accidents.country"
    # }
    html: {{ air_carrier._value }} ;;
  }
}
