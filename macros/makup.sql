{% macro markup(jid) %}

sum(CASE WHEN JOB_ID='{{jid}}' THEN 1 ELSE 0 END )

{% endmacro %}