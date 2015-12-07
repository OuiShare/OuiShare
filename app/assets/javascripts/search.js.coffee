$(document).ready ->
  tags = $('.tagsinput').tagsInput
      defaultText: '+ Tag'
      height: 'auto'
      width: 'auto'
      delimiter: ';'

  $('#search_tags_tag').hide()

  $('#search_query').keypress (event) ->
    _this = $(this)
    if (event.which == 13)
      event.preventDefault()
      tags.addTag _this.val()
      _this.val ''
  .autocomplete
    appendTo: '#autocomplete-content'
    source: (request, response) ->
      $.ajax
        url: $('#search_query').attr('data-url')
        data:
          term: request.term
          type: $('#search_type').val()
        success: (data) ->
          response(data)
    select: (event, ui) ->
      event.preventDefault()
      tags.addTag ui.item.value
      $('#search_query').val ''
