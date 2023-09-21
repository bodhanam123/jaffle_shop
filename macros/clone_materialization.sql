{% materialization clone, adapter='bigquery' %}

{%- set target_relation = this %}
{%- set build_sql = default_create_or_replace_clone(target_relation, clone_target_relation,model) -%}

 
{{- run_hooks(pre_hooks) -}}


{%- call statement('main') -%}
    {{ build_sql }}
{% endcall %}
    
 
{{ run_hooks(post_hooks) }}


{% set target_relation = this.incorporate(type='table') %}
{% do persist_docs(target_relation, model) %}
{{ return({'relations': [target_relation]}) }}


{% endmaterialization %}

{% macro default_create_or_replace_clone(target_relation, clone_target_relation,model) %}     
create or replace table {{target_relation}} clone {{model.compiled_sql}} 
{% endmacro %}