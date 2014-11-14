$ ->
  $('#notes li.note').on "click", (ev) ->
    ev.preventDefault()
    location.href = $(this).data 'url'

  $(window).resize( ->
    $('.bootsy_text_area').height $(window).height() - 210
  ).trigger 'resize'
