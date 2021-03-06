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
	{foreach from=$productTabslider item=productTab name=labTabProduct}
		<div id="tab_{$productTab.id}" class="tab_content">
			<div class="productTabContent productTabContent_{$productTab.id} product_list productContent">
			{foreach from=$productTab.productInfo item=product name=myLoop}
				
				{if $smarty.foreach.myLoop.index % 1 == 0 || $smarty.foreach.myLoop.first }
				<div class="item-inner wow fadeInUp " data-wow-delay="{$smarty.foreach.myLoop.iteration}00ms" >
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
				{if $smarty.foreach.myLoop.iteration % 1 == 0 || $smarty.foreach.myLoop.last  }
					</div>
				{/if}
			
			{/foreach}
			</div>
				
	</div>
{foreach from=$languages key=k item=language name="languages"}
	{if $language.iso_code == $lang_iso}
		{assign var='rtl' value=$language.is_rtl}
	{/if}
{/foreach}
	<script>
		$(document).ready(function() {
		var owl = $(".productTabContent_{$productTab.id}");
		owl.owlCarousel({
				autoPlay : false,
				addClassActive : true,
				items :4,
				itemsDesktop : [1200,3],
				itemsDesktopSmall : [991,2],
				itemsTablet: [767,2],
				itemsMobile : [480,1],
			});	
			$(".nextproductTab").click(function(){
			owl.trigger('owl.next');
			})
			$(".prevproductTab").click(function(){
			owl.trigger('owl.prev');
			})		
		});
	</script>
	
	{/foreach}	
	<div class="lab_boxnp">
		<a class="prev prevproductTab"><i class="icon-angle-left"></i></a>
		<a class="next nextproductTab"><i class="icon-angle-right"></i></a>
	</div>
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