jQuery ->
  event_user_ids = []
  $('#event_user_name').autocomplete
    source: $('#event_user_name').data('autocomplete-source')
    select: (event, ui) ->
      event.preventDefault()
      $('#add_users').val "add"
      $(this).val ui.item.label
      $('#event_users').val ui.item.value
      id = $('#event_users').val()
      value = $('#event_user_name').val()
      $(this).val('')
      if (value)
        $('.user_event').append("<div class='user-event-value' id='user-"+id+"'><span class='remove-user-event'>x</span>" +value+ "</div>")
        event_user_ids.push(id)
        $('#event_users').val event_user_ids
        $('#remove_users').val ""
