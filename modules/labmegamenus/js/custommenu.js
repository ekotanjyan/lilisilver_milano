
$(document).ready(function(){
    $("#lab_menu_link ul li").click(function(){
        var url = document.URL;
        $("#pt_menu_link ul li a").removeClass("act");
        $('#pt_menu_link ul li a[href="'+url+'"]').addClass('act');
    });     
/*     $('.lab_menu').hover(function(){
        if($(this).attr("id") != "lab_menu_link"){
            $(this).addClass("active");
        }
    },function(){
        $(this).removeClass("active");
    }) */
    
    $('.lab_menu').hover(function(){
       /*show popup to calculate*/
       $(this).find('.popup').css('display','inline-block');
       /* get total padding + border + margin of the popup */
       var extraWidth       = 0
       var wrapWidthPopup   = $(this).find('.popup').outerWidth(true); /*include padding + margin + border*/
       var actualWidthPopup = $(this).find('.popup').width(); /*no padding, margin, border*/
       extraWidth           = wrapWidthPopup - actualWidthPopup;    
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
       var new_outer_width_popup = new_width_popup + extraWidth;
       
       /*define top and left of the popup*/
       var wraper = $('.lab_custommenu');
       var wWraper = wraper.outerWidth();
       var labWraper = wraper.offset();
       var lab = $(this).offset();
       var xTop = lab.top - labWraper.top + CUSTOMMENU_POPUP_TOP_OFFSET;
       var xLeft = lab.left - labWraper.left;
       if ((xLeft + new_outer_width_popup) > wWraper) xLeft = wWraper - new_outer_width_popup;
       $(this).find('.popup').css('top',xTop);
       $(this).find('.popup').css('left',xLeft);
       /*set new width popup*/
       $(this).find('.popup').css('width',new_width_popup);
       $(this).find('.popup .block1').css('width',widthblock1);
       /*return popup display none*/
       $(this).find('.popup').css('display','none');
       /*show hide popup*/
       if(CUSTOMMENU_POPUP_EFFECT == 0) $(this).find('.popup').stop(true,true).addClass('slow').slideDown('slow');
       if(CUSTOMMENU_POPUP_EFFECT == 1) $(this).find('.popup').stop(true,true).addClass('slow').fadeIn('slow');
       if(CUSTOMMENU_POPUP_EFFECT == 2) $(this).find('.popup').stop(true,true).addClass('slow');
       if(CUSTOMMENU_POPUP_EFFECT == 2) $(this).find('.parentMenu').stop(true,true).addClass('slow');
    },function(){
       if(CUSTOMMENU_POPUP_EFFECT == 0) $(this).find('.popup').stop(true,true).removeClass('slow').slideUp();
       if(CUSTOMMENU_POPUP_EFFECT == 1) $(this).find('.popup').stop(true,true).removeClass('slow').fadeOut('slow');
       if(CUSTOMMENU_POPUP_EFFECT == 2) $(this).find('.popup').stop(true,true).removeClass('slow');
       if(CUSTOMMENU_POPUP_EFFECT == 2) $(this).find('.parentMenu').stop(true,true).removeClass('slow');
    })
});