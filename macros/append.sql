{% materialization append_only, adapter='bigquery' %}
    {%- set target_relation = this %}
{%- set tmp_identifier = "temp_" ~ target_relation.identifier %}
    {%- set tmp_relation = target_relation.incorporate(path=    {"identifier": tmp_identifier, "schema": config.get('temp_schema', default=target_relation.schema)}) -%}
    {%- set existing_relation = load_relation(this) -%}
    {%- set build_sql =   build_append_only_initial_sql(target_relation, tmp_relation) %}
{{- run_hooks(pre_hooks) -}}
    {%- call statement('main') -%}
        {{ build_sql }}
    {% endcall %}
    {{ run_hooks(post_hooks) }}
    {% set target_relation = this.incorporate(type='table') %}
    {% do persist_docs(target_relation, model) %}
    {{ return({'relations': [target_relation]}) }}
{% endmaterialization %}



{%- macro build_append_only_initial_sql(target_relation, defer_relation) -%}
    {%- set initial_sql -%}
        create_or_replace_clone(target_relation, defer_relation)
    {%- endset -%}
    {{ create_table_as(True, target_relation, initial_sql) }}
{%- endmacro -%}



  