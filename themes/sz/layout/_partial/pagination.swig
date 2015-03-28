<nav id="pagination" class="clearfix">
	{% if page.prev %}
	<a href="{{ url_for(page.prev_link) }}" class="f-left prev">prev</a>
	{% endif %}
	{% if page.next %}
	<a href="{{ url_for(page.next_link) }}" class="f-right next">next</a>
	{% endif %}
</nav>