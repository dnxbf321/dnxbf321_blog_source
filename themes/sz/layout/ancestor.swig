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

<div id="content">
	<div class="center">
		<div class="main-col">
			{% block primary %}{% endblock %}
		</div>
		{% block extends %}{% endblock %}
	</div>
</div>

{% include '_partial/footer.swig' %}

{% block scripts %}
<script src="/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/js/jquery.imagesloaded.min.js"></script>
<script src="/js/gallery.js"></script>
{% endblock %}

<script>
	/* #header特效 */
	(function() {
		var $header = $('#header');
		$(window).on('scroll', function() {
			if (window.scrollY > 100) {
				$header.addClass('small');
			} else {
				$header.removeClass('small');
			}
		});
	}());
</script>

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