<header id="header" class="inner">
	<div id="home" class="f-left">
		<h1><a href="{{ config.root }}">{{ config.title }}</a></h1>
		{% if config.subtitle %}
		<h2><a href="{{ config.root }}">{{ config.subtitle }}</a></h2>
		{{ endif }}
	</div>
	<nav id="main-nav" class="f-right">
		<ul class="clearfix">
			{% for menu in theme.menu %}
			<li><a href="{{ menu }}">{{ __(loop.key) }}</a></li>
			{% endfor %}
		</ul>
	</nav>
</header>