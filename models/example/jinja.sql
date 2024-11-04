{% set me=3 %}
{% set foo = 5%}

{{me}}
{{foo}}

{% set list = ['apple','grapes','papaya'] %}

{% set grocery_list= ['chocolate','ice cream'] %}
{% do grocery_list.append('cookies') %}

{{grocery_list[0]}}
{{grocery_list | length}}


{% set person = {
'identifier': 'Serena Williams',
'country': 'United States',
'grand slams won': 23
} %}

{{person.identifier}}
{{person['country']}}


{% set temperature = 80 %}
On a day like this, I especially like
{% if temperature > 70 %}
a refreshing mango sorbet.
{% elif temperature<50 %}
reffreshing mangoe
{% else %}
a decadent chocolate ice cream.
{% endif %}

On a day like this, I especially like a refreshing mango sorbet.

{% set list = ['apple','grapes','papaya'] %}
{% set i=1 %}
{% for fruites in list %}
available fruite{{i}} are {{fruites}}
{% endfor %}