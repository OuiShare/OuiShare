jQuery ->
  community_event_ids = []
  $('#community_event_name').autocomplete
    source: $('#community_event_name').data('autocomplete-source')
    select: (event, ui) ->
      event.preventDefault()
      $('#add_events').val "add"
      $(this).val ui.item.label
      $('#community_events').val ui.item.value
      id = $('#community_events').val()
      value = $('#community_event_name').val()
      $(this).val('')
      if (value)
        $('.event_community').append("<div class='event-community-value' id='event-"+id+"'><span class='remove-event-community'>x</span>" +value+ "</div>")
        community_event_ids.push(id)
        $('#community_events').val community_event_ids
        $('#remove_events').val ""
