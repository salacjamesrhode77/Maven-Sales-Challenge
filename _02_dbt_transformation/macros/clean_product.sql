{% macro clean_product(expr) %}
    case
        when lower(trim({{ expr }})) = 'gtxpro' then 'GTX Pro'
        else {{ expr }}
    end
{% endmacro %}
