

$(document).ready(function(){

  $(document).bind('ajaxError', function(event, jqxhr, settings, exception) {
    var event_button = $(event.currentTarget.activeElement);
    event_button.parents('form').addClass('has-errors');
    var error_div = $('.errors');

    error_div.append($('<li></li>').html(jqxhr.responseText));
  });

  // $(document).bind('ajaxSuccess', function(event, jqxhr, settings, data) {
  //   console.log("SUCCESS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
  //   console.log(event);
  //   console.log(jqxhr);
  //   console.log(settings);
  //   console.log(data);
  //   if ($(event.currentTarget.activeElement).attr('class'))
  //   console.log()
  // })

});

(function($) {

  $.fn.modal_success = function(){
    // close modal
    this.modal('hide');

    // clear form input elements
    // todo/note: handle textarea, select, etc
    this.find('form input[type="text"]').val('');

    // clear error state
    this.clear_previous_errors();
  };

  $.fn.render_form_errors = function(errors){

    $form = this;
    this.clear_previous_errors();
    model = this.data('model');

    // show error messages in input form-group help-block
    $.each(errors, function(field, messages){
      $input = $('input[name="' + model + '[' + field + ']"]');
      $input.closest('.form-group').addClass('has-error').find('.help-block').html( messages.join(' & ') );
    });

  };

  $.fn.clear_previous_errors = function(){
    $('.form-group.has-error', this).each(function(){
      $('.help-block', $(this)).html('');
      $(this).removeClass('has-error');
    });
  }

}(jQuery));
