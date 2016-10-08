var autosave
$(function () {
  autosave = function () {
    var form = $('form.edit_resume')

    if (form.length) {
      $.ajax({
        type: 'POST',
        url: form.attr('action'),
        data: form.serialize(),
        dataType: "script",
        success: function(data) {
        },
        complete: function() {
          setTimeout(autosave, 45000);
        }
      });
    }
  }

  setTimeout(autosave, 45000);
})
