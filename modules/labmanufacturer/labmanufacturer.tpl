{*
* 2007-2014 PrestaShop
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
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<!-- Block manufacturers module -->
<div id="lablogo" class="lablistproducts manufacturer-logo col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<h2 class="lab_title">{if $display_link_manufacturer}
		<a href="{$link->getPageLink('manufacturer')|escape:'html'}" title="{l s='Manufacturers' mod='blockmanufacturer'}">{/if}
			<span>{l s='Manufacturers' mod='blockmanufacturer'}</span>
			{if $display_link_manufacturer}</a>{/if}
	</h2>
	{if Hook::exec('labmanufacturer')}
		<div class="static-block">
			{hook h="labmanufacturer"}
		</div>
	{/if}
	<div class="block_content">
{if $manufacturers}
	<div class="lab-manufacturer-logo">
	{foreach from=$manufacturers item=manufacturer name=myLoop}
		{if $smarty.foreach.myLoop.iteration <= $text_list_nb}
		
			{if $smarty.foreach.myLoop.index % 1 == 0 || $smarty.foreach.myLoop.first }
				<div class="item-inner">
			{/if}
					<div class="item-i {if $smarty.foreach.manufacturer_list.last}last_item{elseif $smarty.foreach.manufacturer_list.first}first_item{/if}">
						<a href="{$link->getmanufacturerLink($manufacturer.id_manufacturer, $manufacturer.link_rewrite)|escape:'html'}" title="{l s='More about %s' sprintf=[$manufacturer.name] mod='blockmanufacturer'}">
							<img src="{$img_manu_dir}{$manufacturer.image|escape:'html':'UTF-8'}.jpg" alt="{$manufacturer.name|escape:'html':'UTF-8'}" />
						</a>
					</div>
			{if $smarty.foreach.myLoop.iteration % 1 == 0 || $smarty.foreach.myLoop.last  }
				</div>
			{/if}
		{/if}
	{/foreach}
	</div>
	<a class="nextmanu"></a>
	<a class="prevmanu"></a>
{else}
	<p>{l s='No manufacturer' mod='blockmanufacturer'}</p>
{/if}
	</div>
</div>
{foreach from=$languages key=k item=language name="languages"}
	{if $language.iso_code == $lang_iso}
		{assign var='rtl' value=$language.is_rtl}
	{/if}
{/foreach}	
<script>
    $(document).ready(function() {
    var owl = $(".lab-manufacturer-logo");
	owl.owlCarousel({
		autoPlay : false,
		items :6,
		itemsDesktop : [1024,5],
		itemsDesktopSmall : [980,4],
		itemsTablet: [767,3],
		itemsMobile : [480,2],
	});
		$(".nextmanu").click(function(){
		owl.trigger('owl.next');
		})
		$(".prevmanu").click(function(){
		owl.trigger('owl.prev');
		})   
    });
</script>
<!-- /Block manufacturers module -->
