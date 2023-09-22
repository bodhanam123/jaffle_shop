{{
    config(
        materialized='external_table',uri='https://docs.google.com/spreadsheets/d/1Yb0pcibqrmtheAo45eMnPN6HMpMvITsJ-GoqmJaG-94/edit#gid=0',
        sheet_range='Sheet1!A1:B5'
    )
}}