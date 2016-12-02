
$(document).ready(function(){
    $("#lab_vermenu_link ul li").each(function(){
        var url = document.URL;
        $("#lab_vermenu_link ul li a").removeClass("act");
        $('#lab_vermenu_link ul li a[href="'+url+'"]').addClass('act');
    }); 
    
    $('.lab_vermenu_no_child').hover(function(){
        $(this).addClass("active");
    },function(){
        $(this).removeClass("active");
    })
    
    $('.lab_vermenu').hover(function(){
        if($(this).attr("id") != "lab_vermenu_link"){
            $(this).addClass("active");
        }
    },function(){
        $(this).removeClass("active");
    })
    
    $('.lab_vermenu').hover(function(){
       /*show popup to calculate*/
       $(this).find('.popup').css('display','inline-block');
       
       /* get total padding + border + margin of the popup */
       //var extraWidth       = 0
      // var wrapWidthPopup   = $(this).find('.popup').outerWidth(true); /*include padding + margin + border*/
      // var actualWidthPopup = $(this).find('.popup').width(); /*no padding, margin, border*/
      // extraWidth           = wrapWidthPopup - actualWidthPopup;    
       
       /* calculate new width of the popup*/
       var widthblock1 = $(this).find('.popup .block1').outerWidth(true);
       var widthblock2 = $(this).find('.popup .block2').outerWidth(true);
       var new_width_popup = 0;
       if(widthblock1 && !widthblock2){
           new_width_popup = widthblock1;
       }
       if(!widthblock1 && widthblock2){
           new_width_popup = widthblock2;
       }
       if(widthblock1 && widthblock2){
            if(widthblock1 >= widthblock2){
                new_width_popup = widthblock1;
            }
            if(widthblock1 < widthblock2){
                new_width_popup = widthblock2;
            }
       }
      // var new_outer_width_popup = new_width_popup + extraWidth;
       
       /*define top and left of the popup*/
       var wraper = $('.Labvmegamenu');
       var wWraper = wraper.outerWidth();
       var posWraper = wraper.offset();
       var pos = $(this).offset();
       
      // var xTop = pos.top - posWraper.top + CUSTOMMENU_POPUP_TOP_OFFSET;
       //var xLeft = pos.left - posWraper.left;
       //if ((xLeft + new_outer_width_popup) > wWraper) xLeft = wWraper - new_outer_width_popup;

       //$(this).find('.popup').css('top',xTop);
      // $(this).find('.popup').css('left',xLeft);
       
       /*set new width popup*/
       //$(this).find('.popup').css('width',new_width_popup);
       $(this).find('.popup .block1').css('width',new_width_popup);
       /*return popup display none*/
       $(this).find('.popup').css('display','none');
       /*show hide popup*/
       if(VMEGAMENU_POPUP_EFFECT == 0) $(this).find('.popup').stop().slideDown('slow');
       if(VMEGAMENU_POPUP_EFFECT == 1) $(this).find('.popup').stop().fadeIn('slow');
       if(VMEGAMENU_POPUP_EFFECT == 2) $(this).find('.popup').stop().show('slow');
    },function(){
       if(VMEGAMENU_POPUP_EFFECT == 0) $(this).find('.popup').stop().slideUp();
       if(VMEGAMENU_POPUP_EFFECT == 1) $(this).find('.popup').stop().fadeOut('slow');
       if(VMEGAMENU_POPUP_EFFECT == 2) $(this).find('.popup').stop().hide('fast');
    })
});