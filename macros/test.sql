{% macro variables(key) %}

{% set person = {
    'name': 'me',
    'number': 3
} %}

{{person[key]}}
    
{% endmacro %}


