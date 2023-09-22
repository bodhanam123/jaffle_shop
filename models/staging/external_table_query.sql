{% macro name(args) %}

{% set create_table %}
  create or replace external table `team_one.table_1`(
      Id STRING NOT NULL,
      FirstName STRING NOT NULL,
      LastName STRING NOT NULL
  )

  OPTIONS(
      format = "GOOGLE_SHEETS",
      sheet_range = "Sheet1!A1:B5",
      uris =  ['https://docs.google.com/spreadsheets/d/1Yb0pcibqrmtheAo45eMnPN6HMpMvITsJ-GoqmJaG-94/edit#gid=0'],
      skip_leading_rows= 1
  );

{% endset %}
  {% do run_query(create_table) %}
    
{% endmacro %}



