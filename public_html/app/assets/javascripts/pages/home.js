//= require flexslider.min
//= require owl.carousel


function setHomeImage() {
  var textHeight = $('.hc-center').height();
  var windowHeight = $(window).height();
  var marginText = (windowHeight - topHeight - textHeight)/2;
  $('.hc-masthead').height(windowHeight);
  $('.hc-center').css( {'padding-top': marginText, 'padding-bottom': marginText} );
}

// Benefits
$(function(){
  var selectedBenefit = $('.home-benefits li');

  //First benefit
  selectedBenefit.first().addClass('is-open');

  selectedBenefit.on('click', function(){
    $(this).toggleClass('is-open').siblings('li.is-open').removeClass('is-open');
  });

});

// Testimonials flex-slider
$(function(){
  $('.testimonials-slider').flexslider({
    selector: ".testimonials-list > li",
    animation: "slide",
    controlNav: false,
    slideshow: true,
    smoothHeight: true,
    start: function(){
      $('.testimonials-list').children('li').css({
        'opacity': 1,
        'position': 'relative'
      });
    }
  });
})

$(document).ready(function(){
  setHomeImage();

  var owl = $('#testimonials-slider');
  owl.owlCarousel({
    items : 2,
    itemsDesktop : [992,2],
    itemsDesktopSmall : [768,2],
    itemsTablet: [600,1],
    itemsMobile : false,
    autoPlay: true,
  });

  $(".carousel-next").click(function(){
    owl.trigger('owl.next');
  })
  $(".carousel-prev").click(function(){
    owl.trigger('owl.prev');
  })



  $('.home-call-to-action .link-button').css('marginTop', ($('.home-call-to-action .grid-col-7').outerHeight(true) - $('.home-call-to-action .link-button').outerHeight(true))/2 );
});

$(window).on('resize', function() {
  setHomeImage();
});
