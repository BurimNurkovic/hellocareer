setPageHeight = ->
  currentHeight = $('body').height()
  mainContent = $('.hc-content')
  if currentHeight < $(window).height()
    currentPadding = $(window).height() - currentHeight
    if currentPadding > 0
      mainContent.css
        'margin-bottom': currentPadding / 2
        'margin-top': currentPadding / 2
    else
      return false
  else
    mainContent.removeAttr 'style'


# Flash messages
$ ->
  flashTimeout = setTimeout((->
    $('.flash-message').fadeOut 'fast'
  ), 1500)
  $(document).click ->
    clearTimeout flashTimeout
    $('.flash-message').hide()


#Modal box
$ ->
  $('#modal, .button--cancel').on 'click', (event) ->
    if $(event.target).is('.modal #modal, .button--cancel')
      $('#modal').toggle()
      $('body').removeClass 'modal'
  $(document).keyup (event) ->
    #check if user has pressed 'Esc'
    if event.which == '27'
      $('#modal').hide()

#Tips
$ ->
  $(document).on 'click', '.open__button', ->
    currentDiv = $(this).parent().children('.tip__text')
    parrentDiv = $(this).closest('.question-content')
    if parrentDiv.hasClass('tip-open')
      parrentDiv.removeClass 'tip-open'
    else
      parrentDiv.addClass('tip-open').siblings('.question-content').removeClass 'tip-open'



$(document).ready ->
  setPageHeight()

$(window).on 'resize', ->
  setPageHeight()
