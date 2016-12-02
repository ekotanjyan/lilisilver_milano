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

<!-- MODULE Block best sellers -->
<div id="best-sellers_block_right" class="block products_block">
	<h4 class="title_block">
    	<a href="{$link->getPageLink('best-sales')|escape:'html'}" title="{l s='View a top sellers products' mod='blockbestsellers'}">{l s='Top sellers' mod='blockbestsellers'}</a>
    </h4>
	<div class="block_content">
	{if $best_sellers && $best_sellers|@count > 0}
		<ul class="block_content products-block">
			{foreach from=$best_sellers item=product name=myLoop}
			{if $smarty.foreach.myLoop.index <=4 }
			<li class="clearfix">
				<a href="{$product.link|escape:'html'}" title="{$product.legend|escape:'html':'UTF-8'}" class="products-block-image content_img clearfix">
					<img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'small_default')|escape:'html'}" alt="{$product.legend|escape:'html':'UTF-8'}" />
				</a>
				<div class="product-content">
                	<h5>
                    	<a class="product-name" href="{$product.link|escape:'html'}" title="{$product.legend|escape:'html':'UTF-8'}">
                            {$product.name|truncate:50|strip_tags:'UTF-8'|escape:'html':'UTF-8'}
                        </a>
                    </h5>
                    {hook h='displayProductListReviews' product=$product}
                    {if $product.show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
						<div class="lab-price">
							<span class="price">{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}</span>
							<meta itemprop="priceCurrency" content="{$priceDisplay}" />
							{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
								<span class="old-price product-price">
									{displayWtPrice p=$product.price_without_reduction}
								</span>
							{/if}
						</div>
					{/if}
					<div class="actions">
						<ul class="add-to-links">	
							<li class="lab-cart">
								{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
									{if ($product.allow_oosp || $product.quantity > 0)}
										{if isset($static_token)}
											<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"
											data-id-product="{$product.id_product|intval}"
											title="{l s='Add to cart' mod='labtabproductslider'}" >
												<i class="pe-7s-cart"></i>
												<span>{l s='Add to cart' mod='labtabproductslider'}</span>
											</a>
										{else}
											<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"
											data-id-product="{$product.id_product|intval}"
											title="{l s='Add to cart' mod='labtabproductslider'}">
												<i class="pe-7s-cart"></i>
												<span>{l s='Add to cart' mod='labtabproductslider'}</span>
											</a>
										{/if}						
									{else}
										<span class="button ajax_add_to_cart_button btn btn-default disabled">
											<i class="pe-7s-cart"></i>
											<span>{l s='Add to cart' mod='labtabproductslider'}</span>
										</span>
									{/if}
								{/if}
							</li>
							{if isset($quick_view) && $quick_view}
								<li class="lab-quick-view">
									<a class="quick-view" href="{$product.link|escape:'html':'UTF-8'}"
										data-id-product="{$product.id_product|intval}"
										title="{l s='Quick view' mod='labtabproductslider'}">
										<i class="pe-7s-search"></i>
									</a>
								</li>
							{/if}
						</ul>
						
					</div>
                </div>
			</li>
			{/if}
		{/foreach}
		</ul>
		<div class="lnk">
        	<a href="{$link->getPageLink('best-sales')|escape:'html'}" title="{l s='All best sellers' mod='blockbestsellers'}"  class="btn btn-default button button-small"><span>{l s='All best sellers' mod='blockbestsellers'}<i class="icon-chevron-right right"></i></span></a>
        </div>
	{else}
		<p>{l s='No best sellers at this time' mod='blockbestsellers'}</p>
	{/if}
	</div>
</div>
<!-- /MODULE Block best sellers -->