jQuery ->
  project_user_ids = []
  $('#project_user_name').autocomplete
    source: $('#project_user_name').data('autocomplete-source')
    select: (event, ui) ->
      event.preventDefault()
      $(this).val ui.item.label
      $('#project_users_add').val ui.item.value
      id = $('#project_users_add').val()
      value = $('#project_user_name').val()
      $(this).val('')
      if (value)
        $('.user_project').append("<div class='user-project-value' id='user-"+id+"'><span class='remove-user-project'>x</span>" +value+ "</div>")
        project_user_ids.push(id)
        $('#project_users_add').val project_user_ids
