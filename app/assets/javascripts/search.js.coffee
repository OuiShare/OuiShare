update_content = (url, query, tags, type) ->
  $.ajax
    method: 'POST'
    url: url
    data:
      search:
        query: query
        tags: tags
        type: type
    dataType: 'json'
    success: (data) ->
      $('#search_result > .container').html(data.attachmentPartial)

$(document).ready ->
  tags = $('.tagsinput').tagsInput
      defaultText: '+ Tag'
      height: 'auto'
      width: 'auto'
      delimiter: ';'
      onChange: () ->
        update_content $('#search_form').attr('action'), $('#search_query').val(), $('#search_tags').val(), $('#search_type').val()

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

  $('#search_query_header').autocomplete
    source: (request, response) ->
      $.ajax
        url: $('#search_query_header').attr('data-url')
        data:
          term: request.term
          type: $('#search_type_header').val()
        success: (data) ->
          response(data)
    select: (event, ui) ->
      event.preventDefault()
      $('#search_tags_header').val ui.item.value.toLowerCase()
      $('#search_query_header').val ''
      $('#search_form_header').submit()

  $('#search_form_header').submit (event) ->
    query = $('#search_query_header')

    if query.val().length > 0
      $('#search_tags_header').val query.val().toLowerCase()
      query.val ''

  $('#search_form').submit (event) ->
    event.preventDefault()

    _this = $(this)
    query = $('#search_query')
    tags = $('#search_tags')
    type = $('#search_type')

    if query.val().length > 0
      tags.addTag query.val().toLowerCase()
      query.val ''

    update_content _this.attr('action'), query.val(), tags.val(), type.val()
