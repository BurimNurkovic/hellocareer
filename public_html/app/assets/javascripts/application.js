// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require layouts/header
//= require layouts/components
//= require layouts/ajax_devise
//= require pages/resumes
//= require pages/home
//= require pdf/main
//= require users/dashboard


var windowHeight = $(window).height();
var topHeight = $('.navbar').height();

$(function(){
  var navHeight = $('.resume--cat-nav').height();
  $(window).scroll(function() {
      if ($(this).scrollTop() >= 80) {
          $('.resume--cat-nav').addClass('fixed');
          $('.resume-content').css('margin-top', navHeight);
      }
      else {
          $('.resume--cat-nav').removeClass('fixed');
          $('.resume-content').css('margin-top', '0px');
      }
  });
});

// Huinea de la Javascrpitiori

var remove_item = function(assoc_field_name) {
  var pressed_button = $('a[data-delete-association-field-name="' + assoc_field_name + '"]');
  // console.log(`a[data-delete-association-field-name="${assoc_field_name}"]`);
  var parent_fieldset = pressed_button.closest("fieldset");
  var id = parent_fieldset.find("input[type=hidden]").attr("value");
  var model = parent_fieldset.attr('class').split(" ")[1].slice(14);
  $.ajax({
    type: "DELETE",
    url: "/destroy-answer",
    data: {
      "id": id,
      "model": model,
    },
    dataType: "script",
    success: function(data) {
      parent_fieldset.remove();
      // console.log("Deleted successfully!");
      countInputFields();
    }
  });
}

var add_item = function() {
  $(".cat-fields").children("input[type=hidden]").remove();
  var form = $('form.edit_resume');
  $.ajax({
    type: 'POST',
    url: form.attr('action'),
    data: form.serialize(),
    dataType: "script",
    success: function(data) {
      // console.log('Resume submitted');
    }
  });
  countInputFields();
}

$(function() {
  $(".resume-slider").on("click", ".remove-item", function(e) {
    assoc_field_name = $(e.target).attr('data-delete-association-field-name');
    setTimeout(remove_item(assoc_field_name), 1000);
  });

  $('.resume-slider').on('click', '.add-item', function(e) {
    setTimeout(add_item, 1000);
  });
});

function countInputFields() {
  var $inputFields = $('.question-content .input-text, .question-content .tt-input, .question-content select');
  // console.log('Length - ', $inputFields.length)

  var percentage = 0;
  var inputLength = 100 / $inputFields.length

  $inputFields.each(function(){
    if($(this).val() != "")
      percentage += inputLength;
  });

  // console.log(inputLength, percentage)

  var progressbar = $( "#progress-bar" ),
      progressLabel = $( ".progress-label" );

  progressbar.progressbar({
    value: percentage
  });

  progressLabel.text( Math.round(progressbar.progressbar( "value" )) + "%" )
}

$(function() {
  $(document).on('change', '.question-content .input-text, .question-content .tt-input, .question-content select', function(){
    countInputFields()
  })
});

// Sfirsitul huinelei






jQuery(document).ready(function($){
  countInputFields()
  $('#resume__new').css('min-height', windowHeight + $('header').height());

  var slidesWrapper = $('.resume-slider');

  $('.resume-slider li').first().addClass('selected');

  if ( slidesWrapper.length > 0 ) {
    var  sliderNav = $('.resume--cat-nav, .resume__cat-nav'),
      navigationMarker = $('.cd-marker'),
      slidesNumber = slidesWrapper.children('li').length,
      visibleSlidePosition = 0;

    //change visible slide
    sliderNav.on('click', 'li', function(event){
      event.preventDefault();
      var selectedItem = $(this);
      if(!selectedItem.hasClass('selected')) {
        // if it's not already selected
        var selectedPosition = selectedItem.index(),
          activePosition = slidesWrapper.find('li.selected').index();

        if( activePosition < selectedPosition) {
          nextSlide(slidesWrapper.find('.selected'), slidesWrapper, sliderNav, selectedPosition);
        } else {
          prevSlide(slidesWrapper.find('.selected'), slidesWrapper, sliderNav, selectedPosition);
        }

        updateSliderNavigation(sliderNav, selectedPosition);
        updateNavigationMarker(navigationMarker, selectedPosition+1);
      }
    });
  }

  function nextSlide(visibleSlide, container, pagination, n){
    visibleSlide.removeClass('selected from-left from-right').addClass('is-moving').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function(){
      visibleSlide.removeClass('is-moving');
    });

    container.children('li').eq(n).addClass('selected from-right').prevAll().addClass('move-left');

    $('html, body').animate({
        scrollTop: $("#top-nav").offset().top
    }, 200);

    var navHeight = $('.resume--cat-nav').height();

    $('body').animate({
        scrollTop: $(".resume-content").offset().top - navHeight
    }, 200);
  }

  function prevSlide(visibleSlide, container, pagination, n){
    visibleSlide.removeClass('selected from-left from-right').addClass('is-moving').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function(){
      visibleSlide.removeClass('is-moving');
    });

    container.children('li').eq(n).addClass('selected from-left').removeClass('move-left').nextAll().removeClass('move-left');
    $('html, body').animate({
        scrollTop: $("#top-nav").offset().top
    }, 200);

    var navHeight = $('.resume--cat-nav').height();

    $('body').animate({
        scrollTop: $(".resume-content").offset().top - navHeight
    }, 200);
  }

  function updateSliderNavigation(pagination, n) {
    var navigationDot = pagination.find('.selected');
    navigationDot.removeClass('selected');
    pagination.find('li').eq(n).addClass('selected');
  }

  function updateNavigationMarker(marker, n) {
    marker.removeClassPrefix('item').addClass('item-'+n);

    $('.nav-category h3').html($('.nav-pagination .selected span').html());
  }

  $.fn.removeClassPrefix = function(prefix) {
    //remove all classes starting with 'prefix'
      this.each(function(i, el) {
          var classes = el.className.split(" ").filter(function(c) {
              return c.lastIndexOf(prefix, 0) !== 0;
          });
          el.className = $.trim(classes.join(" "));
      });
      return this;
  };
});

$(function() {
  $('.content-box').first().addClass('open-box');
  $('.content-tool .tool-name').on('click', function() {
    var tool_id = $(this).parents('.content-tool').attr('id')
    $('.content-box.' + tool_id).addClass('open-box').siblings().removeClass('open-box')
  })
});
