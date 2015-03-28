{% if page.category %}
<h2 class="archive-title category">{{ page.category }}</h2>
{% elseif page.tag %}
<h2 class="archive-title tag">{{ page.tag }}</h2>
{% elseif page.archive && page.month %}
<h2 class="archive-title">{{ page.year + '-' + page.month}}</h2>
{% elseif page.archive && page.year%}
<h2 class="archive-title">{{ page.year }}</h2>
{% else %}
<h2 class="archive-title">归档</h2>
{% endif %}

{% if pagination == 2 %}

{% for post in page.posts %}
{% set pipe = {item: post, index: true} %}
{% include 'article.swig' with pipe %}
{% endfor %}

{% include 'pagination.swig' %}
{% else %}

<div class="archive">
	{% for item in page.posts %}
	<article class="{{ item.layout }}">
		<div class="post-content">
			<header>
				<div class="icon"></div>
				<time datetime="{{ item.date.toDate().toISOString() }}"><a href="{{ url_for(item.path) }}">{{
					item.date.format(config.date_format) }}</a></time>
				{% if item.link %}
				{% if item.title %}
				<h1 class="title link"><a href="{{ url_for(item.link) }}" target="_blank">{{ item.title }}</a></h1>
				{% else %}
				<h1 class="title link"><a href="{{ url_for(item.link) }}" target="_blank">{{ item.link }}</a></h1>
				{% endif %}
				{% else %}
				<h1 class="title"><a href="{{ url_for(item.path) }}">{{ item.title }}</a></h1>
				{% endif %}
			</header>
		</div>
	</article>
	{% endfor %}
</div>
{% endif %}
