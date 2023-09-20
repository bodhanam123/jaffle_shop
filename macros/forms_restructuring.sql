{% macro form_responses() %}
{% set form_config_1 = ["question1", "question2", "question3"] %}
{% set form_config_2 = ["name", "email", "age"] %}
{% set form_config_3 = ["fieldA", "fieldB", "fieldC"] %}
{% set form_config_4 = ["response1", "response2", "response3"] %}

{% set form_configs = {
    "1": form_config_1,
    "2": form_config_2,
    "3": form_config_3,
    "4": form_config_4
} %}

{% for i in range(1, 2) %}
    {% set query = "" %}
    {%- for item in form_configs[i] %}
        {% set query = query + "JSON_EXTRACT_SCALAR(form_responses.config, '$.{{ item }}') as {{ item }}," %}
    {%- endfor %}
    {% set query = query[:-1] %}  {# Remove the trailing comma #}
    {% do run_query("select " + query +
     " from `project-on-dbt-379106`.`test_dev`.`form_responses` where form_id = " + i|string) %}
{% endfor %}
{% endmacro %}
