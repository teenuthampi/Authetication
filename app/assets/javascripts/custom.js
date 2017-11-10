// like-element
// $(document).ready(function () {
//     $('.like-icon').on('click', function () {
//         $(this).toggleClass('wishlist-active');
//     });
// });

// header
// $(window).scroll(function() {    
//     var scroll = $(window).scrollTop();

//     if (scroll >= 50) {
//         $("header").addClass("fixedheader");
//     } else {
//         $("header").removeClass("fixedheader");
//     }
// });

// css-menu
$("#cssmenu").menumaker({
  title: "Menu",
  format: "multitoggle"
});

// product-slider
jQuery(document).ready(function($) {

  $('#myCarousel').carousel({ 
    interval: false,
  });

  //Handles the carousel thumbnails
  $('[id^=carousel-selector-]').click(function () {
  var id_selector = $(this).attr("id");
  try {
  var id = /-(\d+)$/.exec(id_selector)[1];
  console.log(id_selector, id);
  jQuery('#myCarousel').carousel(parseInt(id));
  } catch (e) {
  console.log('Regex failed!', e);
  }
});
// When the carousel slides, auto update the text
$('#myCarousel').on('slid.bs.carousel', function (e) {
  var id = $('.item.active').data('slide-number');
    $('#carousel-text').html($('#slide-content-'+id).html());
  });
});



// Swiper
var swiper = new Swiper('.swiper-container', {
    loop: true,
    // pagination: '.swiper-pagination',
    paginationClickable: true,
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev'
});

// owl-slider
$(document).ready(function() {
  var owl = $('.owl-carousel');
  owl.owlCarousel({
    margin: 2,
    nav: true,
    dots: false,
    loop: true,
    responsive: {
      0: {
        items: 1
      },
      400: {
        items: 2
      },
      768: {
        items: 3,
        stagePadding: 50
      },
      1200: {
        items: 4,
        stagePadding: 50
      }
    }
  })
})
// owl-slider-end

// dropdown-menu

$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown("10000");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp("10000");
            $(this).toggleClass('open');       
        }
    );
});

// brand-slider

$("#flexiselDemo2").flexisel({
    visibleItems: 4,
    itemsToScroll: 1,
    animationSpeed: 200,
    infinite: true,
    navigationTargetSelector: null,
    autoPlay: {
        enable: true,
        interval: 5000,
        pauseOnHover: true
    },
    responsiveBreakpoints: { 
        portrait: { 
            changePoint:480,
            visibleItems: 1,
            itemsToScroll: 1
        }, 
        landscape: { 
            changePoint:640,
            visibleItems: 2,
            itemsToScroll: 2
        },
        tablet: { 
            changePoint:768,
            visibleItems: 3,
            itemsToScroll: 3
        }
    }
});

$("#flexiselDemo3").flexisel({
    visibleItems: 4,
    itemsToScroll: 1,         
    autoPlay: {
        enable: true,
        interval: 10000,
        pauseOnHover: true
    },
    responsiveBreakpoints: { 
        portrait: { 
            changePoint:480,
            visibleItems: 1,
            itemsToScroll: 1
        }, 
        landscape: { 
            changePoint:640,
            visibleItems: 2,
            itemsToScroll: 2
        },
        tablet: { 
            changePoint:768,
            visibleItems: 3,
            itemsToScroll: 3
        },
        tablet: { 
            changePoint:992,
            visibleItems: 3,
            itemsToScroll: 3
        }
    }     
});

$("#flexiselDemo4").flexisel({
    visibleItems: 4,
    itemsToScroll: 1,         
    autoPlay: {
        enable: true,
        interval: 5000,
        pauseOnHover: true
    }        
});

$("#flexiselDemo5").flexisel({
    visibleItems: 4,
    itemsToScroll: 1,
    autoPlay: {
        enable: true,
        interval: 3000,
        pauseOnHover: true
    }        
});

// content-load

(function($) {

  /**
   * Copyright 2012, Digital Fusion
   * Licensed under the MIT license.
   * http://teamdf.com/jquery-plugins/license/
   *
   * @author Sam Sehnert
   * @desc A small plugin that checks whether elements are within
   *     the user visible viewport of a web browser.
   *     only accounts for vertical position, not horizontal.
   */

  $.fn.visible = function(partial) {
    
      var $t            = $(this),
          $w            = $(window),
          viewTop       = $w.scrollTop(),
          viewBottom    = viewTop + $w.height(),
          _top          = $t.offset().top,
          _bottom       = _top + $t.height(),
          compareTop    = partial === true ? _bottom : _top,
          compareBottom = partial === true ? _top : _bottom;
    
    return ((compareBottom <= viewBottom) && (compareTop >= viewTop));

  };
    
})(jQuery);

var win = $(window);

var allMods = $(".module");

allMods.each(function(i, el) {
  var el = $(el);
  if (el.visible(true)) {
    el.addClass("already-visible"); 
  } 
});

win.scroll(function(event) {
  
  allMods.each(function(i, el) {
    var el = $(el);
    if (el.visible(true)) {
      el.addClass("come-in"); 
    } 
  });
  
});