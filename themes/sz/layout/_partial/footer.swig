<footer id="footer" class="inner">
		&copy; {{ moment(Date.now()).format('YYYY') }}
		{% if config.author %}
		{{ config.author }}
		{% else %}
		{{ config.title }}
		{% endif %}
</footer>