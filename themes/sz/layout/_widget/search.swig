<div class="widget search">
	<form action="//google.com/search" method="get" accept-charset="utf-8">
		<input type="search" name="q" results="0" placeholder="{{ __('search') }}">
		<input type="hidden" name="domains" value="{{ config.url.split('://')[1] }}">
	</form>
</div>