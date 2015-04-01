<footer id="footer">
	<div class="center">
		&copy; {{ moment(Date.now()).format('YYYY') }}
		{% if config.author %}
		{{ config.author }}
		{% else %}
		{{ config.title }}
		{% endif %}
	</div>
</footer>