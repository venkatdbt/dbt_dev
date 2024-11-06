{% macro employee_hike(hike_per) %}

(salary+(Salary*({{hike_per}}/100)))

{% endmacro %}