//= require jquery
//= require masonry.min


$(window).load(function() {
  // $('.masonry').masonry({
  //  itemSelector: '.content-item',
  //   percentPosition: true,
  //   columnWidth: '.grid-sizer',
  //   gutter: '.gutter-sizer'
  // });
left_side_height = 0, right_side_height = 0, masonry_height = 0, masonry = $(".masonry")


masonry.css("position","relative");
masonry.children().each(function(index, element) {
  child = $(this)
  if(left_side_height<=right_side_height)
  {
    child.css("width","48.3333%")
    child.css("position","absolute")
    child.css("top",left_side_height+"px") 
    left_side_height+=parseInt(child.outerHeight(true))
    if(masonry_height < left_side_height)
      masonry_height = left_side_height
  }

  else if(right_side_height<left_side_height)
  {
    child.css("top",right_side_height+"px")
    child.css("left","51.6666%") 
    3.33333333333
    child.css("width","48.3333%")
    child.css("position","absolute")
    right_side_height+=parseInt(child.outerHeight(true))


    if(masonry_height<right_side_height)
      masonry_height = right_side_height
  }
  masonry.css("height",masonry_height+"px");

  });
})

