{% macro name() %}

{% set my_dict = {"abc": 123} %}
{% set my_yaml_string = toyaml(my_dict) %}
return my_yaml_string

    
{% endmacro %}

