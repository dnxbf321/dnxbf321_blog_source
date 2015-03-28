{% for widget in theme.widgets %}
{% set _widget = '../_widget/' + widget + '.swig' %}
{% include _widget %}
{% endfor %}