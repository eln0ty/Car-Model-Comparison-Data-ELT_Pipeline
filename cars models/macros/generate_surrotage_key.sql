{% macro generate_surrogate_key(cols) -%}
md5(concat_ws('||', {{ cols | map('string') | join(', ') }}))
{%- endmacro %}
