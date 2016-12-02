<div class="laberthemes">
    <div class='lab_title'>
		<h4>
			<span>{l s='Latest News' mod='smartbloghomelatestnews'}</span>
		</h4>
	</div>
    
    <div class="row">
	<div class="labnewsmartblog">
    <div class="sdsblog-box-content">
        {if isset($view_data) AND !empty($view_data)}
            {assign var='i' value=1}
            {foreach from=$view_data item=post name=myLoop}
                    {assign var="options" value=null}
                    {$options.id_post = $post.id}
                    {$options.slug = $post.link_rewrite}
                    <div class="item-inner wow fadeInUp " data-wow-delay="{$smarty.foreach.myLoop.iteration}00ms">
						<div class="item-i">
							
								<div class="image_blog col-lg-6 col-md-6 col-sm-12 col-xs-12">
									 <a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}"><img alt="{$post.title}" class="feat_img_small" src="{$modules_dir}smartblog/images/{$post.post_img}-home-default.jpg"></a>
								</div>
								<div class="content-blog col-lg-6 col-md-6 col-sm-12 col-xs-12">
									<p class="date_added">{$post.date_added}</p>
									<h2 class="labname"><a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}">{$post.title}</a></h2>
									<a class="Read more" href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}">{l s='Read more >>' mod='smartbloghomelatestnews'}</a>
									
								</div>
							
						</div>
                    </div>
                
                {$i=$i+1}
            {/foreach}
        {/if}
     </div>
   
	<div class="lab_boxnp">
		<a class="prev labnewblogprev"><i class="icon-angle-left"></i></a>
		<a class="next labnewblognext"><i class="icon-angle-right"></i></a>
	</div>
	</div>
	</div>
</div>
{foreach from=$languages key=k item=language name="languages"}
	{if $language.iso_code == $lang_iso}
		{assign var='rtl' value=$language.is_rtl}
	{/if}
{/foreach}
<script>
    $(document).ready(function() {
	var owl = $(".sdsblog-box-content");
    owl.owlCarousel({
		autoPlay : false,
		addClassActive : true,
		items :2,
		itemsDesktop : [1024,2],
		itemsDesktopSmall : [980,2],
		itemsTablet: [767,1],
		itemsMobile : [480,1],
	});
	$(".labnewblognext").click(function(){
	owl.trigger('owl.next');
	})
	$(".labnewblogprev").click(function(){
	owl.trigger('owl.prev');
	})
    });
</script>