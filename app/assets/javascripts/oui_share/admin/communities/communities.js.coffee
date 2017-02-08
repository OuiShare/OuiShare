jQuery ->
  community_event_ids = []
  $('#community_event_name').autocomplete
    source: $('#community_event_name').data('autocomplete-source')
    select: (event, ui) ->
      event.preventDefault()
      $(this).val ui.item.label
      $('#community_events_add').val ui.item.value
      id = $('#community_events_add').val()
      value = $('#community_event_name').val()
      $(this).val('')
      if (value)
        $('.event_community').append("<div class='event-community-value' id='event-"+id+"'><span class='remove-event-community'>x</span>" +value+ "</div>")
        community_event_ids.push(id)
        $('#community_events_add').val community_event_ids

  community_user_ids = []
  $('#community_user_name').autocomplete
    source: $('#community_user_name').data('autocomplete-source')
    select: (event, ui) ->
      event.preventDefault()
      $(this).val ui.item.label
      $('#community_users_add').val ui.item.value
      id = $('#community_users_add').val()
      value = $('#community_user_name').val()
      $(this).val('')
      if (value)
        $('.user_community').append("<div class='user-community-value' id='user-"+id+"'><span class='remove-user-community'>x</span>" +value+ "</div>")
        community_user_ids.push(id)
        $('#community_users_add').val community_user_ids
