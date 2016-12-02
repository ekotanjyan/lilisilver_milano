<!-- Block user information module NAV  -->
	<h3>{l s='My account' mod='blockuserinfo'}</h3>
	<ul class="userinformation">
		{$context = Context::getContext()}
		<!-- <li><a href="{$link->getPageLink('contact', true)|escape:'html':'UTF-8'}" title="{l s='Contact Us' mod='blockcontact'}">
			{l s='Contact Us' mod='blockuserinfo'}
		</a></li> -->
		<li><a class="link-myaccount" href="{$link->getPageLink('my-account', true)|escape:'html'}" title="{l s='My account' mod='blockuserinfo'}">
			{l s='My account' mod='blockuserinfo'}
		</a></li>
		<li><a class="link-wishlist wishlist_block" href="{$context->link->getModuleLink('blockwishlist', 'mywishlist')}" title="{l s='My wishlist' mod='blockuserinfo'}">
		{l s='My wishlist' mod='blockuserinfo'}</a></li>
		{if !$PS_CATALOG_MODE}
		<li class="last"><a class="link-mycart" href="{$link->getPageLink('order', true)|escape:'html'}" title="{l s='My cart' mod='blockuserinfo'}">
			{l s='My cart' mod='blockuserinfo'}</a></li>
		{/if}
		<li class="labLogin">
			{if $is_logged}
				<a class="logout" href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log me out' mod='blockuserinfo'}">
					{l s='Sign out' mod='blockuserinfo'}
				</a>
				<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" title="{l s='View my customer account' mod='blockuserinfo'}" class="account" rel="nofollow"><span>{$cookie->customer_firstname} {$cookie->customer_lastname}</span></a>
			{else}
				<a class="login" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log in to your customer account' mod='blockuserinfo'}">
					{l s='Sign in' mod='blockuserinfo'}
					<span>{l s='or' mod='blockuserinfo'}</span>
					{l s='Register' mod='blockuserinfo'}
				</a>
			{/if}
		</li>
	</ul>
<!-- /Block usmodule NAV -->
