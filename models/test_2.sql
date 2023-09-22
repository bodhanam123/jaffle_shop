{{
    config(
        materialized='external_table',uri='https://docs.google.com/spreadsheets/d/1Yb0pcibqrmtheAo45eMnPN6HMpMvITsJ-GoqmJaG-94/edit#gid=0',
        sheet_range='Sheet1!A1:B5',upload_as='external_table'
    )
}}

--upload_as arguments can be 'table' or 'external_table's

  