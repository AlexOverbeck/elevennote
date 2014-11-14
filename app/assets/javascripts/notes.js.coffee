class Note
  constructor: ->
    @handle_clicks()
    @resize_bootsy()

  handle_clicks: ->
    $('#notes li.note').on "click", (ev) ->
      ev.preventDefault()
      location.href = $(this).data 'url'

  resize_bootsy: ->
    $(window).resize( ->
      $('.bootsy_text_area').height $(window).height() - 210
    ).trigger 'resize'

$ ->
 new Note
