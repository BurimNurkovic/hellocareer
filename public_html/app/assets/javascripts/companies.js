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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require ckeditor/init
//= require typeahead.bundle

$(function() {
  var autocompleteHandler = function () {
    var question_div = $(this)
    var qid = question_div.data('qid')
    var revision = question_div.data('revision')
    $(this).find('input').typeahead(null, {
      name: qid,
      source: new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.whitespace,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        prefetch: ("/api/questions/" + qid + "/special_data?revision=" + revision)
      })
    })
  }

  $('.autocomplete-question').each(autocompleteHandler);
})
