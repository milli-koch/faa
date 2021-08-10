view: special_characters {
 derived_table: {
   sql: SELECT "\\" special
UNION ALL
SELECT "\t Tab"
UNION ALL
SELECT "^" ;;
 }

dimension: special{}
}
