<script type="text/javascript">

$(document).ready(function() {

	$(".tab_category").hide();
	$(".tab_category:first").show(); 

	$("ul.tab_cates li").click(function() {
		$("ul.tab_cates li").removeClass("active");
		$(this).addClass("active");
		$(".tab_category").hide();
		$(".tab_category").removeClass("animate1 {$tab_effect}");
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab) .addClass("animate1 {$tab_effect}");
		$("#"+activeTab).fadeIn(); 
	});
});

</script>
<div class="lablistproducts laberthemes">
<div class="tab_catProducts">
	<ul class="tab_cates"> 
		{$count=0}
		{foreach from=$productCates item=productCate name=posTabCategory}
				<li rel="tab_{$productCate.id}" class="{if $smarty.foreach.posTabCategory.first}first_item{elseif $smarty.foreach.posTabCategory.last}last_item{else}{/if} {if $count==0} active {/if}" > 
					{$productCate.name}
					<i class="pe-7s-close"></i>
				</li>
				{$count= $count+1}
		{/foreach}	
	</ul>
</div>



<div class="listcateproducts-slider">
{$wow=0}
{foreach from=$productCates item=productCate name=labtabcategory}
		 <div id="tab_{$productCate.id}" class="tab_category"> 
					<div class="row">
					<div class="listcateproducts-ii">
					<div class="productTabCategorySlider_{$productCate.id}">
							{foreach from=$productCate.product item=product name=myLoop}
								{if $smarty.foreach.myLoop.index % 1 == 0 || $smarty.foreach.myLoop.first }
									<div class="item-inner a{$smarty.foreach.myLoop.index} {if $wow == 0}wow fadeInUp {/if}" {if $wow == 0} data-wow-delay="{$smarty.foreach.myLoop.iteration}00ms" {/if}>
									{/if}
										<div class="item">
											<div class="left-block">
												<div class="product-image-container">
													{capture name='rotatorImg'}{hook h='rotatorImg' product=$product}{/capture}
													{if $smarty.capture.rotatorImg}
														{$smarty.capture.rotatorImg}
													{else}
														<a class = "product_image" href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}">
															<img class="img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'large_default')|escape:'html'}" alt="{$product.name|escape:html:'UTF-8'}" />							
														</a>
													{/if}
													{if isset($product.new) && $product.new == 1}
														<span class="new-label">{l s='New' mod='labtabcategoryslider'}</span>
													{/if}
													{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
															<span class="sale-label">{l s='Sale!' mod='labtabcategoryslider'}</span>
													{/if}
												</div>
												<div class="actions">
													<ul class="add-to-links">	
														<li class="lab-cart">
															{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
																{if ($product.allow_oosp || $product.quantity > 0)}
																	{if isset($static_token)}
																		<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"
																		data-id-product="{$product.id_product|intval}"
																		title="{l s='Add to cart' mod='labtabcategoryslider'}" >
																			<i class="pe-7s-cart"></i>
																			<span>{l s='Add to cart' mod='labtabcategoryslider'}</span>
																		</a>
																	{else}
																		<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"
																		data-id-product="{$product.id_product|intval}"
																		title="{l s='Add to cart' mod='labtabcategoryslider'}">
																			<i class="pe-7s-cart"></i>
																			<span>{l s='Add to cart' mod='labtabcategoryslider'}</span>
																		</a>
																	{/if}						
																{else}
																	<span class="button ajax_add_to_cart_button btn btn-default disabled">
																		<i class="pe-7s-cart"></i>
																		<span>{l s='Add to cart' mod='labtabcategoryslider'}</span>
																	</span>
																{/if}
															{/if}
														</li>
														{if isset($quick_view) && $quick_view}
															<li class="lab-quick-view">
																<a class="quick-view" href="{$product.link|escape:'html':'UTF-8'}"
																	data-id-product="{$product.id_product|intval}"
																	title="{l s='Quick view' mod='labtabcategoryslider'}">
																	<i class="pe-7s-search"></i>
																</a>
															</li>
														{/if}
														{if isset($comparator_max_item) && $comparator_max_item}
															<li class="lab-compare">	
																<a class="add_to_compare" 
																	href="{$product.link|escape:'html':'UTF-8'}" 
																	data-product-name="{$product.name|escape:'htmlall':'UTF-8'}"
																	data-product-cover="{$link->getImageLink($product.link_rewrite, $product.id_image, 'cart_default')|escape:'html'}"
																	data-id-product="{$product.id_product}"
																	title="{l s='Add to Compare' mod='labtabcategoryslider'}">
																	<i class="pe-7s-refresh-2"></i>
																</a>
															</li>
														{/if}
														<li class="lab-Wishlist">
															<a onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', $('#idCombination').val(), 1,'tabproduct'); return false;" class="add-wishlist wishlist_button" href="#"
															data-id-product="{$product.id_product|intval}"
															title="{l s='Add to Wishlist' mod='labtabcategoryslider'}">
															<i class="pe-7s-like"></i></a>
														</li>
													</ul>
													
												</div>
											</div>
											<div class="right-block">
												<h5 class="h5product-name">
													<a class="product-name" href="{$product.link|escape:'html'}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h5>
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
											</div>
										</div>
									{if $smarty.foreach.myLoop.iteration % 1 == 0 || $smarty.foreach.myLoop.last  }
										</div>
									{/if}
							{/foreach}
		
						</div>
					
					
						<div class="lab_boxnp">
							<a class="prev prevtabcate_{$productCate.id}"><i class="icon-angle-left"></i></a>
							<a class="next nexttabcate_{$productCate.id}"><i class="icon-angle-right"></i></a>
						</div>
						</div>
					</div>
				<script type="text/javascript">
					$(document).ready(function() {
					var owl = $(".productTabCategorySlider_{$productCate.id}");
					owl.owlCarousel({
					addClassActive : true,
					items :4,
					itemsDesktop : [1200,3],
					itemsDesktopSmall : [991,3],
					itemsTablet: [767,2],
					itemsMobile : [480,1],
					autoPlay : {if $slideOptions.show_arrow == 0}false {else}true{/if}
					});
					$(".nexttabcate_{$productCate.id}").click(function(){
					owl.trigger('owl.next');
					})
					$(".prevtabcate_{$productCate.id}").click(function(){
					owl.trigger('owl.prev');
					})
					});
				</script>
		</div> <!-- .tab_container -->
		{$wow= $wow+1}
{/foreach}
</div>
</div>