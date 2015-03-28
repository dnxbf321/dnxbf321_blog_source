{% if page.comments %}
<section id="comment">
	<h1 class="title">评论</h1>
	{% if config.disqus_shortname %}
	<div id="disqus_thread"></div>
	{% endif %}
</section>
{% endif %}