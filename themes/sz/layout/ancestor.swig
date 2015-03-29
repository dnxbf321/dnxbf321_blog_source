<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<meta name="viewport"
	      content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="description" content="{{ config.description }}">
	<link rel="icon" type="image/x-icon" href="/img/favicon.ico">

	{% block stylesheet %}
	<link rel="stylesheet" href="/bower_components/normalize.css/normalize.css"/>
	<link rel="stylesheet" href="/css/style.css">
	{% endblock %}

	<title>{% block title %}{{ config.title }} - {{ config.subtitle }}{% endblock %}</title>
</head>
<body>
{% include '_partial/header.swig' %}

<div id="content" class="inner">
	<div id="main-col" class="f-left">
		<div id="wrapper">{% block primary %}{% endblock %}</div>
	</div>
	<aside id="sidebar" class="f-right">{% include '_partial/sidebar.swig' %}</aside>
</div>

{% include '_partial/footer.swig' %}

{% block scripts %}
<script src="/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/js/jquery.imagesloaded.min.js"></script>
<script src="/js/gallery.js"></script>
{% endblock %}

{% if config.disqus_shortname %}
<script>
	(function (disqus_shortname, commentEnabled) {
		var dsq = document.createElement('script');
		dsq.type = 'text/javascript';
		dsq.async = true;
		dsq.src = '//' + disqus_shortname + '.disqus.com/' + (commentEnabled ? 'embed.js' : 'count.js');
		document.getElementsByTagName('head')[0].appendChild(dsq);
	}('{{ config.disqus_shortname }}', {
	{
		page.comments
	}
	}))
	;
</script>
{% endif %}

{% if theme.fancybox %}
<link rel="stylesheet" href="/fancybox/jquery.fancybox.css">
<script src="/fancybox/jquery.fancybox.pack.js"></script>
<script>
	(function ($) {
		$('.fancybox').fancybox();
	})(jQuery);
</script>
{% endif %}

</body>
</html>