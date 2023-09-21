{% materialization clone, adapter='bigquery' %}

    {%- set clone_target = 'clone_table' -%}

    
    {%- set target_relation = this %}
    {%- set existing_relation = load_relation(this) -%}
    {%- set build_sql =   default__create_or_replace_clone(target_relation, clone_target) %}
{{- run_hooks(pre_hooks) -}}
    {%- call statement('main') -%}
        {{ build_sql }}
    {% endcall %}
    {{ run_hooks(post_hooks) }}
    {% set target_relation = this.incorporate(type='table') %}
    {% do persist_docs(target_relation, model) %}
    {{ return({'relations': [target_relation]}) }}

{% endmaterialization %}

{{clone_target}}

{% macro default__create_or_replace_clone(this_relation, clone_target) %}
    create or replace table {{ this_relation }} clone {{clone_target}}
{% endmacro %}