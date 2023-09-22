{% macro form_restructure_test_2() %}
    
{% set form_config_1 = ["question1", "question2", "question3"] %}
{% set form_config_2 = ["name", "email", "age"] %}
{% set form_config_3 = ["fieldA", "fieldB", "fieldC"] %}
{% set form_config_4 = ["response1", "response2", "response3"] %}

{% set form_configs = {
    1: form_config_1,
    2: form_config_2,
    3: form_config_3,
    4: form_config_4
} %}

{% for i in range(1, 5) %}

{% set query %}
    create or replace table `project-on-dbt-379106`.`dim_customers`.`form_{{i}}` as select 
    {% for item in form_configs[i] %}
         JSON_EXTRACT_SCALAR(form_responses.config,"$.{{ item }}") as {{ item }},
    {% endfor %}
    from `project-on-dbt-379106`.`test_dev`.`form_responses`
    where form_id = {{ i }}
{% endset %}

    {% do run_query(query) %}
{% endfor %}

{% endmacro %}