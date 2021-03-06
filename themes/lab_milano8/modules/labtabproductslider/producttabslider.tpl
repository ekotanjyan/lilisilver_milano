<div class="product-tabs-slider lablistproducts laberthemes">
	<div class="lab_tabs">
		<ul class="tabs"> 
		{$count=0}
		{foreach from=$productTabslider item=productTab name=posTabProduct}
			<li class="{if $smarty.foreach.posTabProduct.first}first_item{elseif $smarty.foreach.posTabProduct.last}last_item{else}{/if} {if $count==0} active {/if}" rel="tab_{$productTab.id}"  >
				{$productTab.name}
				<i class="pe-7s-close"></i>
			</li>
				{$count= $count+1}
		{/foreach}	
		</ul>
	</div>
	{if Hook::exec('labtabproductslider')}
		<div class="static-block">
			{hook h="labtabproductslider"}
		</div>
	{/if}
	<div class="row">
	<div class="tab_container">
	{assign var='nbItemsPerLine' value=4}
	{assign var='nbItemsPerLineTablet' value=3}
	{assign var='nbItemsPerLineMobile' value=2}
	{foreach from=$productTabslider item=productTab name=labTabProduct}
		<div id="tab_{$productTab.id}" class="tab_content">
			<div class="productTabContent div_{$productTab.id} product_list productContent">
			{foreach from=$productTab.productInfo item=product name=myLoop}
				
				
				<div class="item-inner col-lg-3 col-md-3 col-sm-4 col-xs-12  
							{if $smarty.foreach.myLoop.iteration%$nbItemsPerLine == 0} last-in-line
							{elseif $smarty.foreach.myLoop.iteration%$nbItemsPerLine == 1} first-in-line{/if}
							{if $smarty.foreach.myLoop.iteration%$nbItemsPerLineTablet == 0} last-item-of-tablet-line
							{elseif $smarty.foreach.myLoop.iteration%$nbItemsPerLineTablet == 1} first-item-of-tablet-line{/if}
							{if $smarty.foreach.myLoop.iteration%$nbItemsPerLineMobile == 0} last-item-of-mobile-line
							{elseif $smarty.foreach.myLoop.iteration%$nbItemsPerLineMobile == 1} first-item-of-mobile-line{/if}
				">
				
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
									<span class="new-label">{l s='New' mod='labtabproductslider'}</span>
								{/if}
								{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
										<span class="sale-label">{l s='Sale!' mod='labtabproductslider'}</span>
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
									{if isset($comparator_max_item) && $comparator_max_item}
										<li class="lab-compare">	
											<a class="add_to_compare" 
												href="{$product.link|escape:'html':'UTF-8'}" 
												data-product-name="{$product.name|escape:'htmlall':'UTF-8'}"
												data-product-cover="{$link->getImageLink($product.link_rewrite, $product.id_image, 'cart_default')|escape:'html'}"
												data-id-product="{$product.id_product}"
												title="{l s='Add to Compare' mod='labtabproductslider'}">
												<i class="pe-7s-refresh-2"></i>
											</a>
										</li>
									{/if}
									<li class="lab-Wishlist">
										<a onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', $('#idCombination').val(), 1,'tabproduct'); return false;" class="add-wishlist wishlist_button" href="#"
										data-id-product="{$product.id_product|intval}"
										title="{l s='Add to Wishlist' mod='labtabproductslider'}">
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
				
					</div>
				
			
			{/foreach}
			</div>
			<div class="box_loadMore box_{$productTab.id}">
				<a href="javascript:void(0)" class="loadMore loadMore_{$productTab.id} " title="{l s='load More' mod='labtabproductslider'}">{l s='load More' mod='labtabproductslider'}</a>	
			</div>
	</div>

	<script>
			$(function () {
			var page = 1,
			moving = false;
			var animationIteration = "animationiteration webkitAnimationIteration mozAnimationIteration oAnimationIteration oanimationiteration",
			transitionEnd      = "transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd";
			$(".div_{$productTab.id} .item-inner").slice(0, 8).addClass('active').show();
			$(".loadMore_{$productTab.id}").on('click', function (e) {
				setTimeout(function() {
					e.preventDefault();
					$(".div_{$productTab.id} .item-inner:hidden").slice(0, 4).addClass('active').slideDown();
					if ($(".div_{$productTab.id} .item-inner:hidden").length == 0) {
						$(".box_{$productTab.id}").fadeOut('slow');
					}
				},2000);
				
			});
			$(".loadMore_{$productTab.id}").on("click", function() {
			  if ( moving == false ) {
				moving = true;
				$(".loadMore_{$productTab.id}").addClass("active");
				setTimeout(function() {
				  $(".loadMore_{$productTab.id}").one(animationIteration, function() {
					$(".loadMore_{$productTab.id}").removeClass("active");
					$(".loadMore_{$productTab.id}").one(transitionEnd, function() {
					  page++;
					  moving = false;
					});
				  });
				}, 1000);
			  }
			});
	});
	</script>
	
	{/foreach}	

</div> <!-- .tab_container -->
</div>
</div>
<script type="text/javascript"> 
	$(document).ready(function() {
		$(".tab_content").hide();
		$(".tab_content:first").show(); 
		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active");
			$(this).addClass("active");
			$(".tab_content").hide();
			$(".tab_content").removeClass("animate1 {$tab_effect}");
			var activeTab = $(this).attr("rel"); 
			$("#"+activeTab) .addClass("animate1 {$tab_effect}");
			$("#"+activeTab).fadeIn(); 
		});
	});
</script>