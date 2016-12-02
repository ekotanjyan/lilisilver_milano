<div class="listcateproducts-slider">
				<div class="listcateproducts">
				{foreach from=$productCates item=productCate name=labtabcategory}
						<div class="block col-lg-4 col-md-4 col-sm-6 col-xs-12">
							<div class="listcateproducts-i">
							<h2 class="title_cate" ><span>{$productCate.name}</span></h2>
								<!-- <div class="description">{$productCate.description}</div> -->
								
									<div class="productTabCategorySlider_{$productCate.id}">
											{foreach from=$productCate.product item=product name=myLoop}
												{if $smarty.foreach.myLoop.index % 2 == 0 || $smarty.foreach.myLoop.first }
													<div class="item-inner">
												{/if}
													<div class="item">
														<div class="left">
															<a class ="bigpic_{$product.id_product}_tabcategory product_image" href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}">
																<img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}" alt="{$product.name|escape:html:'UTF-8'}" />
															</a>
															{if isset($quick_view) && $quick_view}
																<a class="quick-view" href="{$product.link|escape:'html':'UTF-8'}"
																	data-id-product="{$product.id_product|intval}"
																	title="{l s='Quick view' mod='labtabproductslider'}">
																	<i class="pe-7s-search"></i>
																</a>
															{/if}
														</div>
														<div class="right ">
															<h5 class="product-name"><a href="{$product.link|escape:'html'}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h5>
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
															
															<div class="lab-cart">
																{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
																	{if ($product.allow_oosp || $product.quantity > 0)}
																		{if isset($static_token)}
																			<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"
																			data-id-product="{$product.id_product|intval}"
																			title="{l s='Add to cart' mod='labtabproductslider'}" >
																				<!-- <i class="pe-7s-cart"></i> -->
																				<span>{l s='Add to cart' mod='labtabproductslider'}</span>
																			</a>
																		{else}
																			<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"
																			data-id-product="{$product.id_product|intval}"
																			title="{l s='Add to cart' mod='labtabproductslider'}">
																				<!-- <i class="pe-7s-cart"></i> -->
																				<span>{l s='Add to cart' mod='labtabproductslider'}</span>
																			</a>
																		{/if}						
																	{else}
																		<span class="button ajax_add_to_cart_button btn btn-default disabled">
																			<!-- <i class="pe-7s-cart"></i> -->
																			<span>{l s='Add to cart' mod='labtabproductslider'}</span>
																		</span>
																	{/if}
																{/if}
															</div>
														</div>
													</div>
												{if $smarty.foreach.myLoop.iteration % 2 == 0 || $smarty.foreach.myLoop.last  }
													</div>
												{/if}
											{/foreach}
									</div>
								
									<!-- <a class="prevtabcate_{$productCate.id}"><i class="icon-angle-left"></i></a>
									<a class="nexttabcate_{$productCate.id}"><i class="icon-angle-right"></i></a> -->
								<script type="text/javascript">
									$(document).ready(function() {
									var owl = $(".productTabCategorySlider_{$productCate.id}");
									owl.owlCarousel({
									items : 1,
									itemsDesktop : [1200,1],
									itemsDesktopSmall : [980,1],
									itemsTablet: [767,2],
									itemsMobile : [480,1],
									autoPlay : {if $slideOptions.show_arrow == 0}false {else}true{/if}
									});
									/*$(".nexttabcate_{$productCate.id}").click(function(){
									owl.trigger('owl.next');
									})
									$(".prevtabcate_{$productCate.id}").click(function(){
									owl.trigger('owl.prev');
									})*/
									});
								</script>
						</div> <!-- .tab_container -->
					</div>
				{/foreach}
				</div>
</div>