$ ->
  dropDown = $('.nav-dropdown')
  $(document).on 'click', '.nav-pointer', (event) ->
    event.stopPropagation()
    dropDown.toggle()
  $(document).on 'click scroll', ->
    dropDown.hide()

$ ->
  bodyClass = $('body')
  $('.nav--log-in, .nav--sign-up, .sign-in-btn, .resume-design-modal').on 'click', (event) ->
    bodyClass.addClass 'modal'
    $('#modal').toggle()
  $('.navbar-toggle').on 'click', ->
    bodyClass.addClass 'modal'
    $('#navbar-modal').toggle()
  $('#navbar-modal').on 'click', (event) ->
    if $(event.target).is('.modal #navbar-modal')
      bodyClass.removeClass 'modal'
      $('#navbar-modal').toggle()


$(window).on 'scroll', ->
  fromTop = $(window).scrollTop()
  homeHeader = $('#home-index header')
  $('body').toggleClass 'scroll-down', fromTop > windowHeight
  homeHeader.toggleClass 'navbar-fixed', fromTop > windowHeight
  homeHeader.toggleClass 'navbar-transition', fromTop > topHeight
