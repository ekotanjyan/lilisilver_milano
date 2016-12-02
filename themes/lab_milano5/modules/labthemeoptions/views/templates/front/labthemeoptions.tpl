{if $lab_show_color!=0}

<style type="text/css">
{if $lab_cbgcolor !=''}
	/* color:#6fc138  */
.cart_block .cart-info .quantity-formated,
#header .cart_block .price,


.lab_custommenu div.lab_menu .parentMenu a:hover, .lab_custommenu div.lab_menu .parentMenu span.block-title:hover, .lab_custommenu #lab_menu_link ul li a.act, .lab_custommenu #lab_menu_link ul li a:hover, .lab_custommenu div.lab_menu .slow a, .lab_custommenu div.lab_menu.active a, .lab_custommenu div.lab_menu.act, .lab_custommenu div.lab_menu.act a,
#lab_menu_cms .column a:hover, .itemMenu.level1 a.itemMenuName.level4:hover,
.itemMenu.level1 a.itemMenuName.level3:hover,
a:hover,.price,.our_price_display .price,
.support-footer-inner .info-title i,.more-info-ii .idTabs li i,
.footer-container #footer #block_contact_infos > div ul li i,
.footer-container #footer .copyright a,
.footer-container #footer a:hover,.labSearch .current:hover span,
.tabs li i,.breadcrumb,#search_block_top .btn.button-search:hover,
.dropdown .current:hover, .dropdown .toogle_content li a:hover, .dropdown .toogle_content li.selected span, .dropdown .toogle_content li.selected a,
.dropdown .current:hover, .dropdown .toogle_content li a:hover, .dropdown .toogle_content li.selected span, .dropdown .toogle_content li.selected a,
#categories_block_left li span.grower:hover + a, #categories_block_left li a:hover, #categories_block_left li a.selected,
.content_sortPagiBar .display li.selected a, .content_sortPagiBar .display_m li.selected a,
.content_sortPagiBar .display li a:hover, .content_sortPagiBar .display_m li a:hover,
.Labvmegamenu div.lab_vermenu .parentMenu span.block-title:hover, .Labvmegamenu div.lab_vermenu .parentMenu a:hover,
.Labvmegamenu #lab_vermenu_link ul li a.act, .Labvmegamenu #lab_vermenu_link ul li a:hover, .Labvmegamenu div.lab_vermenu.act .parentMenu a, .Labvmegamenu div.lab_vermenu.active .parentMenu a,
.Labvmegamenu .itemverMenu h4.level3:hover, .Labvmegamenu .itemverMenu a.level3:hover,
.Labvmegamenu .itemSubMenu h4.level4:hover, .Labvmegamenu .itemSubMenu a.level4:hover, .Labvmegamenu .itemSubMenu h4.level3:hover, .Labvmegamenu .itemSubMenu a.level3:hover, .Labvmegamenu .itemverMenu a.level4.nochild:hover,
.labAccount a, .labLogin a{
	color:{$lab_cbgcolor};
}

/* background-color:#6fc138 */
.cart_block .cart-buttons a#button_order_cart:hover span,
#footer #newsletter_block_left .form-group .button-small span,
.footer-container #footer #social_block ul li a:hover,

.box_loadMore::before,
.lab-wrap .control.active,
.lab-wrap .control.active a,
.sdsblog-box-content .image_blog::before,
.sdsblog-box-content .image_blog::after,
.listcateproducts .right .button:hover,
.testimonials .owl-page:hover span, .testimonials .owl-page.active span,
.lablistproducts .actions li a.active, .lablistproducts .actions li a.checked, .lablistproducts .actions li a:hover,
#footer #newsletter_block_left .form-group .button-small:hover span,
.nivo-controlNav a:hover, .nivo-controlNav a.active,
.shopping_cart > a .ajax_cart_quantity,
.top-pagination-content ul.pagination li > a:hover span, .bottom-pagination-content ul.pagination li > a:hover span,
.mypresta_scrollup:hover,.laberthemes .lab_boxnp a:hover,
.new-label, .sale-label,
.labvmegamenu_title,
.box-info-product .exclusive span,
#usefull_link_block li a:hover::before, .box-cart-bottom #wishlist_button_nopop:hover::before,
.lablistproducts.list .add-to-links li a.active, .lablistproducts.list .add-to-links li a.checked, .lablistproducts.list .add-to-links li a:hover
{
	background-color:{$lab_cbgcolor};
}
/* border-color:#6fc138 */
.cart_block .cart-buttons a#button_order_cart:hover span,
.footer-container #footer #social_block ul li a:hover::after,
#footer #newsletter_block_left .form-group .button-small span,
.mypresta_scrollup:hover,.laberthemes .lab_boxnp a:hover,
.listcateproducts .right .button:hover,
#usefull_link_block li a:hover::before, .box-cart-bottom #wishlist_button_nopop:hover::before,
.top-pagination-content ul.pagination li > a:hover span, .bottom-pagination-content ul.pagination li > a:hover span,
.lablistproducts .actions li a.active, .lablistproducts .actions li a.checked, .lablistproducts .actions li a:hover,
#footer #newsletter_block_left .form-group .button-small:hover span,
.lablistproducts.list .add-to-links li a.active, .lablistproducts.list .add-to-links li a.checked, .lablistproducts.list .add-to-links li a:hover{
	border-color:{$lab_cbgcolor};
}
{/if}

</style>

{/if}

{if $labshowthemecolor == 1 }
		
{if $labthemecolor And $labthemecolor !='default'}
	<link rel="stylesheet" type="text/css" href="{$PS_BASE_URL}{$PS_BASE_URI}themes/{$LAB_THEMENAME}/css/color/{$labthemecolor}.css" />;
{/if}


{if $labskin }
	<style type="text/css">
		body{
			background-image: url("{$PS_BASE_URL}{$PS_BASE_URI}modules/labthemeoptions/views/templates/front/colortool/images/pattern/{$labskin}.png") ;
		}
	</style>
{/if}
{/if}