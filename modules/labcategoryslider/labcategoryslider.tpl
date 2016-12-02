<div class="listcateproducts-slider">
				<div class="listcateproducts">
				{foreach from=$productCates item=productCate name=labtabcategory}
						<div class="block col-lg-4 col-md-4 col-sm-6 col-xs-12">
							<div class="listcateproducts-i">
							<h2 class="title_cate" ><span>{$productCate.name}</span></h2>
								<div class="description">{$productCate.description}</div>
								<div class="row">
									<div class="productTabCategorySlider_{$productCate.id}">
											{foreach from=$productCate.product item=product name=myLoop}
												{if $smarty.foreach.myLoop.index % 3 == 0 || $smarty.foreach.myLoop.first }
													<div class="item-inner">
												{/if}
													<div class="item row">
														<div class="left col-lg-4 col-md-5 col-sm-6 col-xs-12">
															<a class ="bigpic_{$product.id_product}_tabcategory product_image" href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}">
																<img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}" alt="{$product.name|escape:html:'UTF-8'}" />
															</a>
														</div>
														<div class="right col-lg-8 col-md-7 col-sm-6 col-xs-12">
															<h5 class="product-name"><a href="{$product.link|escape:'html'}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h5>
															
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
												{if $smarty.foreach.myLoop.iteration % 3 == 0 || $smarty.foreach.myLoop.last  }
													</div>
												{/if}
											{/foreach}
									</div>
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