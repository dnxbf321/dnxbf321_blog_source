<article class="{{ item.layout }}">
	{% if item.photos && item.photos.length %}
	{% include 'post/gallery.swig' %}
	{% endif %}
	<div class="post-content">
		<header>
			{% if item.layout != 'page' %}
			<div class="icon"></div>
			<time datetime="{{ item.date.toDate().toISOString() }}"><a href="{{ url_for(item.path) }}">{{
				item.date.format(config.date_format) }}</a></time>
			{% endif %}
			{% include 'post/title.swig' %}
		</header>
		<div class="entry">
			{% if item.excerpt && index %}
			{{ item.excerpt }}
			{% else %}
			{{ item.content }}
			{% endif %}
		</div>
		<footer class="clearfix">
			{% if index %}
			{% if item.excerpt %}
			<div class="f-left">
				<a href="{{ url_for(item.path) }}#more" class="more-link">{{ theme.excerpt_link }}</a>
			</div>
			{% endif %}
			{% if item.comment && config.disqus_shortname %}
			<div class="f-right">
				<a href="{{ item.permalink }}#disqus_thread" class="comment-link">Comments</a>
			</div>
			{% endif %}
			{% else %}
			{% include 'post/category.swig' %}
			{% include 'post/tag.swig' %}
			{% endif %}
		</footer>
	</div>
</article>

{% include 'comment.swig' %}