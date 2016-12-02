{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<!DOCTYPE HTML>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8 ie7"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9 ie8"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<!--[if gt IE 8]> <html class="no-js ie9"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<html{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}>
	<head>
		<meta charset="utf-8" />
		<title>{$meta_title|escape:'html':'UTF-8'}</title>
		{if isset($meta_description) AND $meta_description}
			<meta name="description" content="{$meta_description|escape:'html':'UTF-8'}" />
		{/if}
		{if isset($meta_keywords) AND $meta_keywords}
			<meta name="keywords" content="{$meta_keywords|escape:'html':'UTF-8'}" />
		{/if}
		<meta name="generator" content="PrestaShop" />
		<meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow" />
		<meta name="viewport" content="width=device-width, minimum-scale=0.25, maximum-scale=1.6, initial-scale=1.0" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<link rel="icon" type="image/vnd.microsoft.icon" href="{$favicon_url}?{$img_update_time}" />
		<link rel="shortcut icon" type="image/x-icon" href="{$favicon_url}?{$img_update_time}" />
		{if isset($css_files)}
			{foreach from=$css_files key=css_uri item=media}
				<link rel="stylesheet" href="{$css_uri|escape:'html':'UTF-8'}" type="text/css" media="{$media|escape:'html':'UTF-8'}" />
			{/foreach}
		{/if}
		{if isset($js_defer) && !$js_defer && isset($js_files) && isset($js_def)}
			{$js_def}
			{foreach from=$js_files item=js_uri}
			<script type="text/javascript" src="{$js_uri|escape:'html':'UTF-8'}"></script>
			{/foreach}
		{/if}
		{$HOOK_HEADER}
		<link rel="stylesheet" href="http{if Tools::usingSecureMode()}s{/if}://fonts.googleapis.com/css?family=Open+Sans:300,600&amp;subset=latin,latin-ext" type="text/css" media="all" />
		<!--[if IE 8]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
	</head>
	<body itemscope itemtype="http://schema.org/WebPage" {if isset($page_name)} id="{$page_name|escape:'html':'UTF-8'}"{/if} class="{if $page_name !='index'}subPage{/if} {if isset($page_name)}{$page_name|escape:'html':'UTF-8'}{/if}{if isset($body_classes) && $body_classes|@count} {implode value=$body_classes separator=' '}{/if}{if $hide_left_column} hide-left-column{else} show-left-column{/if}{if $hide_right_column} hide-right-column{else} show-right-column{/if}{if isset($content_only) && $content_only} content_only{/if} lang_{$lang_iso}">
	{if !isset($content_only) || !$content_only}
		{if isset($restricted_country_mode) && $restricted_country_mode}
			<div id="restricted-country">
				<p>{l s='You cannot place a new order from your country.'}{if isset($geolocation_country) && $geolocation_country} <span class="bold">{$geolocation_country|escape:'html':'UTF-8'}</span>{/if}</p>
			</div>
		{/if}
		<div id="page" {if $lab_mode_theme == 'labbox'}class="{$lab_mode_theme}"{/if}>
			<div class="header-container">
				<header id="header">
					{capture name='displayBanner'}{hook h='displayBanner'}{/capture}
					{if $smarty.capture.displayBanner}
						<div class="banner">
							<div class="container">
								<div class="row">
									{$smarty.capture.displayBanner}
								</div>
							</div>
						</div>
					{/if}
					<div class="labHeader">
						<div class="container">
							<div class="row">
								
								<div id="header_logo" class="pull-left col-lg-2 col-md-2 col-sm-3 col-xs-12">
									<a href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}" title="{$shop_name|escape:'html':'UTF-8'}">
										<img class="logo img-responsive" src="{$logo_url}" alt="{$shop_name|escape:'html':'UTF-8'}"{if isset($logo_image_width) && $logo_image_width} width="{$logo_image_width}"{/if}{if isset($logo_image_height) && $logo_image_height} height="{$logo_image_height}"{/if}/>
									</a>
								</div>
								
								<div class=" displayTop pull-right col-lg-2 col-md-2 col-sm-4 col-xs-12">
										{if isset($HOOK_TOP)}{$HOOK_TOP}{/if}
										{capture name='displayNav'}{hook h='displayNav'}{/capture}
										{if $smarty.capture.displayNav}
											<div class="dropdown pull-right">
												<div class="current">
													<span class="pe-7s-menu"></span>
												</div>
												<div class="toogle_content" style="display:none">
													{$smarty.capture.displayNav}
												</div>
											</div>
										{/if}
										
										{capture name='labSearch'}{hook h='labSearch'}{/capture}
										{if $smarty.capture.labSearch}
											<div class="labSearch dropdown  pull-right">
												<div class="current">
													<span class="icon_search pe-7s-search pe-rotate-90"></span>
													<span class="pe-7s-close icon_close"></span>
												</div>
													{$smarty.capture.labSearch}
											</div>
										{/if}
								</div>
								{capture name='labMegamenu'}{hook h='labMegamenu'}{/capture}
								{if $smarty.capture.labMegamenu}
									<div class="labMegamenu col-lg-8 col-md-8 col-sm-5 col-xs-12">
										{$smarty.capture.labMegamenu}
									</div>
								{/if}
							</div>
						</div>
					</div>
				</header>
			</div>
			
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='bannerSlide'}{hook h='bannerSlide'}{/capture}
				{if $smarty.capture.bannerSlide}
					{if $page_name == "index"}
						<div class="labbannerSlide">
							{$smarty.capture.bannerSlide}
						</div>
					{/if}
				{/if}
			{/if}
			
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='blockPosition1'}{hook h='blockPosition1'}{/capture}
				{if $smarty.capture.blockPosition1}
					<div class="blockPosition1 blockPosition">
						<div class="container">
							<div class="row">
								{$smarty.capture.blockPosition1}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='blockPosition2'}{hook h='blockPosition2'}{/capture}
				{if $smarty.capture.blockPosition2}
					<div class="blockPosition2 blockPosition">
						<div class="container">
							<div class="row">
								{$smarty.capture.blockPosition2}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='blockPosition3'}{hook h='blockPosition3'}{/capture}
				{if $smarty.capture.blockPosition3}
					<div class="blockPosition3 blockPosition">
						<div class="container">
							<div class="row">
								{$smarty.capture.blockPosition3}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='manufacturer'}{hook h='manufacturer'}{/capture}
				{if $smarty.capture.manufacturer}
					<div class="manufacturer">
						<div class="container">
							<div class="row">
								{$smarty.capture.manufacturer}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='blockPosition4'}{hook h='blockPosition4'}{/capture}
				{if $smarty.capture.blockPosition4}
					<div class="blockPosition4 blockPosition">
						<div class="container">
							<div class="row">
								{$smarty.capture.blockPosition4}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			
			
			{if $page_name|escape:'html':'UTF-8' != 'index'}
			<div class="labbreadcrumb">
				<div class="container">
					<div class="breadcrumb-i">
					{if $page_name !='index' && $page_name !='pagenotfound'}
						{include file="$tpl_dir./breadcrumb.tpl"}
					{/if}
					</div>
				</div>
			</div>
			{/if}
			<!--  -->
			{if $page_name =='category'}
			<div class="imageCate">
				<div class="container">
					<div class="content_scene_cat_bg"{if $category->id_image} style="background:url({$link->getCatImageLink($category->link_rewrite, $category->id_image, 'category_default')|escape:'html':'UTF-8'}) right center no-repeat; background-size:cover; min-height:{$categorySize.height}px;"{/if}>
					</div>
				</div>
            </div>
			{/if}
			<!--  -->
			<div class="columns-container">
				<div id="columns" class="container">
					
					{capture name='displayTopColumn'}{hook h='displayTopColumn'}{/capture}
						{if $smarty.capture.displayTopColumn}
							<div id="slider_row" class="row">
								<div id="top_column" class="center_column col-xs-12 col-sm-12">{$smarty.capture.displayTopColumn}</div>
							</div>
						{/if}
					<div class="row">
						{if isset($left_column_size) && !empty($left_column_size)}
						<div id="left_column" class="column col-xs-12 col-sm-{$left_column_size|intval}">{$HOOK_LEFT_COLUMN}</div>
						{/if}
						{if isset($left_column_size) && isset($right_column_size)}{assign var='cols' value=(12 - $left_column_size - $right_column_size)}{else}{assign var='cols' value=12}{/if}
						<div id="center_column" class="center_column col-xs-12 col-sm-{$cols|intval}">
	{/if}
