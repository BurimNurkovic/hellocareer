// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function () {
  $.ajax({
    url : '/api/blog_posts/recent',
    type : 'get',
    async: true,
    success : function(data) {
      var list = $('<ul>')
      $.each(data, function (i, d) {
        list.append($('<li class="grid-col-6 grid-col__left col-space__both">').append($('<a>',{'href': d.url, 'class': 'blog-title'}).append(d.title)))
      })
      $('#recent_blog_posts').append(list)
    },
    error: function() {
    }
 });
})
