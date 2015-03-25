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
	<link rel="stylesheet" href="/bower_components/normalize.css/normalize.css">
	<link rel="stylesheet" href="/css/common.css"/>
	<link rel="stylesheet" href="/css/article.css"/>
	{% endblock %}

	<title>{% block title %}{{ config.title }} - {{ config.subtitle }}{% endblock %}</title>
</head>
<body>
{% include '_partial/header.swig' %}

{% block primary %}{% endblock %}

<div id="primary" class="block">
	<div class="center">
		{% include '_widget/article.swig' %}
	</div>
</div>
{% include '_partial/footer.swig' %}

{% block scripts %}
<script src="/bower_components/jquery/dist/jquery.min.js"></script>
{% endblock %}
</body>
</html>