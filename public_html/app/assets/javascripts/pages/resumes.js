//= require autosize.min
//= require typeahead.bundle
//= require resumes/autosave
//= require nested_form_fields
//= require date
//= require date.ro


$(function () {
  $('a#submit-resume-btn').on('click', function () {
    link = $(this);
    if (link.data('signed-in') == true) {
      $('form').submit();
    }
  });

  $(document).on('click', '.resume-next', function(){
    if ($('.resume--cat-nav .selected').is(':last-child')) {
      $(".resume-content form").submit();
    }
    else {
      $('.resume--cat-nav .selected').next().click();
    }
  });

  $(document).on('click', '.resume-prev', function(){
    $('.resume--cat-nav .selected').prev().click();
  });

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

  autosize($('.question-content textarea'));

  $('.autocomplete-question').each(autocompleteHandler);

  $(document).on('focus',".date", function(){
    $(this).datepicker({
      format: "dd/mm/yyyy",
      autoclose: true,
      language: 'ro-RO'
    })
  })

  $(document).on('keyup keypress', '#new_resume input, .edit_resume input', function(e) {
    var code = e.keyCode || e.which;
    if (code == 13) {
      e.preventDefault();
      return false;
    }
  });

  $(document).on('fields_added.nested_form_fields', function (event, params) {
    var context = $(event.target)
    autosize($('.question-content textarea', context));
    $('.autocomplete-question', context).each(autocompleteHandler);
  })

})


$(function () {
  $('#new_resume input').on('change', function(){
    var cntreq = 0;
    var cntvals = 0;
    $('#new_resume input').each(function(i, val) {
        cntreq++;
        if($(this).val() != '') {
            cntvals++;
      }
    });
    var count = (cntvals/cntreq)*100;
    $('#percentage').empty();
    $('#percentage').append(count+'% completed');
  });
})

