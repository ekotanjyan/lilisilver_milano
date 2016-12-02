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
{strip}
{addJsDef wishlistProductsIds=$wishlist_products}
{addJsDefL name=loggin_required}{l s='You must be logged in to manage your wishlist.' mod='blockwishlist' js=1}{/addJsDefL}
{addJsDefL name=added_to_wishlist}{l s='The product was successfully added to your wishlist.' mod='blockwishlist' js=1}{/addJsDefL}
{addJsDef mywishlist_url=$link->getModuleLink('blockwishlist', 'mywishlist', array(), true)|escape:'quotes':'UTF-8'}
{/strip}
<div id="wishlist_block_top" class="account pull-right">
	{assign var='count' value=$wishlist_products|@count}
		<a href="{$link->getModuleLink('blockwishlist', 'mywishlist', array(), true)|escape:'html':'UTF-8'}" title="{l s='My wishlists' mod='blockwishlist'}" rel="nofollow">
			<span class="pe-7s-like"></span>
			<!-- {if $is_logged}
				<span class="count">{$count}</span>
			{/if} -->
			<!-- {l s='Wishlist' mod='blockwishlist'} -->
		</a>
		<!-- <div id="wishlist_block_list" class="expanded">
			{if $wishlist_products}
				<dl class="products">
					{foreach from=$wishlist_products item=product name=i}
						<dt class="{if $smarty.foreach.i.first}first_item{elseif $smarty.foreach.i.last}last_item{else}item{/if}">
							<span class="quantity-formated">
								<span class="quantity">{$product.quantity|intval}</span>x
							</span>
							<a class="cart_block_product_name" href="{$link->getProductLink($product.id_product, $product.link_rewrite, $product.category_rewrite)|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}">
								{$product.name|truncate:30:'...'|escape:'html':'UTF-8'}
							</a>
							<a class="ajax_cart_block_remove_link" href="javascript:;" rel="nofollow" title="{l s='remove this product from my wishlist' mod='blockwishlist'}" onclick="javascript:WishlistCart('wishlist_block_list', 'delete', '{$product.id_product}', {$product.id_product_attribute}, '0', '{if isset($token)}{$token}{/if}');">
								<i class="icon-remove-sign "></i>
							</a>
						</dt>
						{if isset($product.attributes_small)}
							<dd class="{if $smarty.foreach.i.first}first_item{elseif $smarty.foreach.i.last}last_item{else}item{/if}">
								<a href="{$link->getProductLink($product.id_product, $product.link_rewrite, $product.category_rewrite)|escape:'html':'UTF-8'}" title="{l s='Product detail'}">
									{$product.attributes_small|escape:'html':'UTF-8'}
								</a>
							</dd>
						{/if}
					{/foreach}
					<a class="btn btn-default button button-small" href="{$link->getModuleLink('blockwishlist', 'mywishlist', array(), true)|escape:'html':'UTF-8'}" title="{l s='My wishlists' mod='blockwishlist'}">
						<span>
							{l s='My wishlists' mod='blockwishlist'}<i class="icon-chevron-right right"></i>
						</span>
					</a>
				</dl>
			{else}
				<dl class="products no-products">
					<dt>{l s='No products' mod='blockwishlist'}</dt>
					<dd></dd>
					<a class="btn btn-default button button-small" href="{$link->getModuleLink('blockwishlist', 'mywishlist', array(), true)|escape:'html':'UTF-8'}" title="{l s='My wishlists' mod='blockwishlist'}">
						<span>
							{l s='My wishlists' mod='blockwishlist'}
						</span>
					</a>
				</dl>
			{/if}
			
		</div> --> <!-- #wishlist_block_list -->
		
		<!-- <div class="lnk">
			{if $wishlists}
				<div class="form-group selector1">
					<select name="wishlists" id="wishlists" class="form-control">
						{foreach from=$wishlists item=wishlist name=i}
								<option value="{$wishlist.id_wishlist}"{if $id_wishlist eq $wishlist.id_wishlist or ($id_wishlist == false and $smarty.foreach.i.first)} selected="selected"{/if}>
									{$wishlist.name|truncate:22:'...'|escape:'html':'UTF-8'}
								</option>
						{/foreach}
					</select>
				</div>
			{/if}
			<a class="btn btn-default button button-small" href="{$link->getModuleLink('blockwishlist', 'mywishlist', array(), true)|escape:'html':'UTF-8'}" title="{l s='My wishlists' mod='blockwishlist'}">
				<span>
					{l s='My wishlists' mod='blockwishlist'}<i class="icon-chevron-right right"></i>
				</span>
			</a>
		</div> --> <!-- .lnk -->
</div> <!-- #wishlist_block -->