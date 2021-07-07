{% macro grant_select_on_schemas(schemas, groups, users) %}
  {% set groups_csv = 'group ' ~  groups | join(', group ') %}
  {% set groups_and_users_csv = groups_csv ~ ', ' ~ users | join(', ') %}
  {% for schema in schemas %}
    grant usage on schema {{ schema }} to {{ groups_and_users_csv }};
    grant select on all tables in schema {{ schema }} to {{ groups_and_users_csv }};
    alter default privileges in schema {{ schema }}
        grant select on tables to {{ groups_and_users_csv }};
  {% endfor %}
{% endmacro %}