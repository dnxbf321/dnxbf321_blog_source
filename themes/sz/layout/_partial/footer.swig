<footer id="footer" class="inner clearfix">
	<div class="f-left">
		&copy; {{ moment(Date.now()).format('YYYY') }}
		{% if config.author %}
		{{ config.author }}
		{% else %}
		{{ config.title }}
		{% endif %}
	</div>
</footer>