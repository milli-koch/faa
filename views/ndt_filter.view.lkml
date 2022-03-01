
  view: ndt_filter {
    derived_table: {
      explore_source: accidents_extended {
        column: air_carrier {}
        column: id {}

      }
    }
    dimension: air_carrier {}
    dimension: id {
      type: number
    }
  }
