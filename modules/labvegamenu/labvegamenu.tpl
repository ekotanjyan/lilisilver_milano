
<div class="navleft-container">
	<div class="pt_vmegamenu_title">
		<h2>{l s='All categories' mod='labvegamenu'}</h2>
	</div>
    <div id="pt_vmegamenu" class="pt_vmegamenu">
        {$vegamenu}
    </div>
</div>

<script type="text/javascript">
var VMEGAMENU_POPUP_EFFECT = {$effect};
    $("#pt_ver_menu_link ul li").each(function(){
        var url = document.URL;
        $("#pt_ver_menu_link ul li a").removeClass("act");
        $('#pt_ver_menu_link ul li a[href="'+url+'"]').addClass('act');
    });
    $('.pt_menu').hover(function(){
        if(VMEGAMENU_POPUP_EFFECT == 0) $(this).find('.popup').stop(true,true).slideDown('slow');
        if(VMEGAMENU_POPUP_EFFECT == 1) $(this).find('.popup').stop(true,true).fadeIn('slow');
        if(VMEGAMENU_POPUP_EFFECT == 2) $(this).find('.popup').stop(true,true).show('slow');
    },function(){
        if(VMEGAMENU_POPUP_EFFECT == 0) $(this).find('.popup').stop(true,true).slideUp('fast');
        if(VMEGAMENU_POPUP_EFFECT == 1) $(this).find('.popup').stop(true,true).fadeOut('fast');
        if(VMEGAMENU_POPUP_EFFECT == 2) $(this).find('.popup').stop(true,true).hide('fast');
    });
</script>