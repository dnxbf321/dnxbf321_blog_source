{% if theme.comment.enable && page.comments %}
<section id="comment">
	<h1 class="title">{{ __('comment') }}</h1>
	{% if config.disqus_shortname %}
	<div id="disqus_thread"></div>
	{% endif %}
</section>
{% endif %}