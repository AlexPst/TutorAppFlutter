/// SQL-выражение `column IN ('a', 'b')` для текстовых колонок-перечислений.
String sqlIn(String column, List<String> values) =>
    "$column IN (${values.map((value) => "'$value'").join(', ')})";
