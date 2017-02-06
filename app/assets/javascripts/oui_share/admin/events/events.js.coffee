jQuery ->
  event_user_ids = []
  $('#event_user_name').autocomplete
    source: $('#event_user_name').data('autocomplete-source')
    select: (event, ui) ->
      event.preventDefault()
      $(this).val ui.item.label
      $('#event_users_add').val ui.item.value
      id = $('#event_users_add').val()
      value = $('#event_user_name').val()
      $(this).val('')
      if (value)
        $('.user_event').append("<div class='user-event-value' id='user-"+id+"'><span class='remove-user-event'>x</span>" +value+ "</div>")
        event_user_ids.push(id)
        $('#event_users_add').val event_user_ids

  event_community_ids = []
  $('#event_community_name').autocomplete
    source: $('#event_community_name').data('autocomplete-source')
    select: (event, ui) ->
      event.preventDefault()
      $(this).val ui.item.label
      $('#event_communities_add').val ui.item.value
      id = $('#event_communities_add').val()
      value = $('#event_community_name').val()
      $(this).val('')
      if (value)
        $('.community_event').append("<div class='user-community-value' id='community-"+id+"'><span class='remove-community-event'>x</span>" +value+ "</div>")
        event_community_ids.push(id)
        $('#event_communities_add').val event_community_ids
